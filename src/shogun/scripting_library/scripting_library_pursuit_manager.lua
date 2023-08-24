
----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	PURSUIT MANAGER
--
--	The Pursuit Manager is an automated way of making a script-controlled unit carry out an activity, but react if the player approaches. If approached, the
--  unit will turn and attack the player, eventually getting released to the AI so that they behave somewhat intelligently. If the player moves their units
--  away, or (optionally) kites the subject unit too far from a given co-ordinate (e.g. the river crossing they were assigned to guard), then the subject unit
--  will abandon the chase and resume a supplied activity.
--
--  PARAMETERS
--
--	pursuit_manager:new(...)
--	
--	BATTLE_MANAGER a link to your battle manager object
--	STRING a name describing your pursuit manager. This should be unique among pursuit managers in your script, otherwise Bad Things Will Happen
--	UNIT the subject unit
--	UNITCONTROLLER a controller attached to the subject unit (and no other, or you will see multiple units reacting)
--	ARMIES the armies collection that the subject unit considers the enemy. In most scenarios this will be the player's armies
--  NUMBER interception radius - the radius in metres at which the subject unit will respond to the enemy
--  FUNCTION abandon callback - a function block that gets called when the subject unit abandons it's pursuit. This should at the very least instruct the unit to do some other activity
--  optional NUMBER abandon radius - the radius in metres at which the unit will give up a chase. This must be at least 10m greater than the interception radius
--  optional BOOLEAN guard mode - if true the subject unit will not move a certain distance from the guard point, if false (default) the unit will pursue until it loses touch with the enemy
--  optional NUMBER guard radius - the distance the subject unit will be allowed to wander from it's guard point. Defaults to 10m
--  optional VECTOR guard point - the position the unit will guard in pursuit mode. If not supplied, the position of the subject unit at the point of interception is used
--  optional FUNCTION interception callback - if a callback is supplied, it gets triggered at the interception point when the unit starts a pursuit
--  optional BOOLEAN stop on rout - if true (default), manager will stop if the subject unit routs. If false it will monitor if the unit comes back to life and attempt to retake control
--  optional FUNCTION completion callback - if a callback is supplied, it gets called if the manager stops itself (e.g. the subject unit routs or is killed)
--
--  pursuit_manager:start()
--
--  Call this to start the manager
--  
--  <no parameters>
--
--
--  pursuit_manager:stop()
--
--  Stops the manager
--  
--  <no parameters>
--
--
--  pursuit_manager:set_debug(...)
--
--  Sets this pursuit manager into debug mode. Pursuit managers in debug mode print information about what they're doing to the console
--  
--  optional BOOLEAN value - debug on or off, defaults to true
--
--
--  pursuit_manager:set_debug_all(...)
--
--  Sets ALL pursuit managers into debug mode. Setting this to true on any pursuit manager sets all pursuit managers to print debug information
--  
--  optional BOOLEAN value - debug on or off, defaults to true
-----------------------------------------------------------------------------------------------------------

