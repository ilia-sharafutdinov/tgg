
function Unit_Is_Routing_Or_Dead(array_name, index)
	if ((array_name[index]:number_of_men_alive() == 0) or (array_name[index]:is_routing())) then
		return true
	else
		return false
	end
end

function Unit_Is_Routing_Or_Dead2(unit_name)
	if(unit_name == nil) then
		error("Unit name is nil")
		battle:out(debug.traceback())
	else
		if ((unit_name:number_of_men_alive() == 0) or (unit_name:is_routing())) then
			return true
		else
			return false
		end
	end
end

function Unit_Is_Not_Routing_And_Is_Not_Dead(new_array_name, index)
	if ((new_array_name[index]:number_of_men_alive() > 0) and not (new_array_name[index]:is_routing())) then
		return true
	else
		return false
	end
end


function Unit_Is_Not_Routing_And_Is_Not_Dead2(unit_name)
	if(unit_name == nil) then
		error("Unit name is nil")
		battle:out(debug.traceback())
	else
		if ((unit_name:number_of_men_alive() > 0) and not (unit_name:is_routing())) then
			return true
		else
			return false
		end
	end
end


function Unit_Is_Routing_Or_Dead_By_Table_Name(T)
	if(T.Unit_Name[T.Unit_Num] == nil) then
		error("Unit name is nil")
		battle:out(debug.traceback())
	else
		if ((T.Unit_Name[T.Unit_Num]:number_of_men_alive() == 0) or (T.Unit_Name[T.Unit_Num]:is_routing())) then
			return true
		else
			return false
		end
	end
end

function Unit_Is_Not_Routing_And_Is_Not_Dead_By_Table_Name(T)
	if(T.Unit_Name[T.Unit_Num] == nil) then
		error("Unit name is nil")
		battle:out(debug.traceback())
	else
		if ((T.Unit_Name[T.Unit_Num]:number_of_men_alive() > 0) and not (T.Unit_Name[T.Unit_Num]:is_routing())) then
			return true
		else
			return false
		end
	end
end

function Any_Unit_Is_Routing_Or_Dead_By_Table_Name(...)
	for index = 1,arg.n do
		if (arg[index].Unit_Name[arg[index].Unit_Num] == nil) then
			error("Unit name is nil")
			battle:out(debug.traceback())
		else
			if ((arg[index].Unit_Name[arg[index].Unit_Num]:number_of_men_alive() == 0) or (arg[index].Unit_Name[arg[index].Unit_Num]:is_routing())) then
				return true
			else
				return false
			end
		end
	end
end


function All_Units_Are_Routing_Or_Dead_By_Table_Name(...)
	for index = 1,arg.n do
		if (arg[index].Unit_Name[arg[index].Unit_Num] == nil) then
			error("Unit name is nil")
			battle:out(debug.traceback())
			return false
		else
			if ((arg[index].Unit_Name[arg[index].Unit_Num]:number_of_men_alive() == 0) or (arg[index].Unit_Name[arg[index].Unit_Num]:is_routing())) then
				-- do nothing
			else
				return false
			end
		end
	end
	
	return true					-- If we have gotten this far then it means that all the specified units have routed or are dead
end

-- ------------------------------------------------------------ --
--
-- Function to calculate if a unit is inside a trigger box
--
-- ------------------------------------------------------------ --

function Is_Unit_Inside_Trigger_Box(Unit, Min_x, Min_z, Max_x, Max_z)
	if(((Min_x < Unit:position():get_x()) and (Unit:position():get_x() < Max_x))	and
	((Min_z < Unit:position():get_z()) and (Unit:position():get_z() < Max_z))) then
		return true
	else 
		return false
	end	
end


function Distance_To_Unit_Is_Less(Unit1, Enemy_Name_T, T)
	
	T.Min_Distance = T.Original_Min_Distance;   -- I set this back to its original distance in case the unit range function has changed it.
	local Shortest_Distance = 20000

	for a = 1, #Enemy_Name_T do
		Enemy_Name = Enemy_Name_T[a]
		
		for i, Enemy_Unit in ipairs(Enemy_Name) do
			if (T.Unit_Name[T.Unit_Num]:is_cavalry()) and (Enemy_Unit:is_currently_garrisoned()) then
			-- Do nothing, we dont want any cavalry unit to try to attack a garrisoned house, it looks stupid.
			else
				if (Unit_Is_Not_Routing_And_Is_Not_Dead2(Enemy_Unit)) then
					
					Unit_Distance = Unit1:unit_distance(Enemy_Unit)
				
					if (Unit_Distance <= Shortest_Distance) then
						Shortest_Distance = Unit_Distance
						Remember_This_Unit = Enemy_Unit
					end
				end
			end
		end
	end
	
	if(Shortest_Distance <= T.Min_Distance) then
		T.Enemy_Unit = Remember_This_Unit;
		return true;
	else
		T.Enemy_Unit = nil
		return false
	end
			
end




function Distance_From_Unit_To_Any_Enemy_Is_Less(T, Distance, Operator)
	
	for a = 1, #T.Enemy_Army do	
		
		for i, Enemy_Unit in ipairs(T.Enemy_Army[a]) do
			if (Unit_Is_Not_Routing_And_Is_Not_Dead2(Enemy_Unit)) then
					
				Unit_Distance = T.Unit_Name[T.Unit_Num]:unit_distance(Enemy_Unit)
				
				if (Operator == "Less_Than") then
					if (Unit_Distance < Distance) then
						return true
					end
				elseif (Operator == "Less_Than_Or_Equals_To") then
					if (Unit_Distance <= Distance) then
						return true
					end
				elseif (Operator == "Greater_Than") then
					if (Unit_Distance > Distance) then
						return true
					end
				elseif (Operator == "Greater_Than_Or_Equals_To") then
					if (Unit_Distance >= Distance) then
						return true
					end
				elseif (Operator == "Equals_To") then
					if (Unit_Distance == Distance) then
						return true
					end
				elseif (Operator == "Not_Equals_To") then
					if (Unit_Distance ~= Distance) then
						return true
					end
				end
			end
		end
	end	
	
	return false				-- if I get here then it means I failed the conditional check for every enemy unit in every enemy army
end


-- --------------------------------------------------------------- ----------------
--
--	This is a generic function which checks if the distance between the selected unit and all its emenies are less than a certain value. If it is not, it then checks if
-- 	the distance stays that way for 10 seconds. If it does then script regains control and patrols the unit back to its starting pos. If it doesnt then the count resets and keeps going
-- 	until it does.
-- 	PARAMETERS
--	Counter_10_Second 		=	The counter that gets compared against the counter time to see if it is equal to 10 seconds.
--	Counter_Num				=	The counter that gets passed into the Check_The_Distance_Between_Specified_Units function.
--	Registered_Bool_Name 	=	When any function is registered I set a _registered bool to true, and false when that function is unregistered so i have a list of which functions are registered.
--	Released_Bool_Name		=	When any of the units are released to ai control i set a _released bool so i know which units are released and which are under script control. 	
--	Unit_Num				=	The index of the unit in question in the units array (it makes the index in the xml file).
--	Controller_Name			=	Each unit under script control has a controller name and i pass it in to this function so i can control the unit from within the function. 	
--	Unit_String_Name		=	The string name of the unit in question so i can use it to output info to the console for debugging purposes. 
--	Location				=	The starting position of the unit in question. 		
--	Orientation				=	The starting orientation of the unit in quesiton.
--	Width					=	The starting width of the unit in question. 
--	Min_Distance			=	The minimum distance that you want every enemy unit to be away from the unit in question.
--
-- --------------------------------------------------------------- ----------------

function Check_If_Unit_Distance_Goes_Greater_Than_75_And_Stays_That_Way(T)

	local Return_Bool_Value = false;
	T.Registered_Bool_Name = true;

	-- First thing we need to do is to check if the distance from this enemy unit to any of the player units is less than the min distance, if it is we do nothing.
	-- If it isnt then we set a timer going, when the timer reaches 10 (i.e. 10 seconds) we send the troops back to their starting positions and 
	-- set the released bool to false so that we can check for any more attackers approaching close by.
	
	T.Counter_10_Second = Check_The_Distance_Between_Specified_Units(T.Counter_Num, T)
	
	--battle:out("Counter_" ..T.Unit_String_Name.."_10_Second == " .. T.Counter_10_Second)
	
	T.Counter_Num = T.Counter_10_Second;
	
	if (T.Counter_10_Second == T.Original_Counter_10_Second) then
	
		T.Counter_10_Second = 0;
		T.Counter_Num = 0;
		T.Controller_Name:take_control();
		--battle:out(T.Unit_String_Name .. " should be returning to their original positions now")
		
		-- Tell the units to return to their starting positions and reset Released_Bool_Name to false
		if (Unit_Is_Not_Routing_And_Is_Not_Dead(T.Unit_Name, T.Unit_Num)) then
			--battle:out(T.Unit_String_Name .. " returning to pos")
			T.Controller_Name:take_control();
			T.Controller_Name:goto_location_angle_width(T.Location, T.Orientation, T.Width, true);
		end
		
		T.Released_Bool_Name = false;
		Return_Bool_Value = true;
	end
	
	return Return_Bool_Value;
	
end


-- -------------------------------------------------- --
--
-- This function checks if the distance from this enemy unit to any of the player units is less than the min distance, if it is we set the counter to 0.
-- If it isnt then we increment the timer by 1
--
-- -------------------------------------------------- --

