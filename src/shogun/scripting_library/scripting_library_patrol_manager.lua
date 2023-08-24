
----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	PATROL MANAGER
--
--	The Patrol Manager is an automated way of making a script-controlled unit move along a series of waypoints to a destination. If that unit comes across an
--  enemy it will give chase for a distance, before returning to the patrol route. The patrol manager is built on top of the pursuit manager.
--
--  PARAMETERS
--
--	patrol_manager:new(...)
--	
--	BATTLE_MANAGER a link to your battle manager object
--	STRING a name describing your patrol manager. This should be unique among patrol managers in your script, otherwise Bad Things Will Happen
--	UNIT the subject unit
--	UNITCONTROLLER a controller attached to the subject unit (and no other, or you will see multiple units reacting)
--	ARMIES the armies collection that the subject unit considers the enemy. In most scenarios this will be the player's armies
--  NUMBER interception radius - the radius in metres at which the subject unit will respond to the enemy
--  optional NUMBER abandon radius - the radius in metres at which the unit will give up a chase. This must be at least 10m greater than the interception radius
--	optional NUMBER guard radius - the distance the subject unit will be allowed to wander from the point it picked the unit up at. Defaults to 100m
--  optional FUNCTION interception callback - if a callback is supplied, it gets triggered at the interception point when the unit starts a pursuit
--  optional FUNCTION abandon callback - if a callback is supplied, it gets triggered if the unit abandons a pursuit
--  optional FUNCTION completion callback - if a callback is supplied, it gets called if the manager stops itself (e.g. the subject unit is killed, or completes the patrol)
--  optional BOOLEAN stop on rout - if false, the patrol manager will pick up the unit again if it un-routs, otherwise it will complete. Default is true
--
--
--  patrol_manager:add_waypoint(...)
--
--  Call this to add a waypoint to the patrol list. You must add at least one waypoint to a patrol manager before starting it
--
--  PARAMETERS
--  
--	VECTOR position to move to
--	optional BOOLEAN should run - if true, the unit will run to this point, otherwise it will walk
--	optional NUMBER orientation in degrees the unit will stand face at the destination. Defaults to 0
--  optional NUMBER width in metres that the unit take at the destination. If this isn't set then a default width over the patrol manager needs to have already been set using set_width()
--
--
--  patrol_manager:set_width(...)
--
--  Sets a default width for the subject unit over the whole of the patrol path. A default width must be set if you plan to omit any individual widths from waypoints.
--
--	PARAMETERS
--
--	NUMBER default width to set
--
--
--	patrol_manager:loop(...)
--
--	Sets the patrol to loop. A looping patrol will go back to the first waypoint once the last has been reached, and as such will never complete unless the unit dies.
--
--	PARAMETERS
--
--	optional BOOLEAN value to set. Defaults to true
--
--
--  patrol_manager:start()
--
--  Call this to start the manager
--  
--  <no parameters>
--
--
--  patrol_manager:restart()
--
--  Stops the manager if necessary, and starts it back at the beginning again
--  
--  <no parameters>
--
--
--  patrol_manager:stop()
--
--  Stops the manager
--  
--  <no parameters>
--
--
--  patrol_manager:set_debug(...)
--
--  Sets this patrol manager into debug mode. Patrol managers in debug mode print information about what they're doing to the console
--  
--  optional BOOLEAN value - debug on or off, defaults to true
--
--
--  patrol_manager:set_debug_all(...)
--
--  Sets ALL patrol managers into debug mode. Setting this to true on any patrol manager sets all patrol managers to print debug information
--  
--  optional BOOLEAN value - debug on or off, defaults to true
-----------------------------------------------------------------------------------------------------------

