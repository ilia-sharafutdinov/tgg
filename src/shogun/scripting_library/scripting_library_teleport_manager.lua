
----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------



hiding_place = {
	bm = nil,
	name = "",
	places = {},
	taken = false,
	trigger_radius = 120,
	trigger_areas = {}
}


function hiding_place:new(new_bm, new_name)
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Error :: trying to create hiding place but name given is not a string!");
		
		return false;		
	end;
	
	hp = {};
	setmetatable(hp, self);
	self.__index = self;
	self.__tostring = function() return TYPE_HIDING_PLACE end;
	
	hp.bm = new_bm;
	hp.name = "Hiding_Place_" .. new_name;
	hp.places = {};
	hp.trigger_areas = {};
	hp.taken = false;
	hp.trigger_radius = 120;
	
	return hp;
end;


function hiding_place:add_position(new_position, new_bearing, new_width)
	if not is_vector(new_position) or not is_number(new_bearing) or not is_number(new_width) then
		self.bm:out(self.name .. " error :: trying to add position but some parameter is wrong!");
		
		return false;
	end;
	
	local to_add = {position = new_position, bearing = new_bearing, width = new_width}
	
	table.insert(self.places, to_add);
end;


function hiding_place:add_trigger_area(area)
	if not is_convexarea(area) then
		self.bm:out(self.name .. " error :: trying to set new trigger area but supplied parameter is not a convex area!");
		
		return false;
	end;
	
	table.insert(self.trigger_areas, area);
end;


function hiding_place:set_trigger_radius(new_radius)
	if not is_number(new_radius) then
		self.bm:out(self.name .. " error :: trying to set new radius but it's not a number!");
		
		return false;
	end;
	
	self.trigger_radius = new_radius;
end;


function hiding_place:get_trigger_radius()
	return self.trigger_radius;
end;



function hiding_place:is_taken()
	return self.taken;
end;


function hiding_place:set_taken(value)
	if is_boolean(value) then
		self.taken = value;
	else
		self.taken = true;
	end;
end;



----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------


teleport_squad = {
	bm = nil,
	name = "",
	home_alliance = nil,
	enemy_armies = nil,
	target_unit = nil,
	sunits = {},
	hiding_places = {},
	patrol_managers = {},
	attack_callback = nil
};


function teleport_squad:new(new_bm, new_name, new_home_alliance, new_enemy_armies)
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Error :: trying to create teleport squad but name given is not a string!");
		
		return false;		
	end;

	if not is_armies(new_enemy_armies) then
		new_bm:out("Error :: trying to create teleport squad but armies given is not an armies object!");
		
		return false;		
	end;
	
	ts = {};
	setmetatable(ts, self);
	self.__index = self;
	self.__tostring = function() return TYPE_TELEPORT_SQUAD end;
	
	ts.bm = new_bm;
	ts.name = "Teleport_Squad_" .. new_name;
	ts.enemy_armies = new_enemy_armies;
	ts.target_unit = nil;
	ts.sunits = {};
	ts.hiding_places = {};
	ts.patrol_managers = {};
	ts.attack_callback = nil;
		
	return ts;
end;


function teleport_squad:add_sunits(...)
	for i = 1, arg.n do
		if not is_scriptunit(arg[i]) then
			self.bm:out(self.name .. " error :: trying to add sunits, but one of the objects supplied is not a script unit!");
			
			return false;
		end;
		
		table.insert(self.sunits, arg[i]);
	end;
end;