function Check_The_Distance_Between_Specified_Units(Counter_Number, T_Name)

	--battle:out("Distance  = " .. Distance_Between_Units)
	if (T_Name.Enemy_Unit == nil) then
		Counter_Number = Counter_Number + 1
	else
		local Distance_Between_Units = T_Name.Unit_Name[T_Name.Unit_Num]:unit_distance(T_Name.Enemy_Unit)
		
		if(T_Name.Unit_Name[T_Name.Unit_Num]:is_cavalry()) and (T_Name.Enemy_Unit:is_currently_garrisoned()) then
			Counter_Number = Counter_Number + 1
		else	
			if ((Distance_Between_Units < T_Name.Min_Distance) and (Unit_Is_Not_Routing_And_Is_Not_Dead2(T_Name.Enemy_Unit))) then
				-- Set the counter to 0
				Counter_Number = 0
			else
				-- Increment the counter
				Counter_Number = Counter_Number + 1
			end	
		end
	end
	
	return Counter_Number;	
end


-- ------------------------------------------------------------ -----
--
-- Function checks if the unit passed into the parameter is attacked
--
-- ------------------------------------------------------------ -----

function Check_If_Unit_Is_Attacked(T_Name)	
	bm:register_callback(function() Check_If_Unit_Is_Attacked(T_Name) end, 1000, "Check_If_" .. T_Name.Unit_String_Name .. "_Is_Attacked");
		
	T_Name.Bool_Check_If_Unit_Is_Attacked_Registered = true;
		
	if (Unit_Is_Routing_Or_Dead2(T_Name.Unit_Name[T_Name.Unit_Num])) then
		--battle:out("Unregister Check_If_"..T_Name.Unit_String_Name.."_Is_Attacked");
		T_Name.Bool_Check_If_Unit_Is_Attacked_Registered = false;
		T_Name.Bool_Dead_Or_Routing = true;
		T_Name.Controller_Name:take_control();
		T_Name.Controller_Name:morale_behavior_rout();
		bm:remove_process("Check_If_".. T_Name.Unit_String_Name .. "_Is_Attacked");
	else
		if ((T_Name.Released_Bool_Name == false) and ((Distance_To_Unit_Is_Less(T_Name.Unit_Name[T_Name.Unit_Num], T_Name.Enemy_Army, T_Name)) or (Unit_In_Enemies_Range(T_Name.Enemy_Army, T_Name)))) then
			if (T_Name.Unit_String_Name == "General_Napoleon") then
				bm:out("Check_If_" .. T_Name.Unit_String_Name .. "_Is_Attacked")
			end	
			--battle:out("Releasing control of " ..T_Name.Unit_String_Name)
			
			if (T_Name.Release_Not_Attack) then
				T_Name.Controller_Name:release_control()
			else
				if (T_Name.Unit_Name[T_Name.Unit_Num]:ammo_left() == 0) then
					-- Attack in melee
					--T_Name.Controller_Name:change_melee(true)
					T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, true, true)
				else
					-- Else attack with missiles
					T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, true, true)
				end
			end
			
			T_Name.Released_Bool_Name = true;
			T_Name.Is_Attacked = true;
			bm:register_callback(function() Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name) end, 1000, "Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");	
		end
	end
end


function Unit_In_Enemies_Range(Enemy_Name_T, T)

	for a = 1, #Enemy_Name_T do
		Enemy_Name = Enemy_Name_T[a]
		
		for i, Enemy_Unit in ipairs(Enemy_Name) do
			
			if (T.Unit_Name[T.Unit_Num]:is_cavalry()) and (Enemy_Unit:is_currently_garrisoned()) then
			-- Do nothing, we dont want any cavalry unit to try to attack a garrisoned house, it looks stupid.
			else		
				if (Unit_Is_Not_Routing_And_Is_Not_Dead2(Enemy_Unit)) then
						
					Unit_Distance = T.Unit_Name[T.Unit_Num]:unit_distance(Enemy_Unit)
											
					if ((Enemy_Unit:is_artillery()) and (Unit_Distance <= 80)) then
						T.Min_Distance = 80;
						T.Enemy_Unit = Enemy_Unit;
						return true;
					end
					
					if((Unit_Distance <= (Enemy_Unit:missile_range())) and not (Enemy_Unit:is_artillery())) then
						T.Min_Distance = (Enemy_Unit:missile_range());	
						T.Enemy_Unit = Enemy_Unit;
						return true;
					end
				end
			end
		end
	end
	
	T.Enemy_Unit = nil
	return false
end

-- --------------------------------------------------------------- --------------------------------------------------------
--
--	Function checks if any unit is within a certain distance of the passed in value and if so then stay released to the ai
--
-- --------------------------------------------------------------- --------------------------------------------------------

function Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name)
	bm:register_callback(function() Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name) end, 1000, "Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
	
	T_Name.Registered_Bool_Name = true;
	if (T_Name.Unit_String_Name == "General_Napoleon") then
		bm:out("Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater")
	end
	
	if (T_Name.Bool_Dead_Or_Routing) then
		--battle:out("Unregister Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
		T_Name.Registered_Bool_Name = false;
		T_Name.Is_Attacked = false;
		bm:remove_process("Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
	else
		
		-- What im doing here is checking if the unit who has been targetted for attack is still alive or if the unit targetted is garrisoned in a building and the attacking unit is cavalry, 
		-- then if it isnt then i want to find the next nearest unit so the enemy don't just stand around doing nothing.
		if (T_Name.Enemy_Unit ~= nil and ((((T_Name.Unit_Name[T_Name.Unit_Num]:is_cavalry()) and (T_Name.Enemy_Unit:is_currently_garrisoned())) or (Unit_Is_Routing_Or_Dead2(T_Name.Enemy_Unit)))and not (T_Name.Release_Not_Attack))) then
			--battle:out(T_Name.Unit_String_Name .. "knows that building is garrisoned")
			Distance_To_Unit_Is_Less(T_Name.Unit_Name[T_Name.Unit_Num], T_Name.Enemy_Army, T_Name) -- I dont care about the return value, i only want it to update its enemy field.
			--battle:out(T_Name.Unit_String_Name.. ".Enemy_Unit:ammo_left() = " .. T_Name.Unit_Name[T_Name.Unit_Num]:ammo_left())
			if (T_Name.Enemy_Unit == nil) then
				-- Do nothing
			else
				if (T_Name.Bool_Attacking_In_Melee == true) then
					if not (T_Name.Enemy_Unit:is_currently_garrisoned()) then
						--battle:out("No longer Attacking in Melee2")
						T_Name.Controller_Name:melee(false)
						T_Name.Controller_Name:leave_building()
						T_Name.Controller_Name:attack_unit_q(T_Name.Enemy_Unit, false, true)
						--Go_To_This_Location(T_Name, true);
						T_Name.Bool_Attacking_In_Melee = false
					end
				else
					if (T_Name.Unit_Name[T_Name.Unit_Num]:ammo_left() == 0) then
						-- Attack in melee
						T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, false, true)
						--battle:out("MELEE ATTACK")
					else
						-- Else attack with missiles
						T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, true, true)
					end
				end
			end
			--battle:out("Got in here");
		end
	
		
		if (T_Name.Release_Not_Attack) then
			End_Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name)
		else
			if(T_Name.Enemy_Unit == nil) then
				if (T_Name.Bool_Attacking_In_Melee == true) then
					T_Name.Controller_Name:melee(false)
					T_Name.Controller_Name:leave_building()
					T_Name.Bool_Attacking_In_Melee = false
				end
				End_Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name)
			else
				if not (Distance_To_Enemy_Unit_Is_Less(T_Name)) then
					--battle:out(T_Name.Unit_String_Name .. " Distance to Enemy Unit is greater");
					
					-- Here I look like im doing the same thing as above again but im actually checking to see if after the enemy have gone outside the minimum range (and not routed/died
					-- gone in houses when unit is cavalry) and if they have then is there another unit close by to attack.
					Distance_To_Unit_Is_Less(T_Name.Unit_Name[T_Name.Unit_Num], T_Name.Enemy_Army, T_Name) -- I dont care about the return value, i only want it to update its enemy field.
					
					if (T_Name.Enemy_Unit == nil) then
						-- Do nothing
					else
						if (T_Name.Unit_Name[T_Name.Unit_Num]:ammo_left() == 0) then
							-- Attack in melee
							--T_Name.Controller_Name:change_melee(true)
							T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, false, true)
						else
							-- Else attack with missiles
							T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, true, true)
						end
					end
					
					End_Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name)
					
				else
					if (T_Name.Bool_Attacking_In_Melee == false) and (T_Name.Unit_Name[T_Name.Unit_Num]:is_infantry() and T_Name.Enemy_Unit:is_currently_garrisoned()) then
						--battle:out("Attack in Melee")
						--local House_Index = Find_Which_Building_To_Go_To(Buildings_Array, T_Name.Enemy_Unit:position():get_x(), T_Name.Enemy_Unit:position():get_z())
						local House_Index = Find_Which_Building_To_Go_To(T_Name.B_Table, T_Name.Enemy_Unit:position():get_x(), T_Name.Enemy_Unit:position():get_z())
						--battle:out("House Index = "..House_Index)
						if (House_Index == nil) then
							-- do nothing
							--battle:out("COULDN'T FIND HOUSE")
						else
							T_Name.Controller_Name:melee(true)
							T_Name.Min_Distance = 100;
							T_Name.Controller_Name:defend_building(T_Name.B_Table[House_Index], true)
							--T_Name.Controller_Name:attack_unit(T_Name.Enemy_Unit, true, true) -- If the enemy has gone into a house then attack in melee
							T_Name.Bool_Attacking_In_Melee = true
						end
					end
					if (T_Name.Bool_Attacking_In_Melee == true) and (T_Name.Unit_Name[T_Name.Unit_Num]:is_infantry() and not T_Name.Enemy_Unit:is_currently_garrisoned()) then
						--battle:out("No longer Attacking in Melee")
						T_Name.Controller_Name:melee(false)
						T_Name.Controller_Name:leave_building()
						T_Name.Controller_Name:attack_unit_q(T_Name.Enemy_Unit, false, true)
						--T_Name.Controller_Name:goto_location_angle_width_q(T_Name.Location, T_Name.Orientation, T_Name.Width, true);	
						--Go_To_This_Location(T_Name, true);
						T_Name.Bool_Attacking_In_Melee = false
					end
				end
			end		
		end
	end