--[[

	SAMPLE USAGE:
	
	-- Make Unit_Infantry_03 move along a series of 4 waypoints. It will respond to any enemy units that come within 100m,
	-- and will run between the second and third waypoints.
	
		
	POS_Infantry_03_Patrol_01 = battle_vector:new();
	POS_Infantry_03_Patrol_01:set(25, 0, 92);

	POS_Infantry_03_Patrol_02 = battle_vector:new();
	POS_Infantry_03_Patrol_02:set(25, 0, 200);

	POS_Infantry_03_Patrol_03 = battle_vector:new();
	POS_Infantry_03_Patrol_03:set(-60, 0, 300);

	POS_Infantry_03_Patrol_04 = battle_vector:new();
	POS_Infantry_03_Patrol_04:set(-180, 0, 360);

	PM_Infantry_03 = patrol_manager:new(
										bm,
										"Unit_Infantry_03",
										Unit_Infantry_03,
										Unitcontroller_Infantry_03,
										Armies_Oda,
										100
									);

	PM_Infantry_03:set_debug_all();	
	PM_Infantry_03:set_width(20);
	PM_Infantry_03:add_waypoint(POS_Infantry_03_Patrol_01);
	PM_Infantry_03:add_waypoint(POS_Infantry_03_Patrol_02);
	PM_Infantry_03:add_waypoint(POS_Infantry_03_Patrol_03, true);
	PM_Infantry_03:add_waypoint(POS_Infantry_03_Patrol_04);
	PM_Infantry_03:start();
	
	
	
	SAMPLE USAGE:
	
	-- Unit_Cavalry_01 walks in a square continuously, responding to any enemy that comes with 50m, pursuing them until
	-- they're either 100m away or Unit_Cavalry_01 is 100m from where it was when it picked the enemy up. Cavalry_01_Is_Intercepting(),
	-- Cavalry_01_Is_Abandoning() and Cavalry_01_Completed_Patrol() get called at the appropriate times. The manager will not
	-- stop on rout, so if Unit_Cavalry_01 routs and then comes back to life the manager will send the unit back on patrol.

	POS_Cavalry_01_Patrol_01 = battle_vector:new();
	POS_Cavalry_01_Patrol_01:set(0, 0, 0);

	POS_Cavalry_01_Patrol_02 = battle_vector:new();
	POS_Cavalry_01_Patrol_02:set(100, 0, 0);

	POS_Cavalry_01_Patrol_03 = battle_vector:new();
	POS_Cavalry_01_Patrol_03:set(100, 0, 100);

	POS_Cavalry_01_Patrol_04 = battle_vector:new();
	POS_Cavalry_01_Patrol_04:set(0, 0, 100);

	PM_Cavalry_01 = patrol_manager:new(
										bm,
										"Unit_Cavalry_01",
										Unit_Cavalry_01,
										Unitcontroller_Cavalry_01,
										Armies_Oda,
										50,
										100,
										100,
										function() Unit_Cavalry_01_Is_Intercepting() end,
										function() Unit_Cavalry_01_Is_Abandoning() end,
										function() Unit_Cavalry_01_Completed_Patrol() end,
										false
									);
									
	PM_Cavalry_01:add_waypoint(POS_Cavalry_01_Patrol_01, false, 90, 30);
	PM_Cavalry_01:add_waypoint(POS_Cavalry_01_Patrol_02, false, 180, 30);
	PM_Cavalry_01:add_waypoint(POS_Cavalry_01_Patrol_03, false, 270, 30);
	PM_Cavalry_01:add_waypoint(POS_Cavalry_01_Patrol_04, false, 360, 30);
	PM_Cavalry_01:loop();
	PM_Cavalry_01:start();
]]



PATROL_MANAGER_REACHED_DESTINATION = 1;
PATROL_MANAGER_PURSUED_TOO_FAR = 2;
PATROL_MANAGER_STARTING = 3;
PATROL_MANAGER_RESTARTING = 4;
PATROL_MANAGER_UNIT_IS_DEAD_OR_ROUTING = 10;
PATROL_MANAGER_UNIT_IS_NO_LONGER_ROUTING = 11;
__patrol_manager_debug = false;

PATROL_MANAGER_WAYPOINT_REACHED_THRESHOLD = 35;