--[[

	SAMPLE USAGE:
	
	-- Make Unit_Infantry_01 guard point POS_Guard_Infantry_01. If any of the player's units come with 100m
	-- the unit will move to intercept. If the player's units then retreat to more than 125m away or the unit
	-- finds itself more than 50m from POS_Guard_Infantry_01, break off and go back to guard the point. Note that
	-- starting this pursuit manager won't move the unit to the point initially, the pursuit manager doesn't give
	-- any instructions to the unit until the first interception happens. This is why we give the seperate move order
	-- to the unitcontroller. We also set all pursuit managers into debug mode here.
		
	PM_Infantry_01 = pursuit_manager:new(
												bm,
												"Unit_Infantry_01",
												Unit_Infantry_01,
												Unitcontroller_Infantry_01,
												Armies_Player,
												100,
												function() Unitcontroller_Infantry_01:goto_location_angle_width(POS_Guard_Infantry_01, Guard_Infantry_01_Orientation, Guard_Infantry_01_Width) end,
												125,
												true,
												50,
												POS_Guard_Infantry_01
											);

	PM_Infantry_01:set_debug_all();
	PM_Infantry_01:start();
	
	Unitcontroller_Infantry_01:goto_location_angle_width(POS_Guard_Infantry_01, Guard_Infantry_01_Orientation, Guard_Infantry_01_Width);
	
	
	
	
	SAMPLE USAGE:
	
	-- Unit_Cavalry_04 is moving across the battlefield to POS_Guard_Cavalry_04. If it is approached by any 
	-- of the player's units (within 80m), it will turn to attack. If the player retreats all their units to 
	-- more than 90m (interception radius + 10 is the default abandon radius, so 90m in this case) the Cavalry
	-- unit will abandon the chase and move to POS_Guard_Cavalry_04, which could be anywhere. Should the cavalry
	-- unit be approached again, it will respond as before. It isn't guarding any point so could theoretically
	-- be kited across the whole map. When the cavalry unit gets to within 30m of POS_Guard_Cavalry_04, stop
	-- the monitor. 

	PM_Cavalry_04 = pursuit_manager:new(
												bm,
												"Unit_Cavalry_04",
												Unit_Cavalry_04,
												Unitcontroller_Cavalry_04,
												Armies_Player,
												80,
												function() Unitcontroller_Cavalry_04:goto_location_angle_width(POS_Guard_Cavalry_04, Guard_Cavalry_04_Orientation, Guard_Cavalry_04_Width) end,
											);

	PM_Cavalry_04:start();
	
	Unitcontroller_Cavalry_04:goto_location_angle_width(POS_Guard_Cavalry_04, Guard_Cavalry_04_Orientation, Guard_Cavalry_04_Width);
	
	bm:watch(
				function() return Unit_Cavalry_04:position():distance(POS_Guard_Cavalry_04) < 30 end, 
				0, 
				function() PM_Cavalry_04:stop() end
			);
	
]]


PURSUIT_MANAGER_LOST_UNIT = 1;
PURSUIT_MANAGER_PURSUED_TOO_FAR = 2;
PURSUIT_MANAGER_STARTING = 3;
PURSUIT_MANAGER_UNIT_IS_DEAD_OR_ROUTING = 10;
PURSUIT_MANAGER_UNIT_IS_NO_LONGER_ROUTING = 11;
__pursuit_manager_debug = false;


pursuit_manager = {
	bm = nil,
	name = "",
	unit = nil,
	unitcontroller = nil,
	enemy_armies = nil,
	interception_radius = 0,
	abandon_callback = nil,
	abandon_radius = 0,
	should_guard_point = false,
	guard_radius = 10,
	guard_vector = nil,
	use_guard_vector = false,
	interception_callback = nil,
	stop_on_rout = true,
	completion_callback = nil,
	is_intercepting = false,
	is_debug = false,
	is_running = false,
	is_naval = false,
	intercept_time = 10000
}