function teleport_squad:add_hiding_places(...)
	if #self.sunits == 0 then
		self.bm:out(self.name .. " error :: trying to add hiding places, but no sunits added yet, do this first!");
			
		return false;
	end;

	for i = 1, arg.n do
		if not is_hidingplace(arg[i]) then
			self.bm:out(self.name .. " error :: trying to add hiding places, but one of the objects supplied is not a hiding place!");
			
			return false;
		end;
		
		-- check that this hiding place has enough spaces available for our sunits
		if #arg[i].places < #self.sunits then
			self.bm:out(self.name .. " warning :: trying to add hiding places but one of them does not have enough slots available, discarding it");
			
			self.bm:out("\t\t#arg[i].places is " .. #arg[i].places .. ", i is " .. i .. " and #self.sunits is " .. #self.sunits);
		else
			table.insert(self.hiding_places, arg[i]);
		end;
	end;
end;


function teleport_squad:set_target_unit(new_unit)
	if not is_unit(new_unit) then
		self.bm:out(self.name .. " error :: trying to set a new target unit but the object supplied is not a unit");
		
		return false;
	end;
	
	self.target_unit = new_unit;
end;


function teleport_squad:set_attack_callback(new_callback)
	if not is_function(new_callback) then
		self.bm:out(self.name .. " error :: trying to set callback, but the object supplied is not a function!");
		
		return false;
	end;
	
	self.attack_callback = new_callback;
end;


function teleport_squad:teleport()
	if #self.sunits == 0 then
		self.bm:out(self.name .. " error :: trying to teleport, but no sunits have been added to this squad!");
		
		return false;
	end;

	if #self.hiding_places == 0 then
		self.bm:out(self.name .. " error :: trying to teleport, but no hiding places have been added to this squad!");
		
		return false;
	end;

	-- randomly sort our hiding places
	self.hiding_places = Random_Sort(self.hiding_places);
		
	-- check each one in sequence
	for i = 1, #self.hiding_places do
		if not self.hiding_places[i]:is_taken() then
			-- this hiding place isn't taken, do the teleport
			
			self.bm:out(self.name .. " is teleporting to location " .. self.hiding_places[i].name .. ", sshhhhh!!!");
			self:do_teleport(self.hiding_places[i]);	

			return true;
		end;
	end;
	
	self.bm:out(self.name .. " error :: attempted to teleport but none of the places were available!!");
	
	return false;
end;


function teleport_squad:do_teleport(hiding_place)
	for i = 1, #self.sunits do
		self.sunits[i].uc:teleport_to_location(hiding_place.places[i].position, hiding_place.places[i].bearing, hiding_place.places[i].width);
		self.bm:out("\t.. unit #" .. i .. " new position is " .. Vector_To_String(hiding_place.places[i].position));
	end;
	
	hiding_place:set_taken(true);
	
	-- assemble a table of just the positions
	local hiding_positions = {};

	for i = 1, #hiding_place.places do
		hiding_positions[i] = hiding_place.places[i].position;
	end;

	local centre_point = Centre_Point_Table(hiding_positions);
	local radius = hiding_place:get_trigger_radius();
	
	local units = nil;
	
	for i = 1, self.enemy_armies:count() do
		units = self.enemy_armies:item(i):units();
		
		self.bm:watch(function() return Units_Close_To_Point(units, centre_point, radius) > 0 end, 0, function() self:attack() end, self.name .. "Trigger_Watch");
		
		for j = 1, #hiding_place.trigger_areas do
			self.bm:watch(function() return hiding_place.trigger_areas[j]:standing_units_in_area(units) > 0 end, 0, function() self:attack() end, self.name .. "Trigger_Watch");
		end;
	end;
end;


function teleport_squad:attack()
	self.bm:remove_process(self.name .. "Trigger_Watch");

	-- CHANGE ALL OF THIS
	
	for i = 1, #self.sunits do
		self.patrol_managers[i] = patrol_manager:new(
									self.bm,
									self.name .. "Attack_SUnit" .. tostring(i),
									self.sunits[i].unit,
									self.sunits[i].uc,
									self.enemy_armies,
									150,
									1000,
									1000
								);
	
		self.patrol_managers[i]:set_width(self.sunits[i].start_width);
		self.patrol_managers[i]:add_waypoint(self.target_unit, true);
		self.patrol_managers[i]:set_intercept_time(30);
		self.patrol_managers[i]:start();
	end;
		
	self.bm:out(self.name .. " :: has been provoked and is moving to attack");

	if is_function(self.attack_callback) then
		self.attack_callback();
	end;
end;


function teleport_squad:are_sunits_routing()
	for i = 1, #self.sunits do
		if not Is_Unit_Routing_Or_Dead(self.sunits[i].unit) then
			return false;
		end;
	end;
	
	return true;
end;