




zone_controller = {
	bm = nil,
	name = "",
	zones = {},
	trigger_area = nil,
	enemy_alliance = nil,
	sunits = {},
	unassigned_sunits = {},
	activation_callback = nil,
	routing_callback = nil,
	candidate_threshold = 2.2,
	retreat_threshold = 0.9,
	is_debug = false,
	is_running = false
};


REASON_ZONE_CONTROLLER_IS_STARTING = 1;
REASON_ZONE_CONTROLLER_UNITS_IN_AREA = 2;
REASON_ZONE_CONTROLLER_UNIT_HAS_TAKEN_DAMAGE = 3;
REASON_ZONE_CONTROLLER_STOPPING_ALL_UNITS_ROUTING = 4;




function zone_controller:new(new_bm, new_name, new_enemy_alliance, new_trigger_area)
	
	-- type check our startup parameters
	
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Zone Controller: no name given or name invalid");
		
		return false;
	end;
	
	if not is_alliance(new_enemy_alliance) then
		new_bm:out("Couldn't create Zone Controller " .. new_name .. ": no valid enemy alliance given");
		
		return false;
	end;
	
	if not is_convexarea(new_trigger_area) then
		new_bm:out("Couldn't create Zone Controller " .. new_name .. ": no valid trigger area given");
		
		return false;
	end;
	
	zc = {};
	setmetatable(zc, self);
	self.__index = self;
	self.__tostring = function() return TYPE_ZONE_CONTROLLER end;
	
	zc.bm = new_bm;
	zc.name = "Zone_Controller_" .. new_name;
	zc.zones = {};
	zc.trigger_area = new_trigger_area;
	zc.enemy_alliance = new_enemy_alliance;
	zc.sunits = {};
	zc.unassigned_sunits = {};
	zc.is_debug = false;
	zc.is_running = false;

	return zc;
end;


function zone_controller:set_activation_callback(new_callback)
	if not is_function(new_callback) then
		self.bm:out(self.name .. " error : trying to set activation callback but supplied object is not a function");
		
		return false;
	end;
	
	self.activation_callback = new_callback;
end;


function zone_controller:set_routing_callback(new_callback)
	if not is_function(new_callback) then
		self.bm:out(self.name .. " error : trying to set routing callback but supplied object is not a function");
		
		return false;
	end;
	
	self.routing_callback = new_callback;
end;


function zone_controller:set_debug(new_value)
	if new_value == nil then
		self.is_debug = true;
	else
		self.is_debug = new_value;
	end;
end;


function zone_controller:add_zone(new_zone)
	if not is_zonemanager(new_zone) then
		self.bm:out(self.name .. " error: adding zones but object supplied is not a zone, aborting");
			
		return false;
	end;
		
	if self.is_debug then
		self.bm:out(self.name .. " adding zone " .. new_zone.name);
	end;
		
	table.insert(self.zones, new_zone);
end;



function zone_controller:add_sunits(...)
	for i = 1, arg.n do
		if not is_scriptunit(arg[i]) then
			self.bm:out(self.name .. " error: adding sunits but one of the objects supplied is not a script unit, aborting");
			
			return false;
		end;
		
		if self.is_debug then
			self.bm:out(self.name .. " adding sunit " .. tostring(arg[i].unit));
		end;
		
		table.insert(self.sunits, arg[i]);
		table.insert(self.unassigned_sunits, arg[i]);
	end;
end;


function zone_controller:add_sunit(new_sunit, new_zone, dont_move)
	-- check params
	if not is_scriptunit(new_sunit) then
		self.bm:out(self.name .. " error: adding sunit but the object supplied is not a script unit, aborting");
		
		return false;
	end;
	
	if not is_zonemanager(new_zone) then
		self.bm:out(self.name .. " error: adding sunit but the zone supplied to associate it with is not a valid zone manager, aborting");
		
		return false;
	end;
	
	local zone_found = false;
	
	for i = 1, #self.zones do
		if self.zones[i] == new_zone then
			zone_found = true;
			
			break;
		end;	
	end;
	
	if not zone_found then
		self.bm:out(self.name .. " error: adding sunit but the zone supplied to associate it with is not found in this controller, aborting");
		
		return false;
	end;
	
	-- add unit to controller and the zone
	table.insert(self.sunits, new_sunit);
	new_zone:set_occupier(new_sunit);