patrol_manager = {
	bm = nil,
	name = "",
	unit = nil,
	unitcontroller = nil,
	enemy_armies = nil,
	--opt
	interception_radius = 0,
	abandon_radius = 0,
	guard_radius = 100,
	interception_callback = nil,
	abandon_callback = nil,
	completion_callback = nil,
	callback_on_rout = true,
	stop_on_rout = true,
	--non parameter
	stop_on_intercept = false,
	is_debug = false,
	is_naval = false,
	intercept_time = nil,
	waypoints = {},
	current_waypoint = 1,
	width = 0,
	pursuit_manager = nil,
	is_running = false,
	should_loop = false
}


function patrol_manager:new(
								new_bm,
								new_name,
								new_unit,
								new_unitcontroller,
								new_enemy_armies,
								new_interception_radius,
								--opt
								new_abandon_radius,
								new_guard_radius,
								new_interception_callback,
								new_abandon_callback,
								new_completion_callback,
								new_stop_on_rout
							)

	-- type check our startup parameters
	
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Patrol Manager: no name given or name invalid");
		
		return false;
	end;
	
	local is_naval = false;
	
	if not is_unit(new_unit) then
		if is_ship(new_unit) then
			is_naval = true;
		else
			new_bm:out("Couldn't create Patrol Manager " .. new_name .. ": no unit given or unit invalid");
		
			return false;
		end;
	end;
	
	if not is_unitcontroller(new_unitcontroller) then
		if not (is_shipcontroller(new_unitcontroller) and is_naval) then
			new_bm:out("Couldn't create Patrol Manager " .. new_name .. ": no unitcontroller given or unitcontroller invalid");
		
			return false;
		end;
	end;
	
	if not is_armies(new_enemy_armies) then
		new_bm:out("Couldn't create Patrol Manager " .. new_name .. ": no enemy_armies given or enemy_armies invalid");
		
		return false;
	end;
	
	if not is_number(new_interception_radius) then
		new_bm:out("Couldn't create Patrol Manager " .. new_name .. ": no interception radius given or radius invalid");
		
		return false;
	end;
	
	if is_naval then
		PATROL_MANAGER_WAYPOINT_REACHED_THRESHOLD = 50;
	end;
		
	pm = {};
	setmetatable(pm, self);
	self.__index = self;
	self.__tostring = function() return TYPE_PATROL_MANAGER end;
	
	pm.bm = new_bm;
	pm.name = "Patrol_Manager_" .. new_name;
	pm.unit = new_unit;
	pm.unitcontroller = new_unitcontroller;
	pm.enemy_armies = new_enemy_armies;
	pm.interception_radius = new_interception_radius;
	--optional parameters
	pm.abandon_radius = new_interception_radius + 10;
	pm.guard_radius = 100;
	pm.interception_callback = nil;
	pm.abandon_callback = nil;
	pm.completion_callback = nil;
	pm.callback_on_rout = true;
	pm.stop_on_rout = true;
	--not parameters
	pm.stop_on_intercept = false;
	pm.is_debug = false;
	pm.is_naval = is_naval;
	pm.intercept_time = nil;
	pm.waypoints = {};
	pm.current_waypoint = 1;
	pm.width = 0;
	pm.pursuit_manager = nil;
	pm.is_running = false;
	pm.should_loop = false;

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
	
	if new_guard_radius then
		if not is_number(new_guard_radius) or new_guard_radius < 0 then
			new_bm:out(pm.name .. " warning: guard radius parameter is junk, ignoring");
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
	
	if new_abandon_callback then
		if not is_function(new_abandon_callback) then
			new_bm:out(pm.name .. " warning: interception callback parameter is junk, ignoring");
		else
			pm.abandon_callback = new_abandon_callback;
		end;
	end;
	
	if new_completion_callback then
		if not is_function(new_completion_callback) then
			new_bm:out(pm.name .. " warning: interception callback parameter is junk, ignoring");
		else
			pm.completion_callback = new_completion_callback;
		end;
	end;
	
	if not is_nil(new_stop_on_rout) then
		if not is_bool(new_stop_on_rout) then
			new_bm:out(pm.name .. " warning: stop on rout parameter is junk, ignoring");
		else
			pm.stop_on_rout = new_stop_on_rout;
		end;
	end;
	
	return pm;
