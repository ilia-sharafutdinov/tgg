


decision_point = {
	bm = nil,
	name = "",
	escape_routes = {},
	detect_obj = nil,
	detect_area = false,
	detection_range = 100,
	caution_point = false,
	exit_point = false,
	is_debug = false
};


function decision_point:new(new_bm, new_name, new_detect_obj)
	-- type check our startup parameters
	
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Decision Point: no name given or name invalid");
		
		return false;
	end;
		
	if not (is_convexarea(new_detect_obj) or is_vector(new_detect_obj)) then
		new_bm:out("Couldn't create Decision Point " .. new_name .. ": no valid detection object given (should be a convex area or a vector)");
		
		return false;
	end;
	
	dp = {};
	setmetatable(dp, self);
	self.__index = self;
	self.__tostring = function() return TYPE_DECISION_POINT end;
	
	dp.bm = new_bm;
	dp.name = "Decision_Point_" .. new_name;
	dp.detect_obj = new_detect_obj;
	
	if is_convexarea(new_detect_obj) then
		dp.detect_area = true;
	else
		dp.detect_area = false;
	end;
	
	dp.escape_routes = {};
	dp.is_debug = false;
	
	return dp;
end;


function decision_point:set_debug(new_value)
	if new_value == nil then
		self.is_debug = true;
	else
		self.is_debug = new_value;
	end;
end;


function decision_point:add_escape_route(new_route)
	if not is_escaperoute(new_route) then
		self.bm:out(self.name .. " error : tried to add new escape route but supplied object is not an escape route!");
	
		return false;
	end;
	
	table.insert(self.escape_routes, new_route);
end;


function decision_point:set_caution_point()
	self.caution_point = true;
	self.exit_point = false;
end;


function decision_point:set_exit_point()
	self.caution_point = false;
	self.exit_point = true;
end;


function decision_point:set_detection_radius(new_radius)
	if (not is_number(new_radius)) or (new_radius <= 0) then
		self.bm:out(self.name .. " error: trying to set detection radius but supplied value is not valid");
		
		return false;
	end;
	
	self.detection_radius = new_radius;
end;


function decision_point:get_detection_radius()
	return self.detection_radius;
end;


function decision_point:is_detect_area()
	return self.detect_area;
end;


function decision_point:is_caution_point()
	return self.caution_point;
end;


function decision_point:is_exit_point()
	return self.exit_point;
end;


function decision_point:get_detect_obj()
	return self.detect_obj;
end;


function decision_point:get_next_route()
	if self.caution_point then
		return self.escape_routes[1];
	end;

	local current_threat = 0;
	local lowest_threat = 1000;
	local lowest_threat_index = 0;
	
	if #self.escape_routes == 0 then
		self.bm:out(self.name .. " error: get_next_route() called when no routes are attached, expect your script to break!");
		
		return false;
	end;

	for i = 1, #self.escape_routes do
		current_threat = self.escape_routes[i]:calculate_threat();
	
		if current_threat < lowest_threat then
			lowest_threat = current_threat;
			lowest_threat_index = i;
		end;
	end;
	
	return self.escape_routes[lowest_threat_index];
end;











escape_route = {
	bm = nil,
	name = "",
	threat_area = nil,
	enemy_alliance = nil,
	routes = {},
	route_pointer = 0,
	end_point = nil,
	interception_radius = 180,
	abandon_radius = 350,
	guard_radius = 350
};


function escape_route:new(new_bm, new_name, new_threat_area, new_enemy_alliance, new_end_point)
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Escape Route: no name given or name invalid");
		
		return false;
	end;
		
	if not (is_nil(new_threat_area) or is_convexarea(new_threat_area)) then
		new_bm:out("Couldn't create Escape Route " .. new_name .. ": no valid threat area given");
		
		return false;
	end;
	
	if not (is_alliance(new_enemy_alliance)) then
		new_bm:out("Couldn't create Escape Route " .. new_name .. ": no valid enemy alliance given");
	
		return false;
	end;
	
	if not (is_decisionpoint(new_end_point)) then
		new_bm:out("Couldn't create Escape Route " .. new_name .. ": no valid end point given");
	end;
	
	er = {};
	setmetatable(er, self);
	self.__index = self;
	self.__tostring = function() return TYPE_ESCAPE_ROUTE end;
	
	er.bm = new_bm;
	er.name = "Escape_Route_" .. new_name;
	er.threat_area = new_threat_area;
	er.enemy_alliance = new_enemy_alliance;
	er.end_point = new_end_point;
	er.routes = {};	
	er.is_debug = false;

	return er;