function pursuit_manager:new(
								new_bm,
								new_name,
								new_unit,
								new_unitcontroller,
								new_enemy_armies,
								new_interception_radius,
								new_abandon_callback,
								new_abandon_radius,
								new_should_guard_point,
								new_guard_radius,
								new_guard_vector,
								new_interception_callback,
								new_stop_on_rout,
								new_completion_callback
							)

	-- type check our startup parameters
	
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Pursuit Manager: no name given or name invalid");
		
		return false;
	end;
	
	if not is_unit(new_unit) and not is_ship(new_unit) then
		new_bm:out("new_unit is " .. tostring(new_unit));
		new_bm:out("is_ship(new_unit) is " .. tostring(is_ship(new_unit)));
		
		new_bm:out("Couldn't create Pursuit Manager " .. new_name .. ": no unit given or unit invalid");
		
		return false;
	end;
	
	if not is_unitcontroller(new_unitcontroller) and not is_shipcontroller(new_unitcontroller) then
		new_bm:out("Couldn't create Pursuit Manager " .. new_name .. ": no unitcontroller given or unitcontroller invalid");
		
		return false;
	end;
	
	if (is_ship(new_unit) and is_unitcontroller(new_unitcontroller)) or (is_unit(new_unit) and is_shipcontroller(new_unitcontroller)) then
		new_bm:out("Couldn't create Pursuit Manager " .. new_name .. ": supplied a ship and a unitcontroller, or vice-versa!");
		
		return false;
	end;
	
	if not is_armies(new_enemy_armies) then
		new_bm:out("Couldn't create Pursuit Manager " .. new_name .. ": no enemy_armies given or enemy_armies invalid");
		
		return false;
	end;
	
	if not is_number(new_interception_radius) then
		new_bm:out("Couldn't create Pursuit Manager " .. new_name .. ": no interception radius given or radius invalid");
		
		return false;
	end;
	
	if not is_function(new_abandon_callback) then
		new_bm:out("Couldn't create Pursuit Manager " .. new_name .. ": no abandon callback given or callback invalid");
		
		return false;
	end;
	
	pm = {};
	setmetatable(pm, self);
	self.__index = self;
	self.__tostring = function() return TYPE_PURSUIT_MANAGER end;
	
	pm.bm = new_bm;
	pm.name = "Pursuit_Manager_" .. new_name;
	pm.unit = new_unit;
	pm.unitcontroller = new_unitcontroller;
	pm.enemy_armies = new_enemy_armies;
	pm.interception_radius = new_interception_radius;
	pm.abandon_callback = new_abandon_callback;
	pm.abandon_radius = new_interception_radius + 10;
	pm.should_guard_point = false;
	pm.guard_radius = 10;
	pm.guard_vector = nil;
	pm.interception_callback = nil;
	pm.stop_on_rout = true;
	pm.completion_callback = nil;
	pm.is_intercepting = false;
	pm.is_debug = false;
	pm.is_running = false;
	pm.intercept_time = 10000;
	
	if is_unit(new_unit) then
		pm.is_naval = false;
	else
		pm.is_naval = true;
	end;
	
	--sanity check our optional parameters

	if new_abandon_radius then
		if not is_number(new_abandon_radius) then
			new_bm:out(pm.name .. " warning: abandon radius parameter is junk, ignoring");
		else
			if pm.abandon_radius > new_abandon_radius then
				new_bm:out(pm.name .. " warning: abandon radius parameter needs to be at least 10m larger than interception radius, setting it so");
			else
				pm.abandon_radius = new_abandon_radius;
			end;
		end;
	end;
	
	if new_should_guard_point then
		if not is_boolean(new_should_guard_point) then
			new_bm:out(pm.name .. " warning: should_guard_point parameter is junk, ignoring");
		else
			if not is_vector(new_guard_vector) then
				if not is_nil(new_guard_vector) then
					new_bm:out(pm.name .. " warning: guard vector parameter is junk, ignoring");
				else
					pm.use_guard_vector = false;
					pm.guard_vector = battle_vector:new();
				end;
			else
				pm.should_guard_point = new_should_guard_point;
				pm.guard_vector = new_guard_vector;
				pm.use_guard_vector = true;
			end;
		end;
	end;
	
	if pm.should_guard_point then
		if not is_number(new_guard_radius) or new_guard_radius <= 10 then
			new_bm:out(pm.name .. " warning: guard radius parameter is junk or less than 10m, using 10m");
		else
			pm.guard_radius = new_guard_radius;
		end;
	end;
		
	if new_interception_callback then
		if not is_function(new_interception_callback) then
			new_bm:out(pm.name .. " warning: interception callback parameter is junk, ignoring");
		else
			pm.interception_callback = new_interception_callback;
		end;
	end;
	
	if not is_nil(new_stop_on_rout) then
		if not is_bool(new_stop_on_rout) then
			new_bm:out(pm.name .. " warning: stop on rout parameter is junk, ignoring");
		else
			pm.stop_on_rout = new_stop_on_rout;
		end;
	end;
	
	if new_completion_callback then
		if not is_function(new_completion_callback) then
			new_bm:out(pm.name .. " warning: completion callback parameter is junk, ignoring");
		else
			pm.completion_callback = new_completion_callback;
		end;
	end;
	
	return pm;
end;