end;


function patrol_manager:set_stop_on_intercept(value)
	if not is_boolean(value) then
		value = true;
	end;
	
	self.stop_on_intercept = value;
end;


function patrol_manager:set_callback_on_rout(value)
	if not is_boolean(value) then
		value = true;
	end;
	
	self.callback_on_rout = value;
end;


function patrol_manager:set_width(width)
	if not width or not is_number(width) or width <= 0 then
		self.bm:out(self.name .. ":set_width() error : no width supplied or width invalid");
		return false;
	end;
	
	self.width = width;
end;


function patrol_manager:set_intercept_time(t)
	self.intercept_time = t;
end;


function patrol_manager:add_waypoint(new_vector, new_should_run, new_orientation, new_width)
	local BOOL_Vector_Mode = true;
	
	if is_vector(new_vector) then
		BOOL_Vector_Mode = true;
	elseif (is_unit(new_vector) or is_ship(new_vector)) then
		BOOL_Vector_Mode = false;
	else
		self.bm:out(self.name .. ":add_waypoint error : no vector or unit/ship supplied, object is " .. tostring(new_vector));
		return false;		
	end;
	
	local waypoint = {};
	
	if not is_nil(new_should_run) then
		if not is_boolean(new_should_run) then
			self.bm:out(self.name .. ":add_waypoint warning : should run flag is junk, ignoring");
		end;
	else
		new_should_run = false;			
	end;
	
	if not new_orientation or not is_number(new_orientation) then
		new_orientation = 0;
	end;
	
	if not new_width or not is_number(new_width) or new_width <= 0 then
		if self.width <= 0 then
			self.bm:out(self.name .. ":add_waypoint error : no valid width supplied and no default width set");
			return false;
		else
			new_width = self.width;
		end;
	end;
	
	if BOOL_Vector_Mode then
		if self.is_debug or __patrol_manager_debug then 
			self.bm:out(self.name .. " adding waypoint vector " .. Vector_To_String(new_vector) .. ", orient " .. new_orientation .. ", width " .. new_width .. " and running " .. tostring(new_should_run));
		end;
	
		waypoint = {vector = new_vector, should_run = new_should_run, orientation = new_orientation, width = new_width};
	else
		if self.is_debug or __patrol_manager_debug then 
			self.bm:out(self.name .. " adding waypoint unit/ship " .. new_vector:name() .. " at " .. Vector_To_String(new_vector:position()) .. ", running " .. tostring(new_should_run));
		end;
	
		waypoint = {vector = new_vector, should_run = new_should_run, orientation = new_orientation, width = new_width};	
	end;
	
	table.insert(self.waypoints, waypoint);
end;