end;


function escape_route:set_debug(new_value)
	if new_value == nil then
		self.is_debug = true;
	else
		self.is_debug = new_value;
	end;
end;


function escape_route:add_route(...)
	local new_route = {};
	
	for i = 1, arg.n do
		if not is_vector(arg[i]) then
			self.bm:out(self.name .. " error : trying to add escape route and object #" .. i .. " is not a vector, failing");
			
			return false;
		else
			table.insert(new_route, arg[i]);
		end;		
	end;

	table.insert(self.routes, new_route);
end;


function escape_route:calculate_threat()
	local threat = 0;
	local current_units = nil;

	if is_convexarea(self.threat_area) then
		for i = 1, self.enemy_alliance:armies():count() do
			current_units = self.enemy_alliance:armies():item(i):units();
		
			threat = threat + self.threat_area:standing_units_in_area(current_units);	
		end;
	else
		self.bm:out(self.name .. " warning: this escape route has no associated threat area yet was asked to calculate it's threat, this shouldn't happen");
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " calculated threat : " .. threat);
	end;

	return threat;
end;


function escape_route:get_route_points()
	if #self.routes == 0 then
		self.bm:out(self.name .. " error: get_route_points() was called but no routes have been added!");
		
		return nil;
	end;
			
	if self.route_pointer == #self.routes then
		self.route_pointer = 1;
	else
		self.route_pointer = self.route_pointer + 1;
	end;
	
	return self.routes[self.route_pointer];
end;


function escape_route:get_end_point()
	return self.end_point;
end;




















escape_manager = {
	bm = nil,
	name = "",
	sunit = nil,
	enemy_alliance = nil,
	caution_callback = nil,
	escape_callback = nil,
	walk_to_waypoint = 0,
	current_pm = nil,
	current_route = nil,
	is_debug = false
}


function escape_manager:new(new_bm, new_name, new_sunit, new_enemy_alliance)
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Escape Manager: no name given or name invalid");
		
		return false;
	end;
		
	if not (is_scriptunit(new_sunit)) then
		new_bm:out("Couldn't create Escape Manager " .. new_name .. ": sunit given is not valid");
		
		return false;
	end;
	
	if not (is_alliance(new_enemy_alliance)) then
		new_bm:out("Couldn't create Escape Manager " .. new_name .. ": alliance given is not valid");
		
		return false;
	end;

	em = {};
	setmetatable(em, self);
	self.__index = self;
	self.__tostring = function() return TYPE_ESCAPE_MANAGER end;
	
	em.bm = new_bm;
	em.name = "Escape_Manager_" .. new_name;
	em.sunit = new_sunit;
	em.enemy_alliance = new_enemy_alliance;
	em.is_debug = false;

	return em;
end;


function escape_manager:set_walk_to_waypoint(new_value)
	if (not is_number(new_value)) or new_value < 0 then
		self.bm:out(self.name .. " error: trying to set walk to waypoint but supplied value is not a valid number!")
	
		return false;
	end;
	
	self.walk_to_waypoint = new_value;
end;


function escape_manager:set_caution_callback(new_callback)
	if not is_function(new_callback) then
		self.bm:out(self.name .. " error : trying to set a caution callback but supplied callback is not valid!");
		
		return false;
	end;
	
	self.caution_callback = new_callback;
end;


function escape_manager:set_escape_callback(new_callback)
	if not is_function(new_callback) then
		self.bm:out(self.name .. " error : trying to set an escape callback but supplied callback is not valid!");
		
		return false;
	end;
	
	self.escape_callback = new_callback;