end

function End_Check_If_Distance_Goes_Greater_Than_A_Num_And_Stays_That_Way(T_Name)
	local New_Bool_Value = Check_If_Unit_Distance_Goes_Greater_Than_75_And_Stays_That_Way(T_Name)
	if (New_Bool_Value == true) then
		T_Name.Bool_Attacking_In_Melee = false
		T_Name.Controller_Name:melee(false)
		T_Name.Registered_Bool_Name = false;
		--battle:out("About to remove "  .. T_Name.Unit_String_Name .. " Distance function");
		T_Name.Is_Attacked = false;
		bm:remove_process("Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
	end
end

-----------------------------------------------------------------------------------------------------------
-- Function to move the troops to a location, the 3rd argument determines which position they should go to
-----------------------------------------------------------------------------------------------------------

function Go_To_This_Location(T, Movement_Speed, ...)
	if arg.n == 0 then
		T.Controller_Name:goto_location_angle_width(T.Location, T.Orientation, T.Width, Movement_Speed)
	else
		T.Location = arg[1]
		T.Orientation = arg[2]
		T.Width = arg[3]
		
		T.Controller_Name:goto_location_angle_width(T.Location, T.Orientation, T.Width, Movement_Speed)
	end
end


function Unregister_Unit(T_Name)
	--if (T_Name.Bool_Check_If_Unit_Is_Attacked_Registered) then
	--	T_Name.Bool_Check_If_Unit_Is_Attacked_Registered = false;
		bm:out("Unregister Check_If_"..T_Name.Unit_String_Name.."_Is_Attacked");
		bm:remove_process("Check_If_".. T_Name.Unit_String_Name .. "_Is_Attacked");
	--end
	--if (T_Name.Registered_Bool_Name) then
	--	T_Name.Registered_Bool_Name = false;
		bm:out("Unregister Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
		bm:remove_process("Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
	--end
end

-- This function takes a Table as its parameter and returns true if the distance from the unit in the table to thats units enemy is less than the specified distance.
-- In order for this function to work the table must contain a Unit_Name, Unit_Num, Min_Distance and Enemy_Unit field 
-- eg
-- T_Furster = {Unit_Num = 12,
-- Unit_Name = ai_unit_russia,
-- Min_Distance = 75,
-- Enemy_Unit = T_Name.Enemy_Army[1]}

function Distance_To_Enemy_Unit_Is_Less(T)
	
	if (Unit_Is_Not_Routing_And_Is_Not_Dead2(T.Enemy_Unit)) then

		Unit_Distance = T.Unit_Name[T.Unit_Num]:unit_distance(T.Enemy_Unit)
		--battle:out("Inside_Function Unit_Distance = " .. Unit_Distance)
		--battle:out("Inside_Function T.Min_Distance = " .. T.Min_Distance)
		
		if(Unit_Distance <= T.Min_Distance) then
			return true;
		end
	end
end

function Distance_To_Pos_Is_Less(Unit1, Pos_Name, Distance_Value)
	
	vec_Unit = Unit1:position();
	vec_Unit:set_y(0);
	
	Pos_Name:set_y(0);
	
	Pos_Distance = vec_Unit:distance(Pos_Name);
		
	if(Pos_Distance < Distance_Value) then
		return true;
	else
		return false;
	end
end

function Check_If_Unit_In_Enemies_Range(Enemy_Name, T)

	for i, Enemy_Unit in ipairs(Enemy_Name) do
		
		if (Unit_Is_Not_Routing_And_Is_Not_Dead2(Enemy_Unit)) then
				
			Unit_Distance = T.Unit_Name[T.Unit_Num]:unit_distance(Enemy_Unit)
			--battle:out(T.Unit_String_Name.." Unit_Distance = " .. Unit_Distance)		
			--battle:out(T.Unit_String_Name.." missile_range() = " .. Enemy_Unit:missile_range())		
			
			if ((Enemy_Unit:is_artillery()) and (Unit_Distance <= 80)) then
				return true;
			end
			
			if((Unit_Distance <= (Enemy_Unit:missile_range())) and not (Enemy_Unit:is_artillery())) then
				return true;
			end
		end
	end
end


function Check_If_Unit_Should_Enter_Building(T_Name)
	bm:register_callback(function() Check_If_Unit_Should_Enter_Building(T_Name) end, 1000, "Check_If_" .. T_Name.Unit_String_Name .. "_Should_Enter_Building");	
	
	if (T_Name.Unit_Name[T_Name.Unit_Num]:number_of_men_alive() < T_Name.Building_Number) then
	
		-- I only want to garrison troops in buildings if they are near to them, i dont want them walking half way across the map to get to a building when it could be destroyed by then.
		if (Distance_To_Pos_Is_Less(T_Name.Unit_Name[T_Name.Unit_Num],  T_Name.Pos_Building, 150)) then
			--bm:out("Close enough to building to Garrison it")
			
			if (T_Name.Bool_Check_If_Unit_Is_Attacked_Registered) then
				T_Name.Bool_Check_If_Unit_Is_Attacked_Registered = false;
				--battle:out("Unregister Check_If_"..T_Name.Unit_String_Name.."_Is_Attacked");
				bm:remove_process("Check_If_".. T_Name.Unit_String_Name .. "_Is_Attacked");
			end
			if (T_Name.Registered_Bool_Name) then
				T_Name.Registered_Bool_Name = false;
				--battle:out("Unregister Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
				bm:remove_process("Check_If_" .. T_Name.Unit_String_Name .. "_Distace_Goes_Greater");
			end
		
			T_Name.Controller_Name:take_control()
			--Garrison_Building(Buildings_Array, T_Name, T_Name.Pos_Building, true)
			Garrison_Building(T_Name.B_Table, T_Name, T_Name.Pos_Building, true)

			bm:register_callback(function() Check_Status_Of_Building(T_Name) end, 1000, "Check_Status_Of_Building_" .. T_Name.Unit_String_Name)
			T_Name.Bool_Entered_Building = true
			bm:remove_process("Check_If_" .. T_Name.Unit_String_Name .. "_Should_Enter_Building");
		else
			--bm:out("Too far from building to Garrison it")
			T_Name.Bool_Entered_Building = true
			bm:remove_process("Check_If_" .. T_Name.Unit_String_Name .. "_Should_Enter_Building");
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------
-- Function to check if the building in which such and such is garrisoned is in danger of collapsing, if it is then i get the troops out of there
-------------------------------------------------------------------------------------------------------------------------------------------------

function Check_Status_Of_Building(T_Name)
	bm:register_callback(function() Check_Status_Of_Building(T_Name) end, 10000, "Check_Status_Of_Building_" .. T_Name.Unit_String_Name);
	
	--bm:out(T_Name.Unit_String_Name.." check status of this building")

	if (Unit_Is_Routing_Or_Dead(T_Name.Unit_Name, T_Name.Unit_Num)) then
		--bm:out(T_Name.Unit_String_Name.." is routing or dead so unregistering this building")
		bm:remove_process("Check_Status_Of_Building_".. T_Name.Unit_String_Name);
	else
	
		--local index = Find_Which_Building_To_Go_To(Buildings_Array, T_Name.Pos_Building:get_x(), T_Name.Pos_Building:get_z())
		local index = Find_Which_Building_To_Go_To(T_Name.B_Table, T_Name.Pos_Building:get_x(), T_Name.Pos_Building:get_z())
	
		if (index == nil) then
			--bm:out("Couldnt find "..T_Name.Unit_String_Name.."'s building")
			bm:remove_process("Check_Status_Of_Building_".. T_Name.Unit_String_Name);
		else
			-- If the building is 50% damaged I abandon ship
			if (battle:buildings():item(index):health() <= 0.1 ) then
				--battle:out("Abandon "..T_Name.Unit_String_Name.."'s ship")
				T_Name.Location = T_Name.Abandon_Building_Location
				T_Name.Width = T_Name.Abandon_Building_Width
				T_Name.Orientation = T_Name.Abandon_Building_Orientation
				T_Name.Released_Bool_Name = false
				Go_To_This_Location(T_Name, true)
				bm:register_callback(function() Check_If_Unit_Is_Attacked(T_Name) end, 1000, "Check_If_" .. T_Name.Unit_String_Name .. "_Is_Attacked");
				bm:remove_process("Check_Status_Of_Building_".. T_Name.Unit_String_Name);
			else
				--battle:out(T_Name.Unit_String_Name.."'s buildings health is > 0.5")
			end
		end
	end
end

-- ------------------------------------------------------------ --------------------------------------------------------------------------------------
--
-- This function takes the X. Z value of the centre point of the building you want your men to go to and it returns the index of that building for use
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------------------

function Find_Which_Building_To_Go_To(Array_Name, X_Value, Z_Value)
	
	-- Initialise these 4 values to some random big number
	local X_Temp_Difference = 100;
	local Z_Temp_Difference = 100;
	local X_Difference = 100;
	local Z_Difference = 100;
	
--	for i = 1, battle:buildings():count() do	
--		Buildings_Array[i] = battle:buildings():item(i);
--	end
	
--	for i = 1, battle:buildings():count() do	
	for i, Building_Unit in ipairs(Array_Name) do
		--X_Temp_Difference = Array_Name[i]:position():get_x() - X_Value;
		--Z_Temp_Difference = Array_Name[i]:position():get_z() - Z_Value;
		X_Temp_Difference = Building_Unit:position():get_x() - X_Value;
		Z_Temp_Difference = Building_Unit:position():get_z() - Z_Value;
		
		X_Difference = math.sqrt( X_Temp_Difference * X_Temp_Difference )
		Z_Difference = math.sqrt( Z_Temp_Difference * Z_Temp_Difference )
		
		
		if ((X_Difference < 5) and (Z_Difference < 5)) then
			return i;
			--break;
		end
	end	
	
	return nil; -- Im returning a huge number cause i know if i didnt find a proper house then i know i didnt find a house and i dont want the game to crash as a result
end

-- ------------------------------------------------------------ --------------------------------------------------------------------------
--
-- This function takes the unit in the controller name and garrisons it inside the building positioned at the given Pos_Name co-ordinates
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------

function Garrison_Building(Building_Array, Table_Name, Pos_Name, Move_Speed)
	index = Find_Which_Building_To_Go_To(Building_Array, Pos_Name:get_x(), Pos_Name:get_z())
	
	if (index == nil) then -- Didnt find a suitable house, maybe the co-ordinates given for the house are incorrect cause the house was moved when the map was being tidied up.
		bm:out("Couldnt find a suitable building to go into, the co-ordinates supplied don't match up to a building position")
		bm:register_callback(function() Check_If_Unit_Is_Attacked(Table_Name) end, 1000, "Check_If_" .. Table_Name.Unit_String_Name .. "_Is_Attacked");

	else
		-- First need to check if the building has been attacked, i dont want to garrison troops in a building thats already been attacked.
		if (Building_Array[index]:health() == 1.0 ) then
			if not (Building_Array[index]:is_garrisoned()) then
				Table_Name.Controller_Name:defend_building(Building_Array[index], Move_Speed)
			else
				--battle:out("Cannot garrison in this building as building is already garrisoned so setting up script control again");
				bm:register_callback(function() Check_If_Unit_Is_Attacked(Table_Name) end, 1000, "Check_If_" .. Table_Name.Unit_String_Name .. "_Is_Attacked");
			end	
		else
			bm:out("Building is too damaged for the troops to garrison in")
			bm:register_callback(function() Check_If_Unit_Is_Attacked(Table_Name) end, 1000, "Check_If_" .. Table_Name.Unit_String_Name .. "_Is_Attacked");
		end
	end
end


-- ------------------------------------------------------------ --------------------------------------------------------------------------
--
-- This function takes the unit in the controller name and garrisons it inside the building positioned at the given Pos_Name co-ordinates
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------

function Move_Into_Building(Building_Array, Table_Name, Pos_Name, Move_Speed)
	index = Find_Which_Building_To_Go_To(Building_Array, Pos_Name:get_x(), Pos_Name:get_z())
	
	if (index == nil) then -- Didnt find a suitable house, maybe the co-ordinates given for the house are incorrect cause the house was moved when the map was being tidied up.
		bm:out("Couldnt find a suitable building to go into, the co-ordinates supplied don't match up to a building position")
		bm:register_callback(function() Check_If_Unit_Is_Attacked(Table_Name) end, 1000, "Check_If_" .. Table_Name.Unit_String_Name .. "_Is_Attacked");

	else
		-- First need to check if the building has been attacked, i dont want to garrison troops in a building thats already been attacked.
		if (Building_Array[index]:health() == 1.0 ) then
			-- The difference between this script and the Garrison building script is that I dont check to see if anyone is already garrioned in the building
			Table_Name.Controller_Name:melee(true)											-- The men wont attack the building unless I put them into melee first
			Table_Name.Controller_Name:defend_building(Building_Array[index], Move_Speed)
		else
			bm:out("Building is too damaged for the troops to garrison in")
			bm:register_callback(function() Check_If_Unit_Is_Attacked(Table_Name) end, 1000, "Check_If_" .. Table_Name.Unit_String_Name .. "_Is_Attacked");
		end
	end
end

-- ------------------------------------------------------------ --------------------------------------------------------------------------------
--
-- This function cycles through all the specified units and checks if any of them are in the specified area and returns true if any of them are
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------------

function Monitor_Area(Area_Name, Army_Name, Num_Of_Units)
	for c = 1,Num_Of_Units do
		if (Unit_Is_Routing_Or_Dead2(Army_Name[c])) then
		-- Do nothing
		else
			if Area_Name:is_in_area(Army_Name[c]:position()) then
				return true
			end
		end
	end
	
	return false	-- If we get here then it means no one is in the area.
end


-- ------------------------------------------------------------ --------------------------------------------------------------------------------
--
-- This function cycles through all the specified units and checks if all of them are in the specified area and returns true if all of them are
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------------

function Monitor_Area_Specific_Units(Area_Name, ...)
	for c = 1,arg.n do
		if (Unit_Is_Routing_Or_Dead_By_Table_Name(arg[c])) then
			return false
		else
			if Area_Name:is_in_area(arg[c].Unit_Name[arg[c].Unit_Num]:position()) then
				-- do nothing
			else 
				return false
			end
		end
	end
	
	return true	-- If we get here then it means all the specific units are in the area.
end

-- ------------------------------------------------------------ ---------------------------------------------------------------------------------
--
-- This function cycles through all the specified units and checks if any of them are in the specified area and returns how many are in the area
--
-- ------------------------------------------------------------ ---------------------------------------------------------------------------------

function Monitor_Area_Counter(Area_Name, Army_Name, Num_Of_Units)
	local Area_Counter = 0
	
	for c = 1,Num_Of_Units do
		if (Unit_Is_Routing_Or_Dead2(Army_Name[c])) then
		-- Do nothing
		else
			if Area_Name:is_in_area(Army_Name[c]:position()) then
				Area_Counter = Area_Counter + 1
			end
		end
	end
	
	return Area_Counter	-- If we get here then it means no one is in the area.
end

-- ------------------------------------------------------------ ------------------------------------------
--
-- This function sets up the controller based on the unit name and number and takes control of it as well
--
-- ------------------------------------------------------------ ------------------------------------------

function Set_Up_Controller(Num, Army_Name, Unit_Name, ...)
	local Ctrl_Name = Army_Name:create_unit_controller()

	Ctrl_Name:add_units(Unit_Name[Num])
	Ctrl_Name:take_control()
	
	if arg.n == 1 then
		Ctrl_Name:fire_at_will(arg[1])
	end
	
	return Ctrl_Name
end

---------------------------------------------------------------
--
-- Remove this when we have native API support
--
---------------------------------------------------------------

function Vector_Distance(vec1, vec2)
	return ((vec2:get_x() - vec1:get_x()) ^ 2 + (vec2:get_z() - vec1:get_z()) ^ 2) ^ 0.5;
end;


---------------------------------------------------------------
--
-- Shorthand way of creating sound effects
--
---------------------------------------------------------------

function New_SFX(soundfile)
	local retval = battle_sound_effect:new();
	retval:load(soundfile);
	
	return retval;
end;


---------------------------------------------------------------
--
-- Plays a sound file if it exists
--
---------------------------------------------------------------

function Play_Sound(position, sound)
	if is_vector(position) and not is_nil(sound) then
		sound:play3D(position);
	end;
end;


---------------------------------------------------------------
--
-- Stops a sound file if it exists
--
---------------------------------------------------------------

function Stop_Sound(sound)
	if not is_nil(sound) then
		sound:stop();
	end;
end;


---------------------------------------------------------------
--
-- Shorthand way of creating vectors
--
---------------------------------------------------------------

function v(x, y, z)
	local retval = battle_vector:new();

	if is_number(z) then
		-- we are creating a 3D vector
		retval:set(x, y, z);
	else
		-- we are creating a 2D vector
		retval:set(x, 0, y);
	end;
	
	return retval;
end;

---------------------------------------------------------------
--
-- Shorthand way of creating unitcontrollers
--
---------------------------------------------------------------

function Create_Unitcontroller(army, ...)
	local uc = nil;
		
	if is_army(army) then
		uc = army:create_unit_controller();
	else
		return nil;
	end;
	
	for i = 1, arg.n do
		if is_unit(arg[i]) then
			uc:add_units(arg[i]);
		end;
	end;
	
	return uc;
end;

---------------------------------------------------------------
--
-- Shorthand way of creating shipcontrollers
--
---------------------------------------------------------------

function Create_Shipcontroller(army, ...)
	local sc = nil;
	
	if is_army(army) then
		sc = army:create_ship_controller();
	else
		return nil;
	end;

	for i = 1, arg.n do
		if is_ship(arg[i]) then
			sc:add_ships(arg[i]);
		end;
	end;
	
	return sc;
end;
	

---------------------------------------------------------------
--
-- Some unit-status-checking functions
--
---------------------------------------------------------------

function Is_Unit_Routing_Or_Dead(unit)
	if not is_unit(unit) then
		return true;
	end;
	
	if unit:is_routing() or unit:number_of_men_alive() == 0 then
		return true;
	end;
	
	return false;
end;


function Is_Unit_Shattered_Or_Dead(unit)
	if unit:is_shattered() or unit:number_of_men_alive() == 0 then
		return true;
	end;
	
	return false;
end;


function Is_Ship_Routing_Or_Dead(ship)
	if not is_ship(ship) then
		return true;
	end;
	
	if ship:is_routing() or ship:is_surrendered() or ship:number_of_men_alive() == 0 then
		return true;
	end;
	
	return false;
end;


function Is_Ship_Shattered_Or_Dead(ship)
	if not is_ship(ship) then
		return true;
	end;
	
	if ship:is_shattered() or ship:is_surrendered() or ship:number_of_men_alive() == 0 then
		return true;
	end;
	
	return false;
end;


---------------------------------------------------------------
--
-- How many units in a table are routing
--
---------------------------------------------------------------

function Num_Units_Routing_Table(t)
	if not is_table(t) then
		return 0;
	end;
	
	local count = 0;
	
	for i = 1, #t do
		if Is_Unit_Routing_Or_Dead(t[i]) then
			count = count + 1;
		end;
	end;
	
	return count;
end;


---------------------------------------------------------------
--
-- How many units in a collection are routing
--
---------------------------------------------------------------

function Num_Units_Routing(units)
	if not is_units(units) then
		return false;
	end;
	
	local count = 0;
	
	for i = 1, units:count() do
		if Is_Unit_Routing_Or_Dead(units:item(i)) then
			count = count + 1;
		end;
	end;
	
	return count;
end;


---------------------------------------------------------------
--
-- Are all units in a collection routing
--
---------------------------------------------------------------

function All_Units_Routing(units)
	if not is_units(units) then
		return false;
	end;
	
	for i = 1, units:count() do
		if not Is_Unit_Routing_Or_Dead(units:item(i)) then
			return false;
		end;
	end;
	
	return true;
end;



---------------------------------------------------------------
--
-- Are all units in a table routing
--
---------------------------------------------------------------

function All_Units_Routing_Table(t)
	if not is_table(t) then
		return false;
	end;
	
	for i = 1, #t do
		if not is_unit(t[i]) or not Is_Unit_Routing_Or_Dead(t[i]) then
			return false;
		end;
	end;

	return true;
end;



---------------------------------------------------------------
--
-- How many ships in a collection are routing
--
---------------------------------------------------------------

function Num_Ships_Routing(ships)
	if not is_ships(ships) then
		return false;
	end;
	
	local count = 0;
	
	for i = 1, ships:count() do
		if Is_Ship_Routing_Or_Dead(ships:item(i)) then
			count = count + 1;
		end;
	end;
	
	return count;
end;



---------------------------------------------------------------
--
-- Are all ships in a collection routing
--
---------------------------------------------------------------

function All_Ships_Routing(ships)
	if not is_ships(ships) then
		return false;
	end;
	
	for i = 1, ships:count() do
		if not Is_Ship_Routing_Or_Dead(ships:item(i)) then
			return false;
		end;
	end;
	
	return true;
end;



---------------------------------------------------------------
--
-- Are all ships in a table routing
--
---------------------------------------------------------------

function All_Ships_Routing_Table(t)
	if not is_table(t) then
		return false;
	end;
	
	for i = 1, #t do
		if not is_ship(t[i]) or not Is_Ship_Routing_Or_Dead(t[i]) then
			return false;
		end;
	end;

	return true;
end;



---------------------------------------------------------------
--
-- Are all units in an alliance routing
--
---------------------------------------------------------------

function Is_Alliance_Routing(alliance)
	if not is_alliance(alliance) then
		return false;
	end;
	
	for i = 1, alliance:armies():count() do	
		for j = 1, alliance:armies():item(i):units():count() do			
			if not Is_Unit_Routing_Or_Dead(alliance:armies():item(i):units():item(j)) then
				return false;
			end;
		end;
		
		for k = 1, alliance:armies():item(i):ships():count() do			
			if not Is_Ship_Routing_Or_Dead(alliance:armies():item(i):ships():item(k)) then
				return false;
			end;
		end;
	end;
	
	return true;
end;



---------------------------------------------------------------
--
-- Tops up a unit's ammo to the given level
--
---------------------------------------------------------------

function Refill_Ammo(unit, quantity)
	if not is_unit(unit) then
		return false;
	end;
	
	if unit:ammo_left() / unit:starting_ammo() < quantity then
		unit:set_current_ammo_unary(quantity);
	end;
	
	return true;
end;


---------------------------------------------------------------
--
-- Angle conversions
--
---------------------------------------------------------------


function r_to_d(value)
	if not is_number(value) then
		return false;
	else
		return value * 57.29578;
	end;
end;


function d_to_r(value)
	if not is_number(value) then
		return false;
	else
		return value * 0.017453;
	end;
end;


---------------------------------------------------------------
--
-- Some type-checking functions
--
---------------------------------------------------------------

function is_nil(obj)
	if type(obj) == "nil" then
		return true;
	end;
	
	return false;
end;

function is_number(obj)
	if type(obj) == "number" then
		return true;
	end;
	
	return false;
end;

function is_function(obj)
	if type(obj) == "function" then
		return true;
	end;
	
	return false;
end;

function is_string(obj)
	if type(obj) == "string" then
		return true;
	end;
	
	return false;
end;

function is_boolean(obj)
	if type(obj) == "boolean" then
		return true;
	end;
	
	return false;
end;

function is_bool(obj)
	return is_boolean(obj);
end;

function is_table(obj)
	if type(obj) == "table" then
		return true;
	end;
	
	return false;
end;

function is_battle(obj)
	if string.sub(tostring(obj), 1, 14) == "empire_battle " then
		return true;
	end;
	
	return false;
end;

function is_alliances(obj)
	if string.sub(tostring(obj), 1, 17) == "battle.alliances " then
		return true;
	end;
	
	return false;
end;

function is_alliance(obj)
	if string.sub(tostring(obj), 1, 16) == "battle.alliance " then
		return true;
	end;
	
	return false;
end;

function is_armies(obj)
	if string.sub(tostring(obj), 1, 14) == "battle.armies " then
		return true;
	end;
	
	return false;
end;

function is_army(obj)
	if string.sub(tostring(obj), 1, 12) == "battle.army " then
		return true;
	end;
	
	return false;
end;

function is_units(obj)
	if string.sub(tostring(obj), 1, 13) == "battle.units " then
		return true;
	end;
	
	return false;
end;

function is_unit(obj)
	if string.sub(tostring(obj), 1, 12) == "battle.unit " then
		return true;
	end;
	
	return false;
end;

function is_unitcontroller(obj)
	if string.sub(tostring(obj), 1, 23) == "battle.unit_controller " then
		return true;
	end;
	
	return false;
end;



function is_ships(obj)
	if string.sub(tostring(obj), 1, 13) == "battle.ships " then
		return true;
	end;
	
	return false;
end;

function is_ship(obj)
	if string.sub(tostring(obj), 1, 12) == "battle.ship " then
		return true;
	end;
	
	return false;
end;

function is_shipcontroller(obj)
	if string.sub(tostring(obj), 1, 23) == "battle.ship_controller " then
		return true;
	end;
	
	return false;
end;




function is_battlemanager(obj)
	if tostring(obj) == TYPE_BATTLE_MANAGER then
		return true;
	end;
	
	return false;
end;

function is_cutscene(obj)
	if tostring(obj) == TYPE_CUTSCENE_MANAGER then
		return true;
	end;
	
	return false;
end;

function is_cutscenemanager(obj)
	return is_cutscene(obj);
end;

function is_camerasmoother(obj)
	if tostring(obj) == TYPE_CAMERA_SMOOTHER then
		return true;
	end;
	
	return false;
end;

function is_vector(obj)
	if string.sub(tostring(obj), 1, 14) == "battle_vector " then
		return true;
	end;
	
	return false;
end;

function is_building(obj)
	if string.sub(tostring(obj), 1, 16) == "battle.building " then
		return true;
	end;
	
	return false;
end;

function is_buildings(obj)
	if string.sub(tostring(obj), 1, 17) == "battle.buildings " then
		return true;
	end;
	
	return false;
end;

function is_convexarea(obj)
	if tostring(obj) == TYPE_CONVEX_AREA then
		return true;
	end;
	
	return false;
end;

function is_scriptunit(obj)
	if tostring(obj) == TYPE_SCRIPT_UNIT then
		return true;
	end;
	
	return false;
end;

function is_hurtarea(obj)
	if tostring(obj) == TYPE_HURT_AREA then
		return true;
	end;
	
	return false;
end;

function is_firestormmanager(obj)
	if tostring(obj) == TYPE_FIRESTORM_MANAGER then
		return true;
	end;
	
	return false;
end;


function is_hidingplace(obj)
	if tostring(obj) == TYPE_HIDING_PLACE then
		return true;
	end;
	
	return false;
end;


function is_teleportsquad(obj)
	if tostring(obj) == TYPE_TELEPORT_SQUAD then
		return true;
	end;
	
	return false;
end;


function is_subtitles(obj)
	if string.sub(tostring(obj), 1, 17) == "battle.subtitles " then
		return true;
	end;
	
	return false;
end;


function is_zonemanager(obj)
	if tostring(obj) == TYPE_ZONE_MANAGER then
		return true;
	end;
	
	return false;
end;


function is_zonecontroller(obj)
	if tostring(obj) == TYPE_ZONE_CONTROLLER then
		return true;
	end;
	
	return false;
end;


function is_decisionpoint(obj)
	if tostring(obj) == TYPE_DECISION_POINT then
		return true;
	end;
	
	return false;
end;


function is_escaperoute(obj)
	if tostring(obj) == TYPE_ESCAPE_ROUTE then
		return true;
	end;
	
	return false;
end;


function is_escapemanager(obj)
	if tostring(obj) == TYPE_ESCAPE_MANAGER then
		return true;
	end;
	
	return false;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	ALLIANCE CONTAINS UNIT
--
-- 	Takes an alliance and a unit and returns true if the unit is a member of that alliance, false otherwise
--
--	PARAMETERS:
--	ALLIANCE to test against
--	UNIT to test
--
--	RETURN VALUE:
--	BOOLEAN true if the unit is a member of that alliance, false otherwise
--
----------------------------------------------------------------------------------------------------------

function Alliance_Contains_Unit(alliance, unit)
	if not is_alliance(alliance) or not is_unit(unit) then
		return false;
	end;

	return Armies_Contains_Unit(alliance:armies(), unit);
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	ARMIES CONTAINS UNIT
--
-- 	Takes an armies and a unit and returns true if the unit is a member of that armies collection, false otherwise
--
--	PARAMETERS:
--	ARMIES to test against
--	UNIT to test
--
--	RETURN VALUE:
--	BOOLEAN true if the unit is a member of that armies collection, false otherwise
--
----------------------------------------------------------------------------------------------------------

function Armies_Contains_Unit(armies, unit)
	if not is_armies(army) or not is_unit(unit) then
		return false;
	end;
	
	for i = 1, armies:count() do
		if Army_Contains_Unit(armies:item(i), unit) then
			return true;
		end;
	end;
	
	return false;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	ARMY CONTAINS UNIT
--
-- 	Takes an army and a unit and returns true if the unit is a member of that army, false otherwise
--
--	PARAMETERS:
--	ARMY to test against
--	UNIT to test
--
--	RETURN VALUE:
--	BOOLEAN true if the unit is a member of that army, false otherwise
--
----------------------------------------------------------------------------------------------------------

function Army_Contains_Unit(army, unit)
	if not is_army(army) or not is_unit(unit) then
		return false;
	end;

	return Units_Contains_Unit(army:units(), unit) or Units_Contains_Unit(army:get_reinforcement_units(), unit);
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	UNITS CONTAINS UNIT
--
-- 	Takes an units and a unit and returns true if the unit is a member of that units collection, false otherwise
--
--	PARAMETERS:
--	UNITS to test against
--	UNIT to test
--
--	RETURN VALUE:
--	BOOLEAN true if the unit is a member of that units collection, false otherwise
--
----------------------------------------------------------------------------------------------------------


function Units_Contains_Unit(units, unit)
	if not is_units(units) or not is_unit(unit) then
		return false;
	end;
	
	for j = 1, units:count() do
		if units:item(j) == unit then			
			return true;
		end;
	end;
		
	return false;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	ARMY CONTAINS SHIP
--
-- 	Takes an army and a ship and returns true if the ship is a member of that army, false otherwise
--
--	PARAMETERS:
--	ARMY to test against
--	SHIP to test
--
--	RETURN VALUE:
--	BOOLEAN true if the ship is a member of that army, false otherwise
--
----------------------------------------------------------------------------------------------------------

function Army_Contains_Ship(army, ship)
	if not is_army(army) or not is_ship(ship) then
		return false;
	end;
	
	local ships = army:ships();

	for j = 1, ships:count() do
		if ships:item(j) == ship then			
			return true;
		end;
	end;
		
	return false;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	COUNT NON ROUTING UNITS
--
-- 	Takes a units parameter, and returns the number of unit objects within that that are not routing or dead
--
--	PARAMETERS:
--	UNITS to test
--
--	RETURN VALUE:
--	NUMBER of unit objects that are still active
--
----------------------------------------------------------------------------------------------------------

function Count_Non_Routing_Units(units)
	if not is_units(units) then
		return 0;
	end;
	
	retval = 0;
	
	for i = 1, units:count() do
		if not Is_Unit_Routing_Or_Dead(units:item(i)) then
			retval = retval + 1;
		end;
	end;
	
	return retval;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	UNIT CLOSE TO UNITS
--
-- 	Tests whether one unit is within a given range of a collection of other units. Useful if you've got units under script control and you want to release them if the player approaches, 
-- 	so they look a least a bit intelligent.
--
--	PARAMETERS:
--	UNIT to test
--	UNITS collection of units to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	True or False
--
----------------------------------------------------------------------------------------------------------

function Unit_Close_To_Units(unit1, units1, range)
      if units1:count() == 0 then
            return false;
      end;
      
      for i = 1, units1:count() do
            if (units1:item(i):position():distance(unit1:position()) <= range) then
                  return true;
            end;
      end;
      
      return false;
end;

--**	SAMPLE USAGE:
--**
--**	if Unit_Close_To_Units(Unit_Austrian_General, Units_France, 50)
--**		Unitcontroller_Austrian_General:release_unit();             --release Austrian General if player approaches
--**	end


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	UNIT CLOSE TO ARMIES
--
--  An extension to Unit_Close_To_Units that can sift through whole armies collections instead of units
--
--	PARAMETERS:
--	UNIT to test
--	ARMIES collection of units to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	True or False
--
----------------------------------------------------------------------------------------------------------

function Unit_Close_To_Armies(unit, armies, range)
	local number_of_armies = armies:count();
	local current_units = nil;

	for i = 1, number_of_armies do
		current_units = armies:item(i):units();
		
		if Unit_Close_To_Units(unit, current_units, range) then
			return true;
		end;
	end;
	
	return false;
end;

--**	SAMPLE USAGE:
--**
--**	if Unit_Close_To_Armies(Unit_Player_General, Armies_Enemy, 100)
--**		bm:out("The player is moving their general close to the enemy!");
--**	end




----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	UNIT CLOSE TO STANDING UNITS
--
-- 	A version of Unit Close To Units that only considers non-routing or dead units
--
--	PARAMETERS:
--	UNIT to test
--	UNITS collection of units to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	True or False
--
----------------------------------------------------------------------------------------------------------

function Unit_Close_To_Standing_Units(unit1, units1, range)
      if units1:count() == 0 then
            return false;
      end;
      
      for i = 1, units1:count() do
            if (units1:item(i):position():distance(unit1:position()) <= range) and (not Is_Unit_Routing_Or_Dead(units1:item(i))) then
				
				return true;
            end;
      end;
      
      return false;
end;

--**	SAMPLE USAGE:
--**
--**	if Unit_Close_To_Standing_Units(Unit_Austrian_General, Units_France, 50)
--**		Unitcontroller_Austrian_General:release_unit();             --release Austrian General if player approaches
--**	end


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	SHIP CLOSE TO STANDING SHIPS
--
-- 	A version of Unit_Close_To_Standing_Units() that works on ships
--
--	PARAMETERS:
--	SHIP to test
--	SHIPS collection of ships to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	True or False
--
----------------------------------------------------------------------------------------------------------

function Ship_Close_To_Standing_Ships(ship, ships, range)
      if ships:count() == 0 then
            return false;
      end;
	       
      for i = 1, ships:count() do
            if (ships:item(i):position():distance(ship:position()) <= range) and (not Is_Ship_Routing_Or_Dead(ships:item(i))) then
				
				return true;
            end;
      end;
      
      return false;
end;

--**	SAMPLE USAGE:
--**
--**	if Ship_Close_To_Standing_Ships(Ship_Admiral, Ships_Enemy, 50)
--**		bm:out("The admiral is approaching the enemy ships!");
--**	end


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	UNIT CLOSE TO STANDING ARMIES
--
--  An extension to Unit Close To Armies that only considers units that are not dead or routing
--
--	PARAMETERS:
--	UNIT to test
--	ARMIES collection of units to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	True or False
--
----------------------------------------------------------------------------------------------------------

function Unit_Close_To_Standing_Armies(unit, armies, range)
	local number_of_armies = armies:count();
	local current_units = nil;

	for i = 1, number_of_armies do
		current_units = armies:item(i):units();
		
		if Unit_Close_To_Standing_Units(unit, current_units, range) then
			return true;
		end;
	end;
	
	return false;
end;


--**	SAMPLE USAGE:
--**
--**	if Unit_Close_To_Standing_Armies(Unit_Player_General, Armies_Enemy, 100)
--**		bm:out("The player is moving their general close to the enemy!");
--**	end

----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	SHIP CLOSE TO STANDING ARMIES
--
--  A version of Unit_Close_To_Standing_Armies that works for ships
--
--	PARAMETERS:
--	SHIP to test
--	ARMIES collection of units to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	True or False
--
----------------------------------------------------------------------------------------------------------

function Ship_Close_To_Standing_Armies(ship, armies, range)
	local number_of_armies = armies:count();
	local current_ships = nil;
	
	for i = 1, number_of_armies do
		current_ships = armies:item(i):ships();
		
		if Ship_Close_To_Standing_Ships(ship, current_ships, range) then
			return true;
		end;
	end;
	
	return false;
end;


--**	SAMPLE USAGE:
--**
--**	if Ship_Close_To_Standing_Armies(Ship_Player_Admiral, Armies_Enemy, 100)
--**		bm:out("The player is moving their admiral close to the enemy!");
--**	end




----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	PRINT BUILDINGS
--
-- 	Debug output of all building positions, useful for determining which of your buildings are garrisonable
--
--	PARAMETERS:
--	BATTLE battle object
--
----------------------------------------------------------------------------------------------------------


function Print_Buildings(battle, start_index, end_index)
	if not battle or not (is_battle(battle) or is_battlemanager(battle)) then
		return false;
	end;

	if not start_index or not is_number(start_index) or start_index < 1 then
		start_index = 1;
	end;
	
	if not end_index or not is_number(end_index) or end_index > battle:buildings():count() then
		end_index = battle:buildings():count();
	end;

	for i = start_index, end_index do
		battle:out("Building " .. i .. " is at position " .. Vector_To_String(battle:buildings():item(i):position()));
	end;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	PRINT BUILDINGS
--
-- 	Debug output of all building positions, useful for determining which of your buildings are garrisonable
--
--	PARAMETERS:
--	BATTLE battle object
--
----------------------------------------------------------------------------------------------------------


function Print_Buildings_Near(battle, x, y)
	if not battle or not (is_battle(battle) or is_battlemanager(battle)) then
		return false;
	end;

	if not x or not is_number(x) or x < -1000 or x > 1000 then
		return false;
	end;
	
	if not y or not is_number(y) or y < -1000 or y > 1000 then
		return false;
	end;
	
	local pos = v(x, y);
	
	battle:out("Printing list of buildings close to " .. Vector_To_String(pos));
	battle:out("*****");
	
	for i = 1, battle:buildings():count() do
		if pos:distance_xz(battle:buildings():item(i):position()) < 50 then
			battle:out("Building " .. i .. " is at position " .. Vector_To_String(battle:buildings():item(i):position()));
		end;
	end;
	
	battle:out("*****");
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	Unit_Proportion_Alive(unit)
--
-- 	Returns a unary proportion of the unit that is still alive
--
--	PARAMETERS:
--	UNIT unit
--
----------------------------------------------------------------------------------------------------------


function Unit_Proportion_Alive(unit)
	if not is_unit(unit) then
		return 0;
	else
		return unit:number_of_men_alive() / unit:initial_number_of_men();
	end;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
-- 	Kill_Unit_Proportion(unit)
--
-- 	Kills a unary proportion of the unit
--
--	PARAMETERS:
--	UNIT unit
--
----------------------------------------------------------------------------------------------------------


function Kill_Unit_Proportion(unit, proportion)
	if not is_unit(unit) or not is_number(proportion) or proportion < 0 or proportion > 1 then
		return false;
	end;
	
	unit:kill_number_of_men(unit:initial_number_of_men() * proportion);
end;

--**	SAMPLE USAGE:
--**
--**	-- kill 25% of the number of men Unit_Player_01 had at battle start
--**	Kill_Unit_Proportion(Unit_Player_01, 0.25);


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	VECTOR TO STRING
--
--	Returns a string (bit of text) listing the co-ordinates of the given vector. Useful for debug output.
--
--	PARAMETERS:
--	VECTOR position to test
--
--	RETURN VALUE:
--	STRING output of position in the form (x, y, z)
--
----------------------------------------------------------------------------------------------------------

function Vector_To_String(position)
      if position then
            return "(" .. position:get_x() .. ", " .. position:get_y() .. ", " .. position:get_z() .. ")";
      end;
      return "";
end;

--**	SAMPLE USAGE:
--**
--**	battle:out("Napoleon is at position " .. Vector_To_String(Unit_France_General:position()) .. " !!!");

--------------------------------------------------------------

--**	SAMPLE USAGE OUTPUT:
--**
--**	Napoleon is at position (435.3, 5.4, -16.6) !!!





----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST UNIT POINT
--
--	Takes a given point, and returns the closest unit in a given units collection to it.
--
--	PARAMETERS:
--	VECTOR to test
--	UNITS collection to test against
--
--	RETURN VALUE:
--	The UNIT in the units collection that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Unit_Point(vector, units)
      if (units:count() == 0) then
            return false;
      end;
      if (units:count() == 1) then
            return units:item(1);
      end;
	  
      local closest_unit = units:item(1);
      local smallest_distance = vector:distance(units:item(1):position());
      
      for i = 2, units:count() do
            if (vector:distance(units:item(i):position()) < smallest_distance) then
                  smallest_distance = vector:distance(units:item(i):position());
                  closest_unit = units:item(i);
            end;        
      end;
      return closest_unit;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST UNIT
--
--	Takes a given unit, and returns the closest unit in a given units collection to it. Useful amoung other things for making a unit under script control attack the nearest thing to it.
--
--	PARAMETERS:
--	UNIT to test
--	UNITS collection to test against
--
--	RETURN VALUE:
--	The UNIT in the units collection that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Unit(unit, units)
      if (units:count() == 0) then
            return false;
      end;
      if (units:count() == 1) then
            return units:item(1);
      end;
      closest_unit = units:item(1);
      smallest_distance = unit:position():distance(units:item(1):position());
      
      for i = 2, units:count() do
            if (unit:position():distance(units:item(i):position()) < smallest_distance) then
                  smallest_distance = unit:position():distance(units:item(i):position());
                  closest_unit = units:item(i);
            end;        
      end;
      return closest_unit;
end;

--**	SAMPLE USAGE:
--**
--**	make Prussian Artillery fire on the nearest French unit
--**	UnitController_Prussia_Artillery_01:attack_unit(Get_Closest_Unit(Unit_Prussia_Artillery_01, Units_France));


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST UNIT TABLE
--
--	Takes a given unit, and returns the closest unit in a given table of units to it. Useful amoung other things for making a unit under script control attack the nearest thing to it.
--
--	PARAMETERS:
--	UNIT to test
--	UNIT TABLE collection to test against
--
--	RETURN VALUE:
--	The UNIT in the table that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Unit_Table(unit, table_of_units)
	if #table_of_units == 0 then
		return false;
	end;
	
	if #table_of_units == 1 then
		return table_of_units[1];
	end;
	
	closest_unit = table_of_units[1];
	smallest_distance = unit:position():distance(table_of_units[1]:position());
	
	for i = 2, #table_of_units do
		if unit:position():distance(table_of_units[i]:position()) < smallest_distance then
			smallest_distance = unit:position():distance(table_of_units[i]:position());
			closest_unit = table_of_units[i];
		end;
	end;
	return closest_unit;
end;

--**	SAMPLE USAGE:
--**
--**	--make Prussian Artillery fire on the nearest of three French infantry units
--**
--**    Table_Prussian_Artillery_Choice = {Unit_French_Inf_01, Unit_French_Inf_02, Unit_French_Inf_03};
--**	UnitController_Prussia_Artillery_01:attack_unit(Get_Closest_Unit_Table(Unit_Prussia_Artillery_01, Table_Prussian_Artillery_Choice));



----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST UNIT ARMIES
--
--	Takes a given unit, and returns the closest unit in a given armies collection to it. The same as
--  Get_Closest_Unit, other than it can look through a whole armies collection, rather than a units collection.
--
--	PARAMETERS:
--	UNIT to test
--	ARMIES collection to test against
--
--	RETURN VALUE:
--	The UNIT in the armies collection that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Unit_Armies(unit, armies)
	if not is_unit(unit) or not is_armies(armies) then
		return false;
	end;
	
	local number_of_armies = armies:count();
	local closest_unit = nil;
	local closest_unit_this_pass = nil;
	local current_units = 0;
		
	for i = 1, number_of_armies do
		current_units = armies:item(i):units();	
		closest_unit_this_pass = Get_Closest_Unit(unit, current_units);
		
		if not is_unit(closest_unit) or unit:position():distance(closest_unit_this_pass:position()) < unit:position():distance(closest_unit:position()) then 
			closest_unit = closest_unit_this_pass;
		end;
	end;
	
	return closest_unit;
end;

--**	SAMPLE USAGE:
--**
--**	UnitController_Cavalry_01:attack_unit(Get_Closest_Unit_Armies(Unit_Cavalry_01, Armies_Enemy));

----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST STANDING UNIT
--
--	A version of Get Closest Unit that only considers units that aren't routing or dead
--
--	PARAMETERS:
--	UNIT to test
--	UNITS collection to test against
--
--	RETURN VALUE:
--	The standing UNIT in the units collection that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Standing_Unit(unit, units)
      if (units:count() == 0) then
            return false;
      end;
      if (units:count() == 1) then
            return units:item(1);
      end;
      closest_unit = units:item(1);
      smallest_distance = unit:position():distance(units:item(1):position());
      
      for i = 2, units:count() do
            if (unit:position():distance(units:item(i):position()) < smallest_distance) and (not Is_Unit_Routing_Or_Dead(unit)) then -- SURELY THIS DOESN'T WORK ????
				smallest_distance = unit:position():distance(units:item(i):position());
				closest_unit = units:item(i);
            end;        
      end;
      return closest_unit;
end;

--**	SAMPLE USAGE:
--**
--**	make Prussian Artillery fire on the nearest French unit
--**	UnitController_Prussia_Artillery_01:attack_unit(Get_Closest_Standing_Unit(Unit_Prussia_Artillery_01, Units_France));


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST STANDING UNIT TABLE
--
--	A version of Get Closest Unit Table that only considers units that aren't routing or dead
--
--	PARAMETERS:
--	UNIT to test
--	UNIT TABLE collection to test against
--
--	RETURN VALUE:
--	The standing UNIT in the table that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Standing_Unit_Table(unit, table_of_units)
	if #table_of_units == 0 then
		return false;
	end;
	
	if #table_of_units == 1 then
		return table_of_units[1];
	end;
	
	closest_unit = table_of_units[1];
	smallest_distance = unit:position():distance(table_of_units[1]:position());
	
	for i = 2, #table_of_units do
		if unit:position():distance(table_of_units[i]:position()) < smallest_distance and (not Is_Unit_Routing_Or_Dead(unit)) then
			smallest_distance = unit:position():distance(table_of_units[i]:position());
			closest_unit = table_of_units[i];
		end;
	end;
	return closest_unit;
end;

--**	SAMPLE USAGE:
--**
--**	--make Prussian Artillery fire on the nearest of three French infantry units
--**
--**    Table_Prussian_Artillery_Choice = {Unit_French_Inf_01, Unit_French_Inf_02, Unit_French_Inf_03};
--**	UnitController_Prussia_Artillery_01:attack_unit(Get_Closest_Unit_Table(Unit_Prussia_Artillery_01, Table_Prussian_Artillery_Choice));

----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST STANDING UNIT ARMIES
--
--	A version of Get Closest Unit Armies that only considers units that aren't routing or dead
--
--	PARAMETERS:
--	UNIT to test
--	ARMIES collection to test against
--
--	RETURN VALUE:
--	The UNIT in the armies collection that is closest to the supplied unit
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Standing_Unit_Armies(unit, armies)
	if not is_unit(unit) or not is_armies(armies) then
		return false;
	end;
	
	local number_of_armies = armies:count();
	local closest_unit = nil;
	local closest_unit_this_pass = nil;
	local current_units = 0;
		
	for i = 1, number_of_armies do
		current_units = armies:item(i):units();	
		closest_unit_this_pass = Get_Closest_Unit(unit, current_units);
		
		if closest_unit_this_pass then
			if not is_unit(closest_unit) or (unit:position():distance(closest_unit_this_pass:position()) < unit:position():distance(closest_unit:position()) 
										and (not Is_Unit_Routing_Or_Dead(unit))) then 
				closest_unit = closest_unit_this_pass;
			end;
		end;
	end;
	
	return closest_unit;
end;

--**	SAMPLE USAGE:
--**
--**	UnitController_Cavalry_01:attack_unit(Get_Closest_Standing_Unit_Armies(Unit_Cavalry_01, Armies_Enemy));


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST STANDING SHIP ARMIES
--
--	A version of Get Closest Standing Unit Armies that works for ships (for the pursuit manager)
--
--	PARAMETERS:
--	SHIP to test
--	ARMIES collection to test against
--
--	RETURN VALUE:
--	The SHIP in the armies collection that is closest to the supplied ship
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Standing_Ship_Armies(ship, armies)
	if not is_ship(ship) or not is_armies(armies) then
		return false;
	end;
	
	local number_of_armies = armies:count();
	local closest_ship = nil;
	local closest_ship_this_pass = nil;
	local current_ships = 0;
		
	for i = 1, number_of_armies do
		current_ships = armies:item(i):ships();
		closest_ship_this_pass = Get_Closest_Unit(ship, current_ships); --Get_Closest_Unit() should work for ships
		
		if closest_ship_this_pass then
			if not is_ship(closest_ship) or (ship:position():distance(closest_ship_this_pass:position()) < ship:position():distance(closest_ship:position()) 
										and (not Is_Ship_Routing_Or_Dead(ship))) then 
				closest_ship = closest_ship_this_pass;
			end;
		end;
	end;
	
	return closest_ship;
end;

--**	SAMPLE USAGE:
--**
--**	Shipcontroller_01:attack_unit(Get_Closest_Standing_Ship_Armies(Ship_01, Armies_Enemy));













function Get_Closest_Standing_Unit_Alliance_Point(pos, alliance)
	if not is_vector(pos) or not is_alliance(alliance) then
		return false;
	end;
	
	local closest_unit = nil;
	local closest_unit_distance = 0;
	local current_closest_unit = nil;
	local current_closest_unit_distance = 0;

	for i = 1, alliance:armies():count() do
		current_closest_unit = Get_Closest_Unit_Point(pos, alliance:armies():item(i):units());
		
		current_closest_unit_distance = current_closest_unit:position():distance(pos);
		
		if not closest_unit or current_closest_unit_distance < closest_unit_distance then
			closest_unit = current_closest_unit;
			closest_unit_distance = current_closest_unit_distance;
		end;
	end;
	
	return closest_unit;
end;













----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	GET CLOSEST STANDING UNIT DISTANCE TABLE POINT
--
--	A version of Get Closest Unit Table that only considers units that aren't routing or dead, and from a point
--
--	PARAMETERS:
--	VECTOR to test
--	UNIT TABLE collection to test against
--
--	RETURN VALUE:
--	INT distance from the standing unit in the table that is closest to the supplied point. 0 if none are found
--
----------------------------------------------------------------------------------------------------------

function Get_Closest_Standing_Unit_Distance_Table_Point(pos, t)
	local current_distance = 0;
	local closest_distance_set = false;
	local closest_distance = 0;
	
	for i = 1, #t do
		if not Is_Unit_Routing_Or_Dead(t[i]) then	
			current_distance = pos:distance(t[i]:position());
		
			if current_distance < closest_distance or not closest_distance_set then
				closest_distance = current_distance;
				closest_distance_set = true;
			end;
		end;
	end;
	
	return closest_distance;
end;







----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	CENTRE POINT TABLE
--
--	Returns a vector that is the mean centre of a table of supplied vectors
--
--	PARAMETERS:
--	TABLE of VECTORs
--
--	RETURN VALUE:
--	The VECTOR at the mean centre
--
----------------------------------------------------------------------------------------------------------

function Centre_Point_Table(t)
	local total_x = 0;
	local total_y = 0;
	local total_z = 0;

	for i = 1, #t do 
		if not is_vector(t[i]) then
			return v(0, 0, 0);
		end;
		
		total_x = total_x + t[i]:get_x();
		total_y = total_y + t[i]:get_y();
		total_z = total_z + t[i]:get_z();
	end;
	
	return v( total_x / #t, total_y /#t, total_z / #t);
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	UNITS CLOSE TO POINT
--
--	Returns the number of units in a given collection that are within a given range of a given point.
--	This offers you one way to detect whether the player is trying to bumrush round the flank of the AI.
--
--	PARAMETERS:
--	UNITS collection to test
--	VECTOR position to test against
--	Range to test for (NUMBER)
--
--	RETURN VALUE:
--	NUMBER of units within the given range of the supplied position
--
----------------------------------------------------------------------------------------------------------

function Units_Close_To_Point(units, point, range)
      if (units:count() == 0) then
            return false;
      end;
            
      local_count = 0;
      
      for i = 1, units:count() do
            if (units:item(i):position():distance_xz(point) < range) then
                  local_count = local_count + 1;
            end;
      end
      
      return local_count;
end;

--**	SAMPLE USAGE:
--**
--**	Check if the player is trying to defend the bridge
--**	if Units_Close_To_Point(Units_France, POS_East_Bridge, 60) > 2 then
--**		Halt_AI_Attack_On_Bridge();
--**	end;



function Standing_Units_Close_To_Point_Table(pos, t, range)
	if #t == 0 then
		return false;
	end;

	for i = 1, #t do
		if (not Is_Unit_Routing_Or_Dead(t[i])) and t[i]:position():distance(pos) > range then
			return false;
		end;
	end;
	
	return true;
end;


----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	ITERATOR
--
--	Useful if you need to iterate through a table of items.
--
--	PARAMETERS:
--	On Creation:
--	TABLE collection of objects
--
--	Next:	     i:get_next();
--	no parameters
--
-----------------------------------------------------------------------------------------------------------

iterator = {
	my_table = {},
	my_index = 0
}

function iterator:new(new_t)
	if #new_t == 0 then
		return false;
	end;
	
	it = {};
	setmetatable(it, self);
	self.__index = self;
	
	it.my_table = new_t;
	it.my_index = 1;
	
	return it;
end;

function iterator:get_next()
	if self.my_index <= #self.my_table then
		self.my_index = self.my_index + 1;
		return self.my_table[self.my_index - 1];
	else
		return nil;
	end;
end;

--**	SAMPLE USAGE:
--**
--**	battle = empire_battle:new();

--**	made_up_var_01 = "cabbage!";
--**	made_up_var_02 = 7;
--**	made_up_var_03 = 210;
--**	made_up_var_04 = "cabbage again!";

--**	made_up_table = {made_up_var_01, made_up_var_02, made_up_var_03, made_up_var_04};
--**	iter = iterator:new(made_up_table);

--**	-- some time later

--**	output_value = iter:get_next();		--get the first value

--**	while output_value do
--**		battle:out(output_value);
--**		output_value = iter:get_next();
--**    end;
--**
--**    battle:out("List is finished!");


--**	SAMPLE USAGE OUTPUT:
--**
--**	cabbage!
--**	7
--**	210
--**	cabbage again!
--**	List is finished!


math.randomseed(os.time() + os.clock() * 1000);
math.random(); math.random(); math.random(); math.random(); math.random();


---------------------------------------------------------------
--
-- Randomly sort a table
--
---------------------------------------------------------------

function Random_Sort(t)
	local retval = {};
	local table_size = #t;
	local n = 0;
			
	for i = 1, table_size do
			
		-- pick an entry from t, add it to retval, then remove it from t
		n = math.random(#t);
				
		table.insert(retval, t[n]);
		table.remove(t, n);
	end;
	
	return retval;
end;