function patrol_manager:loop(value)
	if self.is_running then
		self.bm:out(self.name .. " warning : trying to change loop value of a running patrol manager. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		self.should_loop = value;
	else
		self.should_loop = true;
	end;
end;


function patrol_manager:restart()
	if self.is_running then
		self:stop();
	end;

	self.current_waypoint = 0;
	
	if self.is_debug or __patrol_manager_debug then
		self.bm:out(self.name .. " restarting");
	end;
	
	self:start(PATROL_MANAGER_RESTARTING);
end;


function patrol_manager:start(reason)
	if self.is_running then
		self.bm:out(self.name .. " error: trying to start a patrol manager that is already running");
		return false;
	end;

	if #self.waypoints == 0 then
		self.bm:out(self.name .. " error: trying to start patrol manager before adding any waypoints!");
		return false;
	end;
	
	if self.is_debug or __patrol_manager_debug then
		if not (reason == PATROL_MANAGER_RESTARTING) then
			self.bm:out(self.name .. " starting");
		end;
	end;
	
	self.is_running = true;

	self:start_new_pursuit_manager();
	
	self:move_to_current_waypoint();
end;


function patrol_manager:move_to_next_waypoint()
	if self.current_waypoint >= #self.waypoints then
		if self.should_loop then
			self.current_waypoint = 0;
		else
			self:complete(PATROL_MANAGER_REACHED_DESTINATION);
			return;
		end;
	end;
	
	
	self.current_waypoint = self.current_waypoint + 1;
	self.pursuit_manager:stop();
	
	self:start_new_pursuit_manager();
	
	self:move_to_current_waypoint();
end;


function patrol_manager:start_new_pursuit_manager()
	self.pursuit_manager = pursuit_manager:new(
												self.bm,
												self.name,
												self.unit,
												self.unitcontroller,
												self.enemy_armies,
												self.interception_radius,
												function() self:abandon_pursuit() end,
												self.abandon_radius,
												true,
												self.guard_radius,
												nil,
												function() self:begin_pursuit() end,
												self.stop_on_rout,
												function() self:unit_routed() end
											);
											
	if self.is_debug or __patrol_manager_debug then
		self.pursuit_manager:set_debug();
	end;
	
	if self.stop_on_intercept then
		self.pursuit_manager:set_stop_on_intercept();
	end;
	
	if is_number(self.intercept_time) and self.intercept_time > 0 then
		self.pursuit_manager:set_intercept_time(self.intercept_time);
	end;
	
	self.pursuit_manager:start();
end;


function patrol_manager:move_to_current_waypoint()
	if self.current_waypoint > #self.waypoints then
		self:complete();
		return;
	end;
	
	self.bm:remove_process(self.name);
		
	local dest_vector = self.waypoints[self.current_waypoint].vector;
	
	local BOOL_Vector_Mode = true;
	
	if not is_vector(dest_vector) then
		BOOL_Vector_Mode = false;
	end;
	
	local dest_orientation = self.waypoints[self.current_waypoint].orientation;
	local dest_width = self.waypoints[self.current_waypoint].width;
	local dest_run = self.waypoints[self.current_waypoint].should_run;
	
	if self.is_debug or __patrol_manager_debug then
		local prepend_string = "";
		
		if dest_run then
			if self.is_naval then
				prepend_string = " sailing fast to ";
			else
				prepend_string = " running to ";
			end;
		else
			if self.is_naval then
				prepend_string = " sailing to ";
			else
				prepend_string = " walking to ";
			end;
		end;
		
		if BOOL_Vector_Mode then
			bm:out(prepend_string .. "position " .. Vector_To_String(dest_vector) .. ", orient " .. dest_orientation .. " and width " .. dest_width);
		else
			if self.is_naval then
				bm:out(prepend_string .. "intercept ship " .. dest_vector:name() .. " at " .. Vector_To_String(dest_vector:position()));
			else
				bm:out(prepend_string .. "intercept unit " .. dest_vector:name() .. " at " .. Vector_To_String(dest_vector:position()));
			end;
		end;		
	end;
	
	if self.is_naval then
		if dest_run then
			if BOOL_Vector_Mode then	
				self.unitcontroller:goto_location(dest_vector, "full sail");
			else
				self.unitcontroller:goto_location(dest_vector:position(), "full sail");
				
				self.bm:register_repeat_callback(function() self.unitcontroller:goto_location(dest_vector:position(), "full sail") end, 10000, self.name);
			end;
		else
			if BOOL_Vector_Mode then
				self.unitcontroller:goto_location(dest_vector);
			else
				self.unitcontroller:goto_location(dest_vector:position());
				
				self.bm:register_repeat_callback(function() self.unitcontroller:goto_location(dest_vector:position()) end, 10000, self.name);
			end;
		end;
	else
		if BOOL_Vector_Mode then
			self.unitcontroller:goto_location_angle_width(dest_vector, dest_orientation, dest_width, dest_run);
		else
			self.unitcontroller:goto_location_angle_width(dest_vector:position(), dest_orientation, dest_width, dest_run);
			
			self.bm:register_repeat_callback(function() self.unitcontroller:goto_location_angle_width(dest_vector:position(), dest_orientation, dest_width, dest_run) end, 10000, self.name);
		end;
	end;
	
	if BOOL_Vector_Mode then
		self.bm:watch(
					function()								
						return Vector_Distance(self.unit:position(), dest_vector) < PATROL_MANAGER_WAYPOINT_REACHED_THRESHOLD 
					end,
					0,
					function() 
						self:move_to_next_waypoint() 
					end,
					self.name
				);
	else
		self.bm:watch(
					function()								
						return Vector_Distance(self.unit:position(), dest_vector:position()) < PATROL_MANAGER_WAYPOINT_REACHED_THRESHOLD 
					end,
					0,
					function() 
						self:move_to_next_waypoint() 
					end,
					self.name
				);
	end;
end;


function patrol_manager:begin_pursuit()
	if self.is_debug or __patrol_manager_debug then
		self.bm:out(self.name .. " : pursuing an enemy");
	end;
	
	self.bm:remove_process(self.name);
	
	if is_function(self.interception_callback) then
		self.interception_callback();
	end;
end;


function patrol_manager:abandon_pursuit()
	if self.is_debug or __patrol_manager_debug then
		self.bm:out(self.name .. " : abandoning pursuit");
	end;
	
	if is_function(self.abandon_callback) then
		self.abandon_callback();
	end;
	
	self:set_nearest_waypoint_as_current();	
	self:move_to_current_waypoint();
end;


function patrol_manager:set_nearest_waypoint_as_current()
	local current_shortest_distance = 5000;
	local current_shortest_index = 0;
	local current_vector = nil;
	
	for i = 1, #self.waypoints do		
		if is_vector(self.waypoints[i].vector) then
			current_vector = self.waypoints[i].vector;
		else
			current_vector = self.waypoints[i].vector:position();
		end;
	
		if self.unit:position():distance(current_vector) < current_shortest_distance then
			current_shortest_distance = self.unit:position():distance(current_vector);
			current_shortest_index = i;
		end;	
	end;
	
	self.current_waypoint = current_shortest_index;
end;


function patrol_manager:unit_routed()
	if self.is_debug or __patrol_manager_debug then
		self.bm:out(self.name .. " : unit is routing");
	end;
	
	self.bm:remove_process(self.name);
	
	if self.stop_on_rout or Is_Unit_Shattered_Or_Dead(self.unit) then
		self:complete(PATROL_MANAGER_UNIT_IS_DEAD_OR_ROUTING);	
	end;
end;


function patrol_manager:complete(reason)
	if self.is_debug or __patrol_manager_debug then
		if reason == PATROL_MANAGER_REACHED_DESTINATION then
			self.bm:out(self.name .. " completed : unit has reached its destination");
		elseif reason == PATROL_MANAGER_UNIT_IS_DEAD_OR_ROUTING then
			self.bm:out(self.name .. " completed : unit is dead or routing");
		end;
	end;
	
	self:stop(reason);
	
	if is_function(self.completion_callback) then
		-- call the completion callback unless our unit is routing AND we're not supposed to callback when this happens
		if not (reason == PATROL_MANAGER_UNIT_IS_DEAD_OR_ROUTING and not self.callback_on_rout) then 
			self.completion_callback();
		end;
	end;
end;


function patrol_manager:stop(reason)
	if not self.is_running then
		return false;
	end;
	
	if self.is_debug or __patrol_manager_debug then
		self.bm:out(self.name .. " : stopping");
	end;
	
	self.is_running = false;
	
	if reason ~= PATROL_MANAGER_UNIT_IS_DEAD_OR_ROUTING then
		self.pursuit_manager:stop();
	end;
	
	self.bm:remove_process(self.name);
end;


function patrol_manager:set_debug(value)
	if self.is_running then
		self.bm:out(self.name .. " warning : trying to change debug state of a running patrol manager. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		self.is_debug = value;
	else
		self.is_debug = true;
	end;
end;


function patrol_manager:set_debug_all(value)
	if self.is_running then
		self.bm:out(self.name .. " warning : trying to change global debug state of a running patrol manager. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		__patrol_manager_debug = value;
	else
		__patrol_manager_debug = true;
	end;
end;