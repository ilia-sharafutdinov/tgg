
----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	ROUT MANAGER
--
--	The Rout Manager is a handy way of forcing all remaining enemy units to rout when only a few of them are left, to avoid the player having to run the last stragglers down.
--
--	The Rout Manager can also be made to consider the player's army, so that the enemy army is not routed if the player also has very few units remaining.
--
--	PARAMETERS:
--	On Creation:
--	BATTLE_MANAGER a link to your battle manager object
--	ID name, ideally a string object describing your rout manager
--	ARMIES collection of all enemy armies
--	ARMIES collection of all friendly armies
--	NUMBER non-dead/routing units threshold below which the rout manager will start considering whether to rout the enemy armies
-----------------------------------------------------------------------------------------------------------

--**	SAMPLE USAGE:
--**
--**	rm_victory = rout_manager:new(
--**									bm,
--**									"Player_Victory",
--**									Armies_Austria,
--**									Armies_France,
--**									3,
--**								);
--**
--**	rm_victory:start();

rout_manager = {
	bm = nil,
	name = "",
	threshold = 1,
	t_enemy_army = {},
	t_allied_army = {},
	rout_units = {},
	additional_check = nil,
	is_running = false
}

function rout_manager:new(new_bm, new_name, new_enemy_armies, new_allied_armies, new_threshold)		
	if not new_bm then
		return false;
	end;
	
	if new_enemy_armies and new_allied_armies and new_name then
		new_bm:out("Creating rout manager " .. new_name);
	
		local rm = {};
					
		setmetatable(rm, self);
		self.__index = self;
			
		rm.bm = new_bm;
		rm.name = new_name;
		rm.t_enemy_army = {};
		rm.t_allied_army = {};
		rm.threshold = new_threshold or 1;
		
		rm.rout_units = {};
		
		for i = 1, new_enemy_armies:count() do
			rm:add_enemy_army(new_enemy_armies:item(i));
		end;
		
		for i = 1, new_allied_armies:count() do
			rm:add_allied_army(new_allied_armies:item(i));
		end;

		return rm;
	end;

	new_bm:out("Rout_Manager: some parameter was junk? Did not create rout manager - your script is probably going to break.");
	return nil;
end;


function rout_manager:set_additional_check(value)
	self.additional_check = value or false;
end;


function rout_manager:add_enemy_army(new_army)
	table.insert(self.t_enemy_army, new_army);
	
	local rout_units_index = #self.rout_units + 1;
		
	if self.bm:is_naval() then
		for j = 1, new_army:ships():count() do
			self.rout_units[rout_units_index] = {};
			self.rout_units[rout_units_index].unit = new_armyships():item(j);
			self.rout_units[rout_units_index].unitcontroller = new_army:create_ship_controller();
			self.rout_units[rout_units_index].unitcontroller:add_units(self.rout_units[rout_units_index].unit);

			if self.is_running then
				self.bm:watch(
						function() 
							return self.rout_units[rout_units_index].unit and self.rout_units[rout_units_index].unit:is_routing() 
						end, 
						0, 
						function() 
							self.rout_units[rout_units_index].unitcontroller:morale_behavior_rout()
						end,
						"Rout_Manager"
					);
			end;

			rout_units_index = rout_units_index + 1;
		end;
	else
		for i = 1, new_army:units():count() do
			self.rout_units[rout_units_index] = {};
			self.rout_units[rout_units_index].unit = new_army:units():item(i);
			self.rout_units[rout_units_index].unitcontroller = new_army:create_unit_controller();
			self.rout_units[rout_units_index].unitcontroller:add_units(self.rout_units[rout_units_index].unit);

			if self.is_running then
				self.bm:watch(
						function() 
							return self.rout_units[rout_units_index].unit and self.rout_units[rout_units_index].unit:is_routing() 
						end, 
						0, 
						function()
							self.rout_units[rout_units_index].unitcontroller:morale_behavior_rout()
						end,
						"Rout_Manager"
					);
			end;
				
			rout_units_index = rout_units_index + 1;
		end;
	end;