end;


function escape_manager:set_debug(new_value)
	if new_value == nil then
		self.is_debug = true;
	else
		self.is_debug = new_value;
	end;
end;



function escape_manager:start(new_route)
	if not is_escaperoute(new_route) then
		self.bm:out(self.name .. " error: trying to start escape manager, but no valid route given");
		
		return false;
	end;
	
	self:next_route(new_route, false, true);
end;


function escape_manager:next_route(new_route, should_walk, starting)
	if self.is_debug then
		if starting then
			self.bm:out(self.name .. " is starting on route " .. new_route.name);
		else
			self.bm:out(self.name .. " moving to next route " .. new_route.name);
		end;	
	end;
	
	self.bm:remove_process(self.name);
	
	if self.current_pm then
		self.current_pm:stop();
	end;
	
	self.current_pm = patrol_manager:new(
		self.bm,
		self.name,
		self.sunit.unit,
		self.sunit.uc,
		self.enemy_alliance:armies(),
		new_route.interception_radius,
		new_route.guard_radius
	);
	
	if self.is_debug then
		self.current_pm:set_debug();
	end;
	
	self.current_pm:set_width(self.sunit.start_width);
	self.current_pm:set_intercept_time(30000);
	
	local route_points = new_route:get_route_points();
	
	if #route_points == 0 then
		-- something has gone wrong, our route has no points in it
		return false;
	end;
	
	for i = 1, #route_points do
		if should_walk then
																				--bm:out("\t\t\t\t\t\t\t" .. self.name .. " queuing WALK to waypoint (should_walk is true)");
			self.current_pm:add_waypoint(route_points[i]);
		elseif i <= self.walk_to_waypoint then
																				--bm:out("\t\t\t\t\t\t\t" .. self.name .. " queuing WALK to waypoint (i <= self.walk_to_waypoint)");
			self.current_pm:add_waypoint(route_points[i]);
		else
																				--bm:out("\t\t\t\t\t\t\t" .. self.name .. " queuing RUN to waypoint");
			self.current_pm:add_waypoint(route_points[i], true);
			self.walk_to_waypoint = 0;
		end;
	end;
	
	self.current_pm:start();
	
	bm:watch(function()	return Is_Unit_Routing_Or_Dead(self.sunit.unit) end, 0, function() self:sunit_routing() end, self.name);
	
	local end_point = new_route:get_end_point();
	local detect_object = end_point:get_detect_obj();
	
	-- detect when unit has reached the next decision point
	if end_point:is_detect_area() then
		bm:watch(function() return detect_object:is_in_area(self.sunit.unit:position()) end, 0, function() self:decision_point_reached(end_point) end, self.name);
	else
		bm:watch(function() return self.sunit.unit:position():distance(detect_object) < end_point:get_detection_radius() end, 0, function() self:decision_point_reached(end_point) end, self.name);
	end;
end;




function escape_manager:sunit_routing()
	if self.is_debug then
		self.bm:out(self.name .. " : stopping as unit is routing");
	end;
	
	self.bm:remove_process(self.name);
end;


function escape_manager:decision_point_reached(decision_point)	
	if decision_point:is_exit_point() then
		if self.is_debug then
			self.bm:out(self.name .. " has reached a decision point " .. decision_point.name .. " which is an escape point !!!");
		end;
		
		self.sunit.uc:withdraw(true);
		self.bm:remove_process(self.name);
	
		if is_function(self.escape_callback) then
			self.escape_callback();
		end;
				
		return;
	end;
	
	local caution_point = decision_point:is_caution_point();
	
	if caution_point then
		if self.is_debug then
			self.bm:out(self.name .. " has reached a decision point " .. decision_point.name .. " which is a caution point !");
		end;
	
		if is_function(self.caution_callback) then
			self.caution_callback();
		end;
	else
		if self.is_debug then
			self.bm:out(self.name .. " has reached a decision point " .. decision_point.name);
		end;
	end;
	
	self:next_route(decision_point:get_next_route(), caution_point);
end;