function pursuit_manager:set_debug(value)
	if self.is_running then
		self.bm:out(self.name .. " warning: trying to change debug state of a running pursuit manager. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		self.is_debug = value;
	else
		self.is_debug = true;
	end;
end;


function pursuit_manager:set_debug_all(value)
	if self.is_running then
		self.bm:out(self.name .. " warning: trying to change global debug state of a running pursuit manager. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		__pursuit_manager_debug = value;
	else
		__pursuit_manager_debug = true;
	end;
end;


function pursuit_manager:set_stop_on_intercept(value)
	if not is_boolean(value) then
		value = true;
	end;
	
	self.stop_on_intercept = value;
end;


function pursuit_manager:set_intercept_time(value)
	if not is_number(value) or value < 0 then
		self.bm:out(self.name .. " warning: set_intercept_time called with invalid parameter, using 10000ms instead");
		
		value = 10000;
	end;
	
	self.intercept_time = value;
end;


function pursuit_manager:start()
	if self.is_running then
		self.bm:out(self.name .. " error: trying to start a pursuit manager that is already running");
		return false;
	end;
	
	self.is_running = true;
	self:abandon(PURSUIT_MANAGER_STARTING);
end;


function pursuit_manager:handle_unit_routing()
	if self.stop_on_rout then
		self.bm:watch(
						function() 
							if self.is_naval then
								return Is_Ship_Routing_Or_Dead(self.unit) 
							else
								return Is_Unit_Routing_Or_Dead(self.unit) 
							end;
						end,
						0,
						function() 
									self.unitcontroller:release_control();
									self:stop(PURSUIT_MANAGER_UNIT_IS_DEAD_OR_ROUTING)
								end,
						self.name
					);
	else
		self.bm:watch(
						function() 
							if self.is_naval then
								return Is_Ship_Routing_Or_Dead(self.unit) 
							else
								return Is_Unit_Routing_Or_Dead(self.unit) 
							end;
						end,
						0,
						function() 
									self.bm:watch(
													function()
														if self.is_naval then
															return Is_Ship_Shattered_Or_Dead(self.unit) 
														else
															return Is_Unit_Shattered_Or_Dead(self.unit) 
														end;
													end,
													0,
													function() self:stop(PURSUIT_MANAGER_UNIT_IS_DEAD_OR_ROUTING) end,
													self.name
												);
									self.bm:watch(
													function() 													
														if self.is_naval then
															return not Is_Ship_Routing_Or_Dead(self.unit) 
														else
															return not Is_Unit_Routing_Or_Dead(self.unit) 
														end;
													end,
													0,
													function() self:abandon(PURSUIT_MANAGER_UNIT_IS_NO_LONGER_ROUTING) end
												)
								end,
						self.name
					);
	end;
end;


function pursuit_manager:intercept_if_running()
	if self.is_running and not self.is_intercepting then
		self:intercept();
	end;
end;


function pursuit_manager:intercept()
	if not self.is_running then
		self.bm:out(self.name .. ":intercept() called when pursuit manager isn't running! This is bad!");
		return false;
	end;
	
	if self.is_intercepting then
		self.bm:out(self.name .. " warning: intercept() called when already intercepting, disregarding")
		
		return false;
	end;
	
	self.is_intercepting = true;
	
	self.bm:remove_process(self.name);
		
	self:handle_unit_routing();	
	
	-- send the subject unit to attack the nearest unit, then release it to the AI after 10s (or whatever intercept time is)
	
	if self.is_naval then
		self.unitcontroller:attack_ship(Get_Closest_Standing_Ship_Armies(self.unit, self.enemy_armies), true);
	else
		self.unitcontroller:attack_unit(Get_Closest_Standing_Unit_Armies(self.unit, self.enemy_armies), true, true);
	end;
	
	if self.is_debug or __pursuit_manager_debug then
		self.bm:out(self.name .. " intercept triggered");
		if self.is_naval then
			self.bm:out("  ..ship has been told to attack " .. tostring(Get_Closest_Standing_Ship_Armies(self.unit, self.enemy_armies)) .. " at position " .. Vector_To_String(Get_Closest_Standing_Ship_Armies(self.unit, self.enemy_armies):position()));
		else
			self.bm:out("  ..unit has been told to attack " .. tostring(Get_Closest_Standing_Unit_Armies(self.unit, self.enemy_armies)) .. " at position " .. Vector_To_String(Get_Closest_Standing_Unit_Armies(self.unit, self.enemy_armies):position()));
		end;
	end;
	
	self.bm:register_callback(
								function()
										if self.is_debug or __pursuit_manager_debug then
											self.bm:out(self.name .. " : releasing unit to AI");
										end;
										self.unitcontroller:release_control();
										
										if self.stop_on_intercept then
											if self.is_debug or __pursuit_manager_debug then
												self.bm:out(self.name .. " : stopping as stop_on_intercept is set");
											end;
											self:stop();
										end;
									end, 
								self.intercept_time, 
								self.name
							);
							
	
	--if not self.stop_on_intercept then
	
		-- If we don't have a guard vector, then we have to watch for the subject unit losing it's target. If we do,
		-- we have to make sure it doesn't wander too far from the guard vector as well

		self.bm:watch(
					function() 
								if self.is_naval then
									return not Ship_Close_To_Standing_Armies(self.unit, self.enemy_armies, self.abandon_radius)
								else
									return not Unit_Close_To_Standing_Armies(self.unit, self.enemy_armies, self.abandon_radius)
								end
					end,
					0,
					function() self:abandon(PURSUIT_MANAGER_LOST_UNIT) end,
					self.name
				);
	
		if self.should_guard_point then
	
		-- if we should not use the guard vector, then use the current position of the unit instead
			if not self.use_guard_vector then
				self.guard_vector:set(self.unit:position():get_x(), self.unit:position():get_y(), self.unit:position():get_z());
			
				if self.is_debug or __pursuit_manager_debug then
					self.bm:out("  ..unit is guarding the interception point " .. Vector_To_String(self.guard_vector));
				end;
			else
				if self.is_debug or __pursuit_manager_debug then
					self.bm:out("  ..unit is guarding the specified point " .. Vector_To_String(self.guard_vector));
				end;
			end;
	
			self.bm:watch(
						function() return self.unit:position():distance(self.guard_vector) > self.abandon_radius end,
						0,
						function() self:abandon(PURSUIT_MANAGER_PURSUED_TOO_FAR) end,
						self.name
					);
		end;
	--end;
	
	if is_function(self.interception_callback) then
		self.interception_callback();
	end;
end;


function pursuit_manager:abandon(reason)
	if not self.is_running then
		self.bm:out(self.name .. ":abandon() called when pursuit manager isn't running! This is bad!");
		return false;
	end;
	
	if not self.is_intercepting and not reason == PURSUIT_MANAGER_STARTING then
		self.bm:out(self.name .. " warning: abandon() called when not intercepting, disregarding")
		
		return false;
	end;
	
	self.is_intercepting = false;

	if self.is_debug or __pursuit_manager_debug then
		if reason == PURSUIT_MANAGER_LOST_UNIT then
			self.bm:out(self.name .. " abandoning pursuit, lost contact with enemy units");
		elseif reason == PURSUIT_MANAGER_PURSUED_TOO_FAR then
			self.bm:out(self.name .. " abandoning pursuit, pursued too far from guard vector");
		elseif reason == PURSUIT_MANAGER_STARTING then
			self.bm:out(self.name .. " is starting");
		end;
	end;
	
	self.bm:remove_process(self.name);
		
	if reason ~= PURSUIT_MANAGER_STARTING then
		self.abandon_callback();
	end;
	
	self:handle_unit_routing();	

	-- if we don't have a guard vector, move to intercept when we're close to an enemy unit. If we do, move to
	-- intercept when we're close to it as well
	
	self.unitcontroller:take_control();
		
	if self.should_guard_point and self.use_guard_vector then
		if self.is_naval then
			self.bm:watch(
						function() 
									return Ship_Close_To_Standing_Armies(self.unit, self.enemy_armies, self.interception_radius) and 
									self.unit:position():distance(self.guard_vector) < self.abandon_radius
								end,
						0,
						function() self:intercept() end,
						self.name
					);
		else
			self.bm:watch(
						function() 
									return Unit_Close_To_Standing_Armies(self.unit, self.enemy_armies, self.interception_radius) and 
									self.unit:position():distance(self.guard_vector) < self.abandon_radius
								end,
						0,
						function() self:intercept() end,
						self.name
					);
		end;
	else
		if self.is_naval then
			self.bm:watch(
						function() return Ship_Close_To_Standing_Armies(self.unit, self.enemy_armies, self.interception_radius) end,
						0,
						function() self:intercept() end,
						self.name
					);
		else
			self.bm:watch(
						function() return Unit_Close_To_Standing_Armies(self.unit, self.enemy_armies, self.interception_radius) end,
						0,
						function() self:intercept() end,
						self.name
					);
		end;
	end;
end;


function pursuit_manager:stop_if_running(reason)
	if self.is_running then
		self:stop(reason);
	end;
end;


function pursuit_manager:stop(reason)
	if not self.is_running then
		self.bm:out(self.name .. " warning : trying to stop a pursuit manager that isn't running!");
		
		return false;
	end;
	
	if self.is_debug or __pursuit_manager_debug then
		if reason == PURSUIT_MANAGER_UNIT_IS_DEAD_OR_ROUTING then
			self.bm:out(self.name .. " is stopping because its unit is routing or dead");
		else
			self.bm:out(self.name .. " is stopping");
		end;
	end;
	
	self.is_intercepting = false;
	self.is_running = false;
	self.bm:remove_process(self.name);
	
	if reason and is_function(self.completion_callback) then
		self.completion_callback();
	end;
end;