end;


function rout_manager:add_allied_army(new_army)
	table.insert(self.t_allied_army, new_army);
end;


function rout_manager:start()
	self.bm:watch(function() return self:check() end, 0, function() self:threshold_reached() end, "Rout_Manager");
	
	for i = 1, #self.rout_units do
		self.bm:watch(
						function() 
							return self.rout_units[i].unit and Is_Unit_Routing_Or_Dead(self.rout_units[i].unit) 
						end, 
						0, 
						function()
							--self.bm:out("Rout watch triggered for " .. self.name .. "! Keeping unit routing!");
							self.rout_units[i].unitcontroller:morale_behavior_rout()
						end,
						"Rout_Manager"
					);
	end;
	
	self.bm:out("Starting rout manager " .. self.name .. ", added " .. #self.rout_units .. " unit watches.");
end;


function rout_manager:check()
	local non_routing_enemy_units = 0;
	local non_routing_allied_units = 0;
	   
	if self.bm:is_naval() then
		for i = 1, #self.t_enemy_army do
			for j = 1, self.t_enemy_army[i]:ships():count() do
				if (not self.t_enemy_army[i]:ships():item(j):is_routing()) and (not self.t_enemy_army[i]:ships():item(j):is_surrendered())
							and self.t_enemy_army[i]:ships():item(j):number_of_men_alive() > 0 then
						
					non_routing_enemy_units = non_routing_enemy_units + 1;
				end;
			end;
		end;
		
		for i = 1, #self.t_allied_army do
			for j = 1, self.t_allied_army[i]:ships():count() do
				if (not self.t_allied_army[i]:ships():item(j):is_routing()) and (not self.t_allied_army[i]:ships():item(j):is_surrendered())
							and self.t_allied_army[i]:ships():item(j):number_of_men_alive() > 0 then
							
					non_routing_allied_units = non_routing_allied_units + 1;
				end;
			end;
		end;
	else
		for i = 1, #self.t_enemy_army do
			for j = 1, self.t_enemy_army[i]:units():count() do
				if (not self.t_enemy_army[i]:units():item(j):is_routing()) and self.t_enemy_army[i]:units():item(j):number_of_men_alive() > 0 then
					non_routing_enemy_units = non_routing_enemy_units + 1;
				end;
			end;
		end;
		
		for i = 1, #self.t_allied_army do
			for j = 1, self.t_allied_army[i]:units():count() do
				if (not self.t_allied_army[i]:units():item(j):is_routing()) and self.t_allied_army[i]:units():item(j):number_of_men_alive() > 0 then
					non_routing_allied_units = non_routing_allied_units + 1;
				end;
			end;
		end;
	end;

	if non_routing_enemy_units < self.threshold and non_routing_allied_units > non_routing_enemy_units * 2.5 then
		if self.additional_check then
			if self.additional_check() then
				return true;
			end;
		else
			return true;
		end;
	end;

	return false;
end;


function rout_manager:threshold_reached()
	self.bm:out("Rout Manager " .. self.name .. ": Threshold Reached !!!");

	self:cancelall();

	self:rout();
end;


function rout_manager:rout()
	for i = 1, #self.rout_units do
		self.rout_units[i].unitcontroller:morale_behavior_rout();
	end;
end;


function rout_manager:cancelall()
	self.bm:remove_process("Rout_Manager");
	self.bm:remove_process("Rout_Manager_Test_Rout");
end;


function rout_manager:test_rout()
	local timevalue = 0;
	
	for i = 1, #self.rout_units do
		timevalue = timevalue + 3000;
		
		bm:register_callback(function() self.rout_units[i].unitcontroller:morale_behavior_rout() end, timevalue, "Rout_Manager_Test_Rout");
	end;
end;