end;


function zone_controller:get_enemy_alliance()
	return self.enemy_alliance;
end;


function zone_controller:start()
	if self.is_running then
		self.bm:out(self.name .. " error: trying to start controller when it's already running");
			
		return false;
	end;
	
	self.is_running = true;
	
	if self.is_debug then
		self.bm:out(self.name .. " starting");
	end;
	
	for i = 1, #self.zones do
		if self.zones[i]:is_occupied() then
			self.zones[i]:get_occupier().uc:occupy_zone(self.zones[i]:get_centre_pos(), true);
		end;	
	end;
	
	self:deactivate(REASON_ZONE_CONTROLLER_IS_STARTING);
end;


function zone_controller:watch_units_routing()
	-- watch for all units routing and then stop completely
	self.bm:watch(function() return self:all_units_routing() end, 0, function() self:stop(REASON_ZONE_CONTROLLER_STOPPING_ALL_UNITS_ROUTING) end, self.name);
end;


function zone_controller:all_units_routing()
	for i = 1, #self.sunits do
		if not Is_Unit_Routing_Or_Dead(self.sunits[i].unit) then
			return false;
		end;
	end;

	return true;
end;


function zone_controller:stop(reason)
	self.bm:remove_process(self.name);
	
	if reason == REASON_ZONE_CONTROLLER_STOPPING_ALL_UNITS_ROUTING then
		if self.is_debug then
			self.bm:out(self.name .. " is stopping as all units under its control are routing");
		end;
		
		if is_function(self.routing_callback) then
			self.routing_callback();
		end;
	else
		if self.is_debug then
			self.bm:out(self.name .. " is stopping");
		end;
	end;
end;



function zone_controller:activate(reason)

	if self.is_debug then
		if reason == REASON_ZONE_CONTROLLER_UNITS_IN_AREA then
			self.bm:out(self.name .. " activating as enemy units have been detected in the area");
		elseif reason == REASON_ZONE_CONTROLLER_UNIT_HAS_TAKEN_DAMAGE then
			self.bm:out(self.name .. " activating as some of its units have taken damage");
		else
			self.bm:out(self.name .. " activating for an unknown reason !!!");
		end;
	end;

	self.bm:remove_process(self.name);
		
	-- make all the zones assess their respective threat levels (and continue to assess them)
	local t = 100;
	
	for i = 1, #self.zones do
		self.bm:register_callback(function() self.zones[i]:assess_threat() end, t, self.name);
	
		t = t + 100;
	end;
	
	-- watch each of the sunits and if it's routing, remove it from our pool
	self:check_sunits_health();
	
	-- perform an assessment about how to distribute our units
	self.bm:register_callback(function() self:assess() end, 2000 + t);
	
	-- watch for enemy units leaving area of this zone controller
	self.bm:register_callback(function() self:watch_for_deactivate() end, 5000, self.name);
	
	-- watch for all of our units routing
	self:watch_units_routing();
end;



function zone_controller:watch_for_deactivate()
	self.bm:watch(function() return not self:units_in_area() end, 0, function() self:deactivate() end, self.name);
end;



