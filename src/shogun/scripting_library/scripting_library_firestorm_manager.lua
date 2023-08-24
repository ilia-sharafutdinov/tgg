

----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	FIRESTORM MANAGER
--
--	The firestorm manager is a module in script that allows the scripter to set a building on fire and have that fire spread in a vaguelly realistic fashion 
--	across a group of buildings. Units that venture close to a burning building will take damage. Buildings will naturally burn down, although the scripter is
--	able to specify buildings that stay burning indefinetly. The scripter can also specify buildings that accelerate or retard the spread of fire (i.e. they
--  conduct fire on to adjacent buildings faster/slower than usual).
--
--  To set up a firestorm manager, the scripter must declare it, add at least one convex area that contains the buildings to burn, add at least one armies
--	collection containing troops that will be affected by the fire and then either start the manager or ignite one of it's buildings, which starts it automatically.
--  Buildings can be pre-ignited - that is to say that they're set on fire, but that that fire won't spread to nearby buildings until the manager is manually
--  started.
--
--
--  firestorm_manager:new(...)
--	
--	PARAMETERS
--	BATTLE_MANAGER a link to your battle manager object
--	STRING a name describing your pursuit manager. This should be unique among firestorm managers in your script
--
--
--	function firestorm_manager:set_debug(value)
--
--	Sets the firestorm manager into debug mode. 
--
--	PARAMETERS
--  optional BOOLEAN value - debug on or off, defaults to true
--
--
--  firestorm_manager:set_max_flammable_dist(value)
--
--  The max flammable dist is the maximum distance at which a building will conduct fire to another building.
--  
--	PARAMETERS:
--  NUMBER distance in metres, must be greater than 0. Default is 75.
--
--
--  firestorm_manager:set_max_flammable_time(value)
--
--  The max flammable time is the time it takes fire to conduct between two buildings at the max flammable distance
--  
--	PARAMETERS:
--  NUMBER time in ms, must be greater than the min flammable time. Default is 25000.
--
--
--  firestorm_manager:set_min_flammable_time(value)
--
--  The min flammable time is the minimum time fire will conduct between two buildings (they'd have to be 0m apart)
--  
--	PARAMETERS:
--  NUMBER time in ms, must be less than the max flammable time. Default is 5000.
--
--
--  firestorm_manager:set_accelerator_modifier(value)
--
--  If a building is set to accelerate the spread of fire, the normal time the fire takes to spread to adjacent buildings is multiplied by this value.
--  
--	PARAMETERS:
--  NUMBER value, must be greater than zero. Default is 0.3. A value greater than 1 will make accelerated buildings actually retard the spread of fire instead!
--
--
--  firestorm_manager:set_retardation_modifier(value)
--
--  If a building is set to retard the spread of fire, the normal time the fire takes to spread to adjacent buildings is multiplied by this value.
--  
--	PARAMETERS:
--  NUMBER value, must be greater than zero. Default is 1.5. A value less than 1 will make retarded buildings actually accelerate the spread of fire instead!
--
--
--  firestorm_manager:set_hurt_radius(value)
--
--  The distance units can be from a burning building before they take damage.
--  
--	PARAMETERS:
--  NUMBER value in metres, must be greater than zero. Default is 50.
--
--
--	function firestorm_manager:make_fireproof(building)
--
--	Makes a given building fireproof, so that it will burn indefinetly.
--
--	PARAMETERS:
--	BUILDING building to fireproof. Must be in a convex area covered by the firestorm manager.
--
--
--	function firestorm_manager:accelerate_burning(building)
--
--	Makes a given building accelerate the spread of fire. Nearby buildings will catch fire from this building more quickly than usual. The rate of this is
--	controlled by the accelerator modifier.
--
--	PARAMETERS:
--	BUILDING building to accelerate. Must be in a convex area covered by the firestorm manager.
--
--
--	function firestorm_manager:retard_burning(building)
--
--	Makes a given building retard the spread of fire. Nearby buildings will catch fire from this building more slowly than usual. The rate of this is
--	controlled by the retardation modifier.
--
--	PARAMETERS:
--	BUILDING building to retard. Must be in a convex area covered by the firestorm manager.
--
--
--	function firestorm_manager:add_armies(armies, should_notify)
--
--	Adds an armies collection to the manager. Units will only take damage near burning buildings if they're part of an armies collection that has been added to
--	the firestorm manager in this way.
--
--	PARAMETERS:
--	ARMIES armies collection to add
--	opt BOOL whether units being killed from this army should increment the notification counter
--
--
--	function firestorm_manager:add_convex_area(convex_area)
--
--	Adds a convex area to the firestorm manager. Buildings within this area get scanned and added to the internal building list. At least one convex area
--	containing buildings must be added to the manager before it can be started.
--
--	PARAMETERS:
--	CONVEX_AREA area to add
--
--
--	function firestorm_manager:ignite_building(building)
--
--	Ignites a building, starting a fire spreading from it. Multiple buildings can be ignited. If the manager is not already started it gets started at this
--	point.
--
--	PARAMETERS:
--	BUILDING building to ignite. Must be in a convex area covered by the firestorm manager.
--
--
--	function firestorm_manager:pre_ignite_building(building)
--
--	Ignites a building, but the fire does not start to spread from it until start() is called. Note that if the subject building is not fireproof it may burn
--	down before the manager is started, which will cause erroneous results.
--
--	PARAMETERS:
--	BUILDING building to ignite. Must be in a convex area covered by the firestorm manager.
--
--
--	function firestorm_manager:start()
--
--	Starts the firestorm manager. This starts the fire spreading from any pre-ignited buildings
--
--	<no parameters>

-----------------------------------------------------------------------------------------------------------

--[[

	SAMPLE USAGE:
			
	-- called on startup
	fm = firestorm_manager:new(bm, "Castle");
	--fm:set_debug();
	fm:set_max_flammable_time(120000);
	fm:set_min_flammable_time(20000);
	
	fm:add_convex_area(Area_Castle);
	
	fm:add_armies(Armies_Ikko, true);
	fm:add_armies(Armies_Oda, false);
	
	fm:make_fireproof(bm:buildings():item(140));
	fm:make_fireproof(bm:buildings():item(143));
	fm:make_fireproof(bm:buildings():item(145));

	fm:accelerate_burning(bm:buildings():item(136));
	
	fm:retard_burning(bm:buildings():item(15));
	
	
	-- called during cutscene
	function Pre_Ignite_Buildings()
		fm:pre_ignite_building(bm:buildings():item(140));
		fm:pre_ignite_building(bm:buildings():item(143));
		fm:pre_ignite_building(bm:buildings():item(145));
	end;
	
	
	-- called at the start of gameplay
	function Start_Fire_At_End_Of_Cutscene()
		fm:start();
	end;

]]




--[[

-- A visual record of what these tables look like, for maintenance purposes

neighbour = {
		building_record,
		offset_time
}

building_record = {
	building = nil,
	currently_burning = false,
	has_burned = false,
	always_burn = false,
	accelerate_burning = false,
	retard_burning = false,
	neighbours = {},
	max_spread_fire_time = 0,
	callback = nil,
	deathzone = nil
}
]]

firestorm_manager = {
	bm = nil,
	name = "",
	area_list = {},
	building_list = {},
	hurtarea_list = {},
	armies_list = {},
	is_debug = false,
	is_running = false,
	max_flammable_dist = 75,
	max_flammable_time = 25000,
	min_flammable_time = 5000,
	accelerator_modifier = 0.3,
	retardation_modifier = 1.5,
	hurt_radius = 50,
	fire_death_threshold = 8,
	notification_list = {},
	notification_alliance = nil,
	hurt_count = 0
}

function firestorm_manager:new(new_bm, new_name)
	--check parameters
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Firestorm Manager: no name given or name invalid");
		
		return false;
	end;
		
	fm = {};
	setmetatable(fm, self);
	self.__index = self;
	self.__tostring = function() return TYPE_FIRESTORM_MANAGER end;
		
	fm.bm = new_bm;
	fm.name = "Firestorm_Manager_" .. new_name;
	
	fm.area_list = {};
	fm.building_list = {};
	fm.hurtarea_list = {};
	fm.notification_list = {};
	fm.is_debug = false;
	fm.is_running = false;
			
	return fm;
end;


function firestorm_manager:set_burn_notification_alliance(alliance)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set burn notification alliance in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_alliance(alliance) then
		self.bm:out(self.name .. " error : tried to set burn notification alliance in a firestorm manager and the argument is not an alliance!");
		
		return false;
	end;
		
	if self.is_debug then
		self.bm:out(self.name .. " set_burn_notification_alliance called, alliance is " .. tostring(alliance));
	end;
	
	self.notification_alliance = alliance;
end;


function firestorm_manager:set_burn_notification(new_count, new_callback)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set a burn notification in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(new_count) or not is_function(new_callback) then
		self.bm:out(self.name .. " error : tried to set a burn notification but one of the supplied parameters is incorrect!");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting a burn notification, count is " .. new_count);
	end;
	
	local new_note = {count = new_count, callback = new_callback};

	table.insert(self.notification_list, new_note);
end;


function firestorm_manager:set_max_flammable_dist(value)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set value in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 then
		self.bm:out(self.name .. " error : tried to set an invalid max flammable time, must be a number greater than zero!");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting max_flammable_distance to " .. value);
	end;

	self.max_flammable_dist = value;
end;


function firestorm_manager:set_max_flammable_time(value)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set value in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 or value <= self.min_flammable_time then
		self.bm:out(self.name .. " error : tried to set an invalid max flammable time, must be a number greater than the minimum flammable time!");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting max_flammable_time to " .. value);
	end;

	self.max_flammable_time = value;
end;


function firestorm_manager:set_min_flammable_time(value)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set value in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 or value >= self.max_flammable_time then
		self.bm:out(self.name .. " error : tried to set an invalid min flammable time, must be a number less than the maximum flammable time!");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting min_flammable_time to " .. value);
	end;

	self.min_flammable_time = value;
end;


function firestorm_manager:set_accelerator_modifier(value)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set value in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 then
		self.bm:out(self.name .. " error : tried to set an invalid accelerator modifier, must be a number greater than 0");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting accelerator_modifier to " .. value);
	end;

	self.accelerator_modifier = value;
end;


function firestorm_manager:set_retardation_modifier(value)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set value in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 then
		self.bm:out(self.name .. " error : tried to set an invalid retardation modifier, must be a number greater than 0");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting retardation_modifier to " .. value);
	end;

	self.retardation_modifier = value;
end;


function firestorm_manager:set_hurt_radius(value)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set value in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 then
		self.bm:out(self.name .. " error : tried to set an invalid hurt radius, must be a number greater than 0");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting hurt_radius to " .. value);
	end;

	self.hurt_radius = value;
end;


function firestorm_manager:make_fireproof(b)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to fireproof a building in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_building(b) then
		self.bm:out(self.name .. " error : tried to fireproof a building in a firestorm manager and the parameter is not a building!");
		
		return false;
	end;
	
	local building_record = self:get_building_record(b);
	
	if not building_record then
		self.bm:out(self.name .. " error : attempted to fireproof a building that's not in our building list at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " make_fireproof called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
	
	--building_record.building:change_immune_to_fire_damage(true);
	building_record.always_burn = true;
end;


function firestorm_manager:set_notification(b, callback)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set notification in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_building(b) or not is_function(callback) then
		self.bm:out(self.name .. " error : tried to set notification in a firestorm manager and one of the parameters is wrong!");
		
		return false;
	end;
	
	local building_record = self:get_building_record(b);
	
	if not building_record then
		self.bm:out(self.name .. " error : attempted to set notification on a building that's not in our building list at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " set_notification called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
	
	building_record.callback = callback;
end;


function firestorm_manager:set_deathzone(b, deathzone)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to set deathzone in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_building(b) or not is_convexarea(deathzone) then
		self.bm:out(self.name .. " error : tried to set deathzone in a firestorm manager and one of the parameters is wrong!");
		
		return false;
	end;
	
	local building_record = self:get_building_record(b);
	
	if not building_record then
		self.bm:out(self.name .. " error : attempted to set a deathzone on a building that's not in our building list at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " set_deathzone called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
	
	building_record.deathzone = deathzone;
end;


function firestorm_manager:accelerate_burning(b)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to accelerate a building in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_building(b) then
		self.bm:out(self.name .. " error : tried to accelerate a building but supplied object is not a building!");
		
		return false;
	end;
	
	local building_record = self:get_building_record(b);
	
	if not building_record then
		self.bm:out(self.name .. " error : attempted to accelerate a building that's not in our building list at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " accelerate_burning called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
	
	building_record.accelerate_burning = true;
end;


function firestorm_manager:retard_burning(b)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to retard building in a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	if not is_building(b) then
		self.bm:out(self.name .. " error : tried to retard a building but supplied object is not a building!");
		
		return false;
	end;
	
	local building_record = self:get_building_record(b);
	
	if not building_record then
		self.bm:out(self.name .. " error : attempted to retard a building that's not in our building list at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " retard_burning called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
	
	building_record.retard_burning = true;
end;


function firestorm_manager:get_building_record(b)
	local building_record = nil;
	
	for i = 1, #self.building_list do
		if self.building_list[i].building == b then
			building_record = self.building_list[i];
			
			return building_record;
		end;
	end;
	
	return false;
end;


function firestorm_manager:contains_building(b)
	for i = 1, #self.building_list do
		if self.building_list[i].building == b then
			return true;
		end;
	end;
	
	return false;
end;


function firestorm_manager:building_is_in_area(b)
	if not is_building(b) then
		return false;
	end;

	for i = 1, #self.area_list do
		if self.area_list[i]:is_in_area(b:central_position()) then
			return true;
		end;
	end;
	
	return false;
end;


function firestorm_manager:add_armies(new_armies, new_should_notify)
	if self.is_running then
		self.bm:out(self.name .. " error : tried to add armies to a running firestorm manager, you cannot do this!");
		
		return false;
	end;

	if not is_armies(new_armies) then
		self.bm:out(self.name .. " error : tried to add armies but the object supplied is not valid");
		
		return false;
	end;
		
	local armies_entry = {armies = new_armies, should_notify = new_should_notify};
		
	table.insert(self.armies_list, armies_entry);
end;


function firestorm_manager:add_convex_area(new_convex_area)
	if not is_convexarea(new_convex_area) then
		self.bm:out(self.name .. " error : tried to add convex area but the object supplied is not a convex area");
		
		return false;
	end;
	
	if self.is_running then
		self.bm:out(self.name .. " error : tried to add a convex area to a running firestorm manager, you cannot do this!");
		
		return false;
	end;
	
	table.insert(self.area_list, new_convex_area);
	
	-- go through all the buildings on the map that we don't have in our local list and check to see if they should be added
	local buildings = bm:buildings();
	local count = 0;
	
	for i = 1, buildings:count() do
		local b = buildings:item(i);
	
		if not self:contains_building(b) and self:building_is_in_area(b) then
			local building_record = {
										building = b,
										currently_burning = false,
										has_burned = false,
										always_burn = false,
										accelerate_burning = false,
										retard_burning = false,
										neighbours = {},
										max_spread_fire_time = 0,
										callback = nil,
										deathzone = nil
			};
			
			--make building unable to catch fire until we want it to burn
			b:change_immune_to_catching_fire(true);
					
			table.insert(self.building_list, building_record);
			count = count + 1;
		end;
	end;
	
	self.bm:out(self.name .. " :: added " .. count .. " buildings");
	
	-- rebuild all the interconnections between the buildings
	for i = 1, #self.building_list do
		self.building_list[i].neighbours = {};
	
		for j = 1, #self.building_list do
			if i ~= j then
				-- check if these two buildings are in range of each other
				local distance = self.building_list[i].building:central_position():distance(self.building_list[j].building:central_position());
								
				if distance < self.max_flammable_dist then					
					local new_offset_time = math.floor((distance * (self.max_flammable_time - self.min_flammable_time) / self.max_flammable_dist) + self.min_flammable_time);
					
					local new_neighbour = {
											building_record = self.building_list[j],
											offset_time = new_offset_time
										};
										
					table.insert(self.building_list[i].neighbours, new_neighbour);
				end;
			end;
		end;
	end;
end;


function firestorm_manager:set_debug(value)
	if self.is_running then
		self.bm:out(self.name .. " warning: trying to change debug state of a running firestorm manager. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		self.is_debug = value;
	else
		self.is_debug = true;
	end;
end;


function firestorm_manager:start()
	if self.is_running then
		self.bm:out(self.name .. " error : trying to start a firestorm manager that is already running !");
		
		return false;
	end;
	
	if #self.building_list == 0 then
		self.bm:out(self.name .. " error : unable to start as no buildings have been added");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " :: starting");
	end;
	
	self.is_running = true;
	self.bm:register_callback(function() self:process_hurtareas() end, 3000);
	
	-- go through all the pre-ignited buildings and start fires spreading from them
	for i = 1, #self.building_list do
		if self.building_list[i].currently_burning then
			self:spread_fire(self.building_list[i]);
		end;
	end;
	
	return true;
end;


function firestorm_manager:watch_fire(building_record)
	--if this building is set to burn forever then we don't need to do anything
	
	if building_record.always_burn then
		self.bm:watch(
						function()
							return building_record.building:health() < 0.1
						end,
						0,
						function()
							building_record.building:change_immune_to_fire_damage(true)
						end
				);
	else

		--put out fire when the building is destroyed
		self.bm:watch(
					function()
						return building_record.building:health() == 0
					end,
					0,
					function()
						-- work out if we can turn off the fire now (i.e. in 5 secs), or if we have to wait for other buildings nearby to catch fire still
						if building_record.max_spread_fire_time < timestamp_tick then
							bm:register_callback(function() self:extinguish_fire(building_record) end, 5000);
						else
							bm:register_callback(function() self:extinguish_fire(building_record) end, building_record.max_spread_fire_time + 5000);
						end;
					end
				);
	end;
end;


function firestorm_manager:extinguish_fire(building_record)
	building_record.building:change_on_fire(false);
	building_record.currently_burning = false;
end;


function firestorm_manager:pre_ignite_building(b)		
	local building_record = self:get_building_record(b);
	
	-- if we haven't found it, then exit
	if not building_record then
		self.bm:out(self.name .. " error : attempted to ignite a building that's not in our building list");
		
		return false;
	end;
	
	-- if this building has burned already, or is destroyed, then exit
	if building_record.has_burned or building_record.building:health() == 0 then
		return false;
	end;
			
	if self.is_debug then
		self.bm:out(self.name .. " pre_ignite_building called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
	
	building_record.building:change_immune_to_catching_fire(false);
	building_record.building:change_on_fire();
	building_record.currently_burning = true;
	building_record.has_burned = true;
	
	self:watch_fire(building_record);
	
	if building_record.callback then
		building_record.callback();
	end;
end;


function firestorm_manager:ignite_building(b)		
	local building_record = self:get_building_record(b);
	
	-- if we haven't found it, then exit
	if not building_record then
		self.bm:out(self.name .. " error : attempted to ignite a building that's not in our building list");
		
		return false;
	end;
	
	-- if this building has burned already, or is destroyed, then exit
	if building_record.has_burned or building_record.building:health() == 0 then
		return false;
	end;
	
	-- start the manager if it's not already
	if not self.is_running then
		if not self:start() then
			-- we are not able to start for some reason
			return false;
		end;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " ignite_building called on building at " .. Vector_To_String(b:position()) .. " (centre-point is " .. Vector_To_String(b:central_position()) .. ")");
	end;
		
	-- set it on fire
	building_record.building:change_immune_to_catching_fire(false);
	building_record.building:change_on_fire();
	building_record.currently_burning = true;
	building_record.has_burned = true;
	
	self:watch_fire(building_record);
	self:spread_fire(building_record);
	
	if building_record.callback then
		building_record.callback();
	end;
end;


function firestorm_manager:spread_fire(building_record)
	-- go through the registered neighbours for this building, and queue them up to catch fire at the appropriate time
	local offset_time_to_use = 0;
	local longest_offset = 0;
	
	for i = 1, #building_record.neighbours do
		if not building_record.neighbours[i].building_record.has_burned then
			offset_time_to_use = building_record.neighbours[i].offset_time;
			
			if offset_time_to_use > longest_offset then
				longest_offset = offset_time_to_use;
			end;
			
			if building_record.accelerate_burning then
				offset_time_to_use = offset_time_to_use * self.accelerator_modifier;
			end;
			
			if building_record.retard_burning then
				offset_time_to_use = offset_time_to_use * self.retardation_modifier;
			end;
		
			self.bm:register_callback(
										function() self:ignite_building(building_record.neighbours[i].building_record.building) end, 
										offset_time_to_use,
										self.name
									);
			if self.is_debug then
				self.bm:out(self.name .. " going to burn building " .. Vector_To_String(building_record.neighbours[i].building_record.building:position()) .. " in " .. offset_time_to_use .. "ms");
			end;					
		end;
	end;
	
	building_record.max_spread_fire_time = longest_offset + timestamp_tick;
end;


function firestorm_manager:damage_unit(unit, distance)	
	local n = 0;	--number of men to kill
		
	n = ((self.hurt_radius - distance) / self.hurt_radius) * (self.fire_death_threshold - 1) + 1;
	
	unit:kill_number_of_men(n);
	
	if self.is_debug then
		bm:out(self.name .. " :: damaging some unit");
	end;
	
	self:inc_hurt_count(unit);
end;


-- called when units walk into a deathzone attached to a burning building
function firestorm_manager:heavily_damage_unit(unit)
	unit:kill_number_of_men(unit:initial_number_of_men() / 4);
	
	self.bm:out(self.name .. " :: heavily damaging some unit as it's walking through a gate");
	
	self:inc_hurt_count(unit);
end;


-- called each time a unit gets hurt
function firestorm_manager:inc_hurt_count(unit)
	if Is_Unit_Routing_Or_Dead(unit) then
		return false;
	end;

	if self.notification_alliance and (not Alliance_Contains_Unit(self.notification_alliance, unit)) then
		return false;
	end;

	self.hurt_count = self.hurt_count + 1;
	
	for i = 1, #self.notification_list do
		if self.notification_list[i].count == self.hurt_count then
			self.notification_list[i].callback();
		end;
	end;
end;


function firestorm_manager:process_hurtareas()
	if not self.is_running then
		self.bm:out(self.name .. " error : process_hurtareas called on a firestorm manager that isn't running, something has gone very wrong!");
		
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " : process_hurtareas() called");
	end;
	
	local building_record = nil;
	local building_position = nil;
	local current_units = nil;
	local current_unit = nil;
		
	for i = 1, #self.building_list do
		building_record = self.building_list[i];
		
		if building_record.currently_burning then		
			building_position = building_record.building:central_position();
				
			for j = 1, #self.armies_list do				
				for k = 1, self.armies_list[j].armies:count() do			
					current_units = self.armies_list[j].armies:item(k):units();
												
					for l = 1, current_units:count() do
						current_unit = current_units:item(l);
						
						if building_position:distance(current_unit:position()) < self.hurt_radius then
							self:damage_unit(current_unit, building_position:distance(current_unit:position()));
						end;
						
						--process deathzones additionally
						if building_record.deathzone then
							if building_record.deathzone:is_in_area(current_unit:position()) then
								self:heavily_damage_unit(current_unit);
							end;
						end;
					end;
				end;
			end;
		end;	
	end;
	
	self.bm:register_callback(function() self:process_hurtareas() end, 3000);
end;