function zone_controller:check_sunits_health()

	-- self.bm:out("check_sunits_health called");

	-- check for units that are routing
	for i = 1, #self.sunits do
		if Is_Unit_Routing_Or_Dead(self.sunits[i].unit) then
			-- sunit is routing, remove it and rescan
			self:remove_sunit(self.sunits[i]);
			
			if self.is_debug then
				self.bm:out("\t\t" .. self.name .. " :: found a defending unit that's routing, discarding it");
			end;
			
			-- lower the candidate threshold to make the remaining units move around more freely
			self.candidate_threshold = self.candidate_threshold - 0.15;
			
			self:check_sunits_health();
			
			return;
			
		else
			--bm:out(" unit " .. i .. " isn't routing");
			
			
		end;
	end;
	
	-- bm:out("finished rout check, starting retreat check");
	
	-- check for units that need to retreat
	for i = 1, #self.zones do
	
		--bm:out("checking zone " .. i .. " of " .. #self.zones);
		--bm:out("self.zones[i]:is_occupied() is " .. tostring(self.zones[i]:is_occupied()));		
		
		if self.zones[i]:is_occupied() then
			--bm:out("self.zones[i]:get_occupier().unit:number_of_men_alive() is " .. self.zones[i]:get_occupier().unit:number_of_men_alive());
			--bm:out("self.zones[i]:get_occupier_start_hp() is " .. self.zones[i]:get_occupier_start_hp());
			
			if self.zones[i]:get_occupier().unit:number_of_men_alive() / self.zones[i]:get_occupier_start_hp() < self.retreat_threshold then
				-- unit needs to retreat. Check that there are free zones to accomodate it
				local free_zones = false;
			
				for j = 1, #self.zones do
					if self.zones[j]:is_usable() and not self.zones[j]:is_occupied() and self.zones[j]:get_threat() >= 0 then
						free_zones = true;
					
						break;
					end;
				end;
			
				if free_zones then
					-- Detach it from its zone in data, it will get picked up next time the controller reassesses
					table.insert(self.unassigned_sunits, self.zones[i]:get_occupier());
			
				else
					-- no free zones, set unit to charge!
					local occupier = self.zones[i]:get_occupier();
					occupier.uc:melee(true);
					occupier.uc:attack_unit(Get_Closest_Standing_Unit_Armies(occupier.unit, self.enemy_alliance:armies()), true, true);
					
					-- release to AI in 60 seconds
					self.bm:register_callback(function() occupier.uc:release_control() end, 60000);
					
					self:remove_sunit(occupier);
				end;
			
				self.zones[i]:set_occupier(nil);
				self.zones[i]:set_usable(false);
			end;
		end;
	end;
	
	self.bm:register_callback(function() self:check_sunits_health() end, 6000, self.name);
end;


function zone_controller:remove_sunit(sunit)
	for i = 1, #self.sunits do
		if self.sunits[i] == sunit then
			table.remove(self.sunits, i);
			
			break;
		end;
	end;
	
	for i = 1, #self.unassigned_sunits do
		if self.unassigned_sunits[i] == sunit then
			table.remove(self.unassigned_sunits, i);
			
			break;
		end;
	end;
	
	for i = 1, #self.zones do
		if self.zones[i]:get_occupier() == sunit then
			self.zones[i]:set_occupier(nil);
			self.zones[i]:set_usable(false);
			
			break;
		end
	end;
end;



function zone_controller:assess()

																--bm:out("zone_controller:assess called");

	-- sort our zone list by threat
	self:sort_zone_list();
	
	-- move through our zones in desc threat order, finding the first that's not occupied and attempting to reinforce it
	self:reassign_sunits()
	
	self.bm:register_callback(function() self:assess() end, 5500, self.name);
end;


function zone_controller:sort_zone_list()

																-- bm:out("\t\t\t\tzone_controller:sort_zone_list called");

	local new_zones = {};	
	local n = #self.zones;
	local current_threat = 0;
	local highest_threat = -1000000;
	local highest_threat_zone = -1;
		
	for i = 1, n do
		highest_threat = -1000000;
		highest_threat_zone = -1;
																--bm:out("\t\t\t\twriting new_zone " .. i .. " of " .. n);
		
		for j = 1, #self.zones do
																--bm:out("\t\t\t\t\tscanning self.zone entry " .. j .. " of " .. #self.zones);
			current_threat = self.zones[j]:get_threat();
			
																--bm:out("\t\t\t\t\tcurrent_threat is " .. tostring(current_threat) .. ", highest_threat is " .. tostring(highest_threat));
		
			if current_threat > highest_threat then
				highest_threat = current_threat;
				highest_threat_zone = j;
				
																--bm:out("\t\t\t\t\t\t(This is the highest threat so far)");
			end;
		end;
		
		-- trap us not finding a highest threat zone
		if highest_threat_zone == -1 then
			self.bm:out(self.name .. ":sort_zone_list() did not find a highest threat zone, this is bad! Setting highest_threat_zone to 1");
			highest_threat_zone = 1;
		end;
																--bm:out("\t\t\t\t\t\tWriting zone " .. highest_threat_zone .. " to new_zones");
		
		table.insert(new_zones, self.zones[highest_threat_zone]);
		table.remove(self.zones, highest_threat_zone);
		
		--[[
		bm:out("\t\t\t\t\t\t\tPrinting new_zones table:-");
	
		for k = 1, #new_zones do
			bm:out("\t\t\t\t\t\t\tzone " .. k .. " of " .. #new_zones .. ", zone name is " .. new_zones[k].name .. " and threat is " .. tostring(new_zones[k]:get_threat()));
		end;
		
		bm:out("\t\t\t\t\t\t\tPrinting self.zones table:-");
	
		for k = 1, #self.zones do
			bm:out("\t\t\t\t\t\t\tzone " .. k .. " of " .. #self.zones .. ", zone name is " .. self.zones[k].name .. " and threat is " .. tostring(self.zones[k]:get_threat()));
		end;
		]]
		
		
		
	end;
		
	self.zones = new_zones;
	--[[
	bm:out("\t\t\t\tFinished everything, setting self.zones = new_zones, #self.zones is now " .. #self.zones .. ", this should be the same as n which is " .. n);
	bm:out("\t\t\t\tPrinting new self.zones table:-");
	
	for i = 1, #self.zones do
		bm:out("\t\t\t\t\tzone " .. i .. " of " .. #self.zones .. ", zone name is " .. self.zones[i].name .. " and threat is " .. tostring(self.zones[i]:get_threat()));
	end;
	]]
	
	if self.is_debug then
		local current_zone = nil;
		local output = self.name .. " threat list :: ";
	
		for i = 1, #self.zones do
			current_zone = self.zones[i];
			output = output .. "  (" .. current_zone.name .. ": " .. tostring(current_zone:get_threat());
			
			if current_zone:is_usable() then
				output = output .. ")";
			else
				output = output .. " <ZONE NOT USABLE>)";
			end;
		end;
		self.bm:out(output);
	end;
end;



function zone_controller:reassign_sunits()

	-- find the occupied zone with the lowest threat

	local lowest_threat = 5000;
	local current_threat = 0;
	
	for i = 1, #self.zones do
		if self.zones[i]:is_occupied() then
			current_threat = self.zones[i]:get_threat();
			
			if current_threat < lowest_threat then
				lowest_threat = current_threat;
			end;
		end;
	end;

	for i = 1, #self.zones do
		if self.zones[i]:is_usable() and not self.zones[i]:is_occupied() and self.zones[i]:get_threat() > lowest_threat then
			self:find_reinforcement(i);
			
			--return;
		end;
	end;
end;



function zone_controller:find_reinforcement(index)

																	--bm:out("\t\t\t\tzone_controller:find_reinforcement called, index is " .. index);

																	--bm:out("\t\t\t\tchecking self.unassigned_units, size is " .. #self.unassigned_sunits);
	
	-- check our unassigned sunit list first
	if #self.unassigned_sunits > 0 then
		-- we have unassigned sunits, get the closest one
		
		local current_distance = 0;
		local closest_distance = 5000;
		local closest_sunit = nil;
		local closest_index = 0;
		
		for i = 1, #self.unassigned_sunits do
		
			current_distance = self.unassigned_sunits[i].unit:position():distance(self.zones[index]:get_centre_pos());
			
																	--bm:out("\t\t\t\t\tchecking distance of unassigned unit " .. i .. " of " .. #self.unassigned_sunits);
																	--bm:out("\t\t\t\t\tcurrent_distance is " .. current_distance .. ", closest distance is currently " .. closest_distance);
		
			if current_distance < closest_distance then
																	--bm:out("\t\t\t\t\t\tmaking this the closest unit");
				closest_distance = current_distance;
				closest_sunit = self.unassigned_sunits[i];
				closest_index = i;
			end;
		end;
		
																	--bm:out("\t\t\t\t\tsending unit " .. closest_index .. " to occupy current zone (position is " .. Vector_To_String(self.zones[index]:get_centre_pos()) .. ")");
		
		-- assign closest unit to the zone
		closest_sunit.uc:occupy_zone(self.zones[index]:get_centre_pos(), true);
		self.zones[index]:set_occupier(closest_sunit);
		table.remove(self.unassigned_sunits, closest_index);
		
		if self.is_debug then
			self.bm:out(self.name .. " trying to find reinforcement for zone " .. self.zones[index].name .. ", sending unoccupied unit at " .. Vector_To_String(closest_sunit.unit:position()));
		end;
		
																	--bm:out("\t\t\t\t\trescanning ...");
		
		-- rescan everything
		--self:reassign_sunits();
		
		return;
	end;
	

	
																	--bm:out("\t\t\t\tcan't get an unassigned unit, building a list of candidate reassignments");
	
	-- build a list of zones that are occupied but have less threat than the current zone
	local candidate_reassignments = {};
	
	for i = index + 1, #self.zones do
	
																	--bm:out("\t\t\t\tlooking at zone " .. i .. " of " .. #self.zones .. ", zone is " .. self.zones[i].name);
																	
																	--bm:out("\t\t\t\t\tzone is occupied: " .. tostring(self.zones[i]:is_occupied()) .. ", zone is usable: " .. tostring(self.zones[i]:is_usable()));
	
		if self.zones[i]:is_occupied() and self.zones[i]:is_usable() then
																	--bm:out("\t\t\t\t\t\tAdding this zone to our candidate reassignments");
			table.insert(candidate_reassignments, self.zones[i]);
		end;
	end;
	
	-- if we didn't find any candidates then exit
	if #candidate_reassignments == 0 then
																	--bm:out("\t\t\t\tWe have no candidate reassignments, exiting");
		if self.is_debug then
			
			self.bm:out(self.name .. " trying to find reinforcement for zone " .. self.zones[index].name .. " .. but did not find any candidate reassignments, exiting");
		end
	
		return;
	end;
	
																	--bm:out("\t\t\t\tWe have candidate reassignments");
	
	-- go through our list of potentials and decide whether to take any of them
	
	local candidate = nil;
	local candidate_pos = nil;
	local current_score = 0;
	local current_distance = 0;
	local highest_score = -1;
	local highest_score_index = 0;
	local highest_score_distance = 0;
	
	local target_threat = self.zones[index]:get_threat();
	
	for i = 1, #candidate_reassignments do
	
		candidate = candidate_reassignments[i];
	
																	--bm:out("\t\t\t\t\tExamining candidate reassignment " .. i .. " of " .. #candidate_reassignments);
																	--bm:out("\t\t\t\t\t\tcandidate is (expect zone) : " .. tostring(candidate));
																	
		
		candidate_pos = candidate:get_occupier().unit:position();
		
		current_distance = candidate_pos:distance(self.zones[index]:get_centre_pos())
		current_score = 100 * ((target_threat - candidate:get_threat()) / current_distance);
		
		-- if there is an enemy stood closer than our candidate is to the target zone then apply a score penalty
		-- this is to try to prevent our units from repositioning to a zone when that zone position is under fire
		
		if Get_Closest_Standing_Unit_Alliance_Point(self.zones[index]:get_centre_pos(), self.enemy_alliance):position():distance(self.zones[index]:get_centre_pos()) < current_distance then
			current_score = current_score / 2;
		end;
		

																	--bm:out("\t\t\t\t\t\tcandidate_pos = " .. Vector_To_String(candidate_pos));
																	--bm:out("\t\t\t\t\t\tcandidate:get_threat() = " .. tostring(candidate:get_threat()));
																	--bm:out("\t\t\t\t\t\tcurrent_score = " .. current_score);
																	--bm:out("\t\t\t\t\t\thighest_score = " .. highest_score);
																	
		if current_score > highest_score then
																	--bm:out("\t\t\t\t\t\t\t(this is the highest score)");
			highest_score = current_score;
			highest_score_index = i;
			highest_score_distance = current_distance;
		elseif current_score == highest_score then
			-- if the two scores are equal (usually when both zones have a threat of zero) then take the lowest distance
			-- this means we get the closest of the occupied zones as the best candidate (if all are threat zero)
		
			if current_distance < highest_score_distance then
				highest_score = current_score;
				highest_score_index = i;
				highest_score_distance = current_distance;
			end;
		end;
	end;	
	
	--[[
	
	-- now we have the best candidate, normalise its score
	local threat_difference = self.zones[index]:get_threat() - candidate_reassignments[highest_score_index]:get_threat();
	
	-- current_score is now an indication of the threat difference between the subject zone and the candidate zone,
	-- factoring in the distance between them. The current_score is 1 per threat difference at 100m
	current_score = 100 * threat_difference / highest_score_distance;
	
																--bm:out("\t\t\t\tWe have the best candidate (highest_score_index is " .. highest_score_index .. "), threat_difference is " .. threat_difference);
																--bm:out("\t\t\t\tNormalised score is " .. current_score .. ", self.candidate_threshold is " .. self.candidate_threshold);
	]]
	
	if self.is_debug then
		self.bm:out(self.name .. " trying to find reinforcement for zone " .. self.zones[index].name .. ", we have found a best candidate : " .. candidate_reassignments[highest_score_index].name .. " with a threat difference of " .. (target_threat - candidate_reassignments[highest_score_index]:get_threat()) .. ", a distance of " .. highest_score_distance .. " giving a score of " .. highest_score .. ", candidate_threshold is currently " .. self.candidate_threshold);
	end
	
	-- do we move the candidate zone's unit?
	if highest_score > self.candidate_threshold then
																--bm:out("\t\t\t\tMoving unit");
		
		self:move_sunit(candidate_reassignments[highest_score_index], self.zones[index]);
		
		-- rescan everything now that the move is done
		--self:reassign_sunits();
	else
																--bm:out("\t\t\t\tNot moving unit");
	end;
end;




function zone_controller:move_sunit(source, dest)
	if self.is_debug then
		self.bm:out(self.name .. " moving unit from " .. source.name .. " (zone pos: " .. Vector_To_String(source:get_centre_pos()) .. ", unit pos: " .. Vector_To_String(source:get_occupier().unit:position()) .. ") to " .. dest.name .. " (zone pos: " .. Vector_To_String(dest:get_centre_pos()));
	end;

	source:get_occupier().uc:occupy_zone(dest:get_centre_pos(), true);
	
	dest:set_occupier(source:get_occupier());
	source:set_occupier(nil);
end;


function zone_controller:deactivate(reason)
	if self.is_debug then
		if not reason == REASON_ZONE_CONTROLLER_IS_STARTING then
			self.bm:out(self.name .. " no enemies in area, deactivating");
		end;
	end;
	
	-- make all zones in the controller usable again
		
	for i = 1, #self.zones do
		self.zones[i]:set_usable(true);
	end;
	
	self.bm:remove_process(self.name);

	-- watch for activation
	self.bm:register_callback(function() self:watch_for_activate() end, 5000, self.name);
	
	-- watch for all of our units routing
	self:watch_units_routing();
end;


function zone_controller:watch_for_activate()
	self.bm:watch(function() return self:units_in_area() end, 0, function() self:activate(REASON_ZONE_CONTROLLER_UNITS_IN_AREA) end, self.name);
	
	-- monitor the hp of all our units while 'offline' to see if they're being shelled
	self:update_unit_monitor();
	
	self.bm:watch(function() return self:sunits_have_taken_damage() end, 0, function() self:activate(REASON_ZONE_CONTROLLER_UNIT_HAS_TAKEN_DAMAGE) end, self.name);
end;


function zone_controller:update_unit_monitor()
	for i = 1, #self.sunits do
		self.sunits[i].last_size = self.sunits[i].unit:number_of_men_alive();
	end;
	
	self.bm:register_callback(function() self:update_unit_monitor() end, 3000, self.name);
end;


-- have sunits in this controller taken damage since they were last looked at
function zone_controller:sunits_have_taken_damage()
	for i = 1, #self.sunits do
		if self.sunits[i].unit:number_of_men_alive() < self.sunits[i].last_size then
			return true;
		end;
	end;
	
	return false;
end;


function zone_controller:units_in_area()
	local armies = self.enemy_alliance:armies();
	local army = nil;
	local reinforcement_units = nil;
	
																--bm:out("units_in_area called");

	for i = 1, armies:count() do
		army = armies:item(i);
				
																--bm:out("\ttesting army " .. i .. " :: self.trigger_area:units_in_area(army:units()) is " .. self.trigger_area:units_in_area(army:units()) .. " and self.trigger_area:units_in_area(army:get_reinforcement_units()) is " .. self.trigger_area:units_in_area(army:get_reinforcement_units()));
		reinforcement_units = army:get_reinforcement_units();
																
		if self.trigger_area:units_in_area(army:units()) > 0 or (is_units(reinforcement_units) and self.trigger_area:units_in_area(reinforcement_units) > 0) then
																--bm:out("\t\treturning true");
			return true;
		end;
	end;
	
																--bm:out("\t\treturning false");
	return false;
end;










zone_manager = {
	bm = nil,
	name = "",
	controller = nil,
	points = {},
	centre_pos = nil,
	threat = 0,
	occupier = nil,
	usable = true,
	preferred = false,
	is_debug = false,
	preferred_modifier = 1.25,
	max_line_distance = 250,
	max_negative_line_distance = -100,
	max_dist_score = 2,
	max_norm_distance = 100,
	max_norm_score = 2
};


function zone_manager:new(new_bm, new_name, new_controller, new_centre_pos)

	-- type check our startup parameters
	
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Zone Manager: no name given or name invalid");
		
		return false;
	end;
	
	if not is_zonecontroller(new_controller) then
		new_bm:out("Couldn't create Zone Manager " .. new_name .. ": no valid zone controller given");
		
		return false;
	end;
	
	if not is_vector(new_centre_pos) then
		new_bm:out("Couldn't create Zone Manager " .. new_name .. ": no valid centre position given");
		
		return false;
	end;

	
	zm = {};
	setmetatable(zm, self);
	self.__index = self;
	self.__tostring = function() return TYPE_ZONE_MANAGER end;
	
	zm.bm = new_bm;
	zm.name = "Zone_Manager_" .. new_name;
	zm.controller = new_controller;
	zm.centre_pos = new_centre_pos;
	zm.points = {};
	zm.threat = 0;
	zm.usable = true;
	zm.preferred = false;
	zm.is_debug = new_controller.is_debug;
	
	-- register the zone manager to the controller
	zm.controller:add_zone(zm);

	return zm;
end;


function zone_manager:set_points(...)
	for i = 1, arg.n do
		if not is_vector(arg[i]) then
			self.bm:out(self.name .. " error : trying to add points but one of the supplied objects is not a vector, aborting");
		
			return false;
		end;
	
		table.insert(self.points, arg[i]);
	end;
end;


function zone_manager:set_usable(value)
	if not is_bool(value) then
		value = true;
	end;

	self.usable = value;
end;


function zone_manager:get_threat()
	return self.threat;
end;


function zone_manager:get_centre_pos()
	return self.centre_pos;
end;


function zone_manager:is_occupied()
	if self.occupier then
		return true;
	end;
	
	return false;
end;


function zone_manager:is_usable()
	return self.usable;
end;


function zone_manager:set_preferred(new_value)
	if new_value == nil then
		self.preferred = true;
	else
		self.preferred = new_value;
	end;
end;


function zone_manager:is_preferred()
	return self.preferred;
end;


function zone_manager:set_occupier(sunit)
	if is_scriptunit(sunit) then
		self.occupier = sunit;
		self.occupier_start_hp = sunit.unit:number_of_men_alive();
	else
		self.occupier = nil;
		self.occupier_start_hp = 0;
	end;
end;


function zone_manager:get_occupier()
	return self.occupier;
end;


function zone_manager:get_occupier_start_hp()
	return self.occupier_start_hp;
end;


function zone_manager:assess_threat()
	if not self.usable then
		self.threat = 0;
		
		return;
	end;

	local enemy_alliance = self.controller:get_enemy_alliance();
	local armies = nil;
	local score = 0;
	
	-- for each army in the enemy alliance
	armies = enemy_alliance:armies();
	
						-- bm:out("\tzone_manager:assess_threat called");
	
	for i = 1, armies:count() do
						-- bm:out("\ttesting army " .. i .. " of " .. armies:count());
	
		-- add the scores for the units in that army to the cumulative score
		score = score + self:assess_threat_by_units(armies:item(i):units()) + self:assess_threat_by_units(armies:item(i):get_reinforcement_units());
		
						-- bm:out("\tscore is now " .. score);
	end;
	
	--if self.is_debug then
	--	self.bm:out("\t\t" .. self.name .. " :: reassessing threat, new value is " .. score);
	--end;

	self.threat = score;
	
	self.bm:register_callback(function() self:assess_threat() end, 5000, self.controller.name);
end;




function zone_manager:assess_threat_by_units(units)

	-- guard against rogue parameters
	if not is_units(units) then
		return 0;
	end;

	local retval = 0;
	
	--[[
	local highest_score;
	local current_score;
	]]
	
	local cumulative_score;
		
	local line_a;
	local line_b;
	local line_pointer;
	
	
							-- bm:out("\t\tassess_threat_by_units called");
	
	-- for each unit in this collection
	for i = 1, units:count() do
		
		--[[		
		highest_score = 0;
		current_score = 0;
		]]
		
		cumulative_score = 0;
		
	
		-- for each pair of points in the line, calculate threat and then take the most extreme
		for j = 1, (#self.points - 1) do
			line_a = self.points[j];
			line_b = self.points[j + 1];
			
							-- bm:out("\t\ttesting unit " .. i .. " of " .. units:count() .. " against line " .. j .. " of " .. (#self.points - 1) .. ", line ends are " .. Vector_To_String(line_a) .. " and " .. Vector_To_String(line_b));
		
			cumulative_score = cumulative_score + self:assess_threat_to_line(units:item(i):position(), line_a, line_b);
			
			-- complicated rules about which threat we take:
			-- if all the lines report a negative threat then we take the lowest of these
			-- otherwise we take the highest positive threat
			
			--[[
			if retval > 0 then
				if current_score > highest_score then
					-- bm:out("\t\tThis is the most extreme score so far");
					highest_score = current_score;
				end;
			else
				if math.abs(current_score) > math.abs(highest_score) then
					-- bm:out("\t\tThis is the most extreme score so far");
					highest_score = current_score;
				end;
			end;
			]]
			
			
		end;
		
		-- average out the cumulative score by the number of line segments we just considered
		cumulative_score = cumulative_score / (#self.points - 1);
	
		retval = retval + cumulative_score;
		
							-- bm:out("\t\tScore for this unit is " .. highest_score .. ", retval is now " .. retval);
	end;
	
							-- bm:out("\t\tFinished assess_threat_by_units, returning a threat of " .. retval);
	
	return retval;
end;




function zone_manager:assess_threat_to_line(pos, line_a, line_b)

							-- bm:out("\t\t\tassess_threat_to_line called, line is " .. Vector_To_String(line_a) .. " to " .. Vector_To_String(line_b) .. " and the position we're testing is " .. Vector_To_String(pos));

			
	-- get distance from line to position
	local line_distance = Distance_To_Line(line_a, line_b, pos);
	
	-- if this distance is negative and far away then the position is behind the line, return 0
	if line_distance < self.max_negative_line_distance then
							-- bm:out("\t\t\t\tline distance " .. line_distance .. " is less than -100, returning zero");
		return 0;
	end;
	
	-- get centrepoint of line
	local line_centre = Centre_Point_Table({line_a, line_b});
	
	-- take normal of line_centre -> line_a	
	local line_centre_normal = Normal(line_centre, line_a)
	
	-- get absolute distance from pos to line_centre / line_centre_normal
	local normal_distance = math.abs(Distance_To_Line(line_centre, line_centre_normal, pos));
	
	if line_distance > self.max_line_distance then
							-- bm:out("\t\t\t\tline_distance " .. line_distance .. " is greater than max_line_distance " .. self.max_line_distance .. ", returning zero");
							
		return 0;
	end;
	
	
	if normal_distance > self.max_norm_distance then
							-- bm:out("\t\t\t\tnormal_distance " .. normal_distance .. " is greater than max_norm_distance " .. self.max_norm_distance .. ", returning zero");
							
		return 0;
	end;
				
	local normal_score = self.max_norm_score - ((normal_distance * self.max_norm_score) / self.max_norm_distance);
	
	local dist_score = self.max_dist_score - ((math.abs(line_distance) * self.max_dist_score) / self.max_line_distance);
	
	local threat = dist_score * normal_score;
	
	-- if the position was behind the line and we have survived this far into the calculation, make the threat triple negative
	if line_distance < 0 then
		threat = 0 - (3 * threat);
	end;
	
	if self.preferred then
		threat = threat * self.preferred_modifier;
	end;
	
	-- if pos is within 40m, then apply a negative modifier as we don't really want to go here
	if ((line_distance ^ 2) + (normal_distance ^ 2)) < 1600 then
		threat = threat - 3;
	end;
	
							-- bm:out("\t\t\t\tfinished calcs for line, line distance is " .. line_distance .. " (score is " .. dist_score .. ") and normal_distance is " .. normal_distance .. " (score is " .. normal_score .. "), returning threat of " .. threat);
		
	return threat;
end;




