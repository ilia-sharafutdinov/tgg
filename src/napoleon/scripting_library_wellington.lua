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

function Go_To_This_Location(T, Movement_Speed)
	T.Controller_Name:goto_location_angle_width(T.Location, T.Orientation, T.Width, Movement_Speed);
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
-- 	PRINT BUILDINGS
--
-- 	Debug output of all building positions, useful for determining which of your buildings are garrisonable
--
--	PARAMETERS:
--	BATTLE battle object
--
----------------------------------------------------------------------------------------------------------


function Print_Buildings(battle)
	for i = 1, battle:buildings():count() do
		battle:out("Building " .. i .. " is at position " .. Vector_To_String(battle:buildings():item(i):position()));
	end;
end;


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
            if (units:item(i):position():distance(point) < range) then
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



----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	HAS CROSSED LINE
--
--	Tests which side of a line drawn across the battlefield a given position is on. This allows you to test whether a unit has crossed over an invisible boundary on the map.
--
--	The function takes three vectors as parameters - A, B and C. It considers a line drawn through A to B (including before A and after B, the length of the line is infinite) 
--	and returns true if C is on the right of the line and false if C is on the left of the line.
--
--	REQUIRES:
--	functions Dot and Normal (supplied below).
--
--	PARAMETERS:
--	VECTOR start of line
--	VECTOR end of line
--	VECTOR position to test
--
--	RETURN VALUE:
--	True (right side of the line) or False (left side of the line)
--
----------------------------------------------------------------------------------------------------------

function Dot(vector1, vector2)
      return (vector1:get_x() * vector2:get_x()) + (vector1:get_z() * vector2:get_z())
end;

function Normal(vector1, vector2)
      returnvalue = battle_vector:new();
      returnvalue:set(vector1:get_x() + vector2:get_z() - vector1:get_z(), 0, vector1:get_z() + vector1:get_x() - vector2:get_x());
      return returnvalue;
end;

function Has_Crossed_Line(line_a, line_b, position)
      
      --reposition everything as if line_a was the origin
      local new_line_a = battle_vector:new();
      new_line_a:set(0,0,0);
      local new_line_b = battle_vector:new();
      new_line_b:set(line_b:get_x() - line_a:get_x(), 0, line_b:get_z() - line_a:get_z());
      local new_position = battle_vector:new();
      new_position:set(position:get_x() - line_a:get_x(), 0, position:get_z() - line_a:get_z());
            
      if (Dot(Normal(new_line_a, new_line_b), new_position) > 0) then
            --position is on the right side of the line defined by line_a -> line_b
            return true;
      else
            --position is on the left side of the line defined by line_a -> line_b
            return false;
      end
end;

--**	SAMPLE USAGE:
--**
--**	define a line rising diagonally through the origin

--**	POS_Line_01 = battle_vector:new(); 
--**	POS_Line_01:set(-10, 0, -10);

--**	POS_Line_02 = battle_vector:new(); 
--**	POS_Line_02:set(10, 0, 10);

--**	define a points on one side of the line

--**	POS_Test = battle_vector:new();
--**	POS_Test:set(0, 0, 100);                  --left side

--**	test POS_Test. This should return FALSE as the position is way off to the left of the line

--**	if Has_Crossed_Line(POS_Line_01, POS_Line_02, POS_Test) then
--**      battle:out("Shouldn't get here!");
--**	else
--**      battle:out("This should work!");
--**	end;


--**	if we reverse the direction of the line, however, the result should be reversed

--**	if Has_Crossed_Line(POS_Line_02, POS_Line_01, POS_Test) then
--**	  battle:out("This should work as well!");
--**	else
--**	  battle:out("Shouldn't get here!");
--**	end;

--------------------------------------------------------------

--**	SAMPLE USAGE OUTPUT:
--**
--** 	This should work!
--**	This should work as well!



----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	CONVEX AREA
--
--	Allows you to define a convex hull on the battlefield via a series of vectors (i.e. a 2D trigger area), and then test to see if a given position is within that convex hull. 
--	This should allow you to precisely determine whether a unit is within an arbritrary-shaped area of the battlefield.
--	The convex hull object must be created before use by supplying a table of vectors. Currently there is NO validation on the input vectors. 
--	They must be supplied in clockwise order around the circumference of the hull, which is assumed by script to be convex. 
--	If the hull is not convex or the vector order is incorrect then the hull will give erroneous results when tested.
--
--	REQUIRES:
--	function Has_Crossed_Line (supplied above)
--
--	PARAMETERS:
--	On Creation:
--	BATTLE object
--	table of VECTORs describing the boundaries of the convex hull.
--	These must be supplied in clockwise order around the edge of the hull
--	Test:
--	VECTOR position to test against
--
--	RETURN VALUE:
--	True (inside the convex area) or False (outside)
--
----------------------------------------------------------------------------------------------------------

convex_area = {
      my_battle = 0,
      my_points = {}
}

function convex_area:new(b, point_list)
      if not b then
            return false;
      end;
      ca = {};
      setmetatable(ca, self);
      self.__index = self;
      if not ca:process_points(point_list) then
            b:out("convex_area: supplied points list was invalid!");
            return false;
      end;
	  
      ca.my_battle = b;
      return ca;
end;

function convex_area:process_points(p)
      if not p then
            return false;
      end;
      if #p < 3 then
            return false;
      end;
      --no processing done! Need to do!
      self.my_points = p;
      return true;
end;

function convex_area:item(index)
      if index > 0 and index <= #self.my_points then
            return self.my_points[index];
      end;
      return false;
end;

function convex_area:count(index)
      return #self.my_points;
end;

function convex_area:is_in_area(point)
      for i = 1, #self.my_points-1 do
            if not Has_Crossed_Line(self.my_points[i], self.my_points[i+1], point) then
                  return false;
            end;
      end;
      if not Has_Crossed_Line(self.my_points[#self.my_points], self.my_points[1], point) then
            return false;
      end;
      return true;
end;

function convex_area:units_in_area(units)
	if not units then 
		return nil
	end;
	
	local count = 0;
	
	for i = 1, units:count() do
		if self:is_in_area(units:item(i):position()) then
			count = count + 1;
		end;
	end;
	
	return count;
end;


--**	SAMPLE USAGE:
--**
--**	battle = empire_battle:new();

--**	--lay out a square centred around the origin (doesn't have to be a square though!)

--**	POS_Area_01 = battle_vector:new(); 
--**	POS_Area_01:set(-10, 0, -10);

--**	POS_Area_02 = battle_vector:new(); 
--**	POS_Area_02:set(-10, 0, 10);

--**	POS_Area_03 = battle_vector:new(); 
--**	POS_Area_03:set(10, 0, 10);

--**	POS_Area_04 = battle_vector:new(); 
--**	POS_Area_04:set(10, 0, -10);

--**	--here we define our convex hull. The second parameter (between the squiggly brackets) is a table of the above points

--**	Area = convex_area:new(battle, {POS_Area_01, POS_Area_02, POS_Area_03, POS_Area_04});

--**	--define some points to test against, one inside the area and one outside

--**	POS_Inside_Area = battle_vector:new(); 
--**	POS_Inside_Area:set(0, 0, 0);

--**	POS_Outside_Area = battle_vector:new(); 
--**	POS_Outside_Area:set(-10, 0, 10);

--**	--do some tests

--**	if Area:is_in_area(POS_Inside_Area) then
--**      battle:out("POS_Inside_Area is inside Area, hooray!");
--**	else
--**      battle:out("POS_Inside_Area is not inside Area, what's gone wrong?!");
--**	end;

--**	if Area:is_in_area(POS_Outside_Area) then
--**      battle:out("POS_Outside_Area is inside Area, this is bad :0(");
--**	else
--**      battle:out("POS_Outside_Area is not inside Area, phew!");
--**	end;

--**	--you can get the area to spit out how many points it contains if you like

--**	battle:out("Area is a shape comprised of " .. Area:count() .. " points, as if you didn't know.");

--------------------------------------------------------------

--**	SAMPLE USAGE OUTPUT:

--**	POS_Inside_Area is inside Area, hooray!
--**	POS_Outside_Area is not inside Area, phew!
--**	Area is a shape comprised of 4 points, as if you didn't know.







----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	BATTLE MANAGER
--
--	A wrapper for registering timers and printing messages. Battle Manager won't wet the bed when you try and unregister a timer that you've already unregistered. 
--	It also allows you to easily toggle all debug messages on and off and adds timestamps to messages.
--
--	In addition, you can use the battle manager to place a watch on a unit. This allows you to easily say "run function A, B seconds after unit C reaches position D".
--	This should allow us to script waypoints and "do this when you reach this position" functions easily.
--
--	PARAMETERS:
--	On Creation:     bm = battle_manager:new(battle, true);
------------------
--	BATTLE object.
--	BOOLEAN determining whether debug messages should be output or not output.
--
--
--	Unit Watch:	     bm:watch_unit(Unit_France_General, POS_Hilltop, 50, 5000, function() Launch_Hilltop_Ambush() end, "Napoleon hilltop watch");
------------------
--	UNIT to watch
--	POSITION to monitor the unit's proximity to
--	NUMBER range at which to trigger
--	NUMBER delay in ms before triggering (to give time for, say, the unit to turn in place once it's reached it's position before triggering the target script)
--	FUNCTION/CODE to call - this parameter has to be in the format: function() code_to_execute end -- see example script below
--  optional ID of your watch - this can be any data type, a descriptive string would be ideal. Supplying an id allows you to cancel the watch before it fires (see example below)
--
--
--  General Watch:  bm:watch(function() return Town_Hall:health() < 50 end, 5000, function() Town_Hall_Has_Been_Destroyed() end, "Town Hall Watch");
------------------
--  BOOLEAN EXPRESSION to watch
--  NUMBER delay in ms before triggering (a non-zero value here means this gets added to the callback queue)
--  FUNCTION/CODE to call - this parameter has to be in the format: function() code_to_execute end -- see example script below
--  optional ID of your watch - this can be any data type, a descriptive string would be ideal. Supplying an id allows you to cancel the watch before it fires (see example below)
--
--
--  Register Callback:  bm:register_callback(function() Call_Me_In_Ten_Seconds() end, 10000, "Example Callback");
------------------
--  FUNCTION/CODE to call - this parameter has to be in the format: function() code_to_execute end -- see example script below
--  NUMBER delay in ms before triggering (a non-zero value here means this gets added to the callback queue)
--  optional ID of your watch - this can be any data type, a descriptive string would be ideal. Supplying an id allows you to cancel the watch before it fires (see example below)
--
--
--  Cancelling Watch/Callbacks:  bm:remove_process("Example Callback");
------------------
--  ID of the watch to cancel

----------------------------------------------------------------------------------------------------------

my_battle_manager = 0;

battle_manager = {
	timer_list = {},
	battle = 0,
	debug_text = false,
	watch_list = {},
	callback_list = {},
	deployment_end_callback = 0,
	deployment_phase_callback = 0,
	is_naval_battle = false,
	player_victory_callback = nil,
	player_defeat_callback = nil
}
timestamp_tick = 0;

function battle_manager:new(b, debug_text)
	if my_battle_manager ~= 0 then
		my_battle_manager:out("Warning, cannot create more than one battle manager!");
		return my_battle_manager;
	end;
	if not b then
		b = empire_battle:new();
		b:out("No battle object supplied to battle_manager - creating one, but this may die a horrible death and should really be fixed.");
	end;
	
	bm = {};
	setmetatable(bm, self);
	self.__index = self;
	
	bm.battle = b;
	debug_text = debug_text or false;
	bm.debug_text = debug_text;
	if debug_text then
		bm:register_repeating_timer("battle_manager_tick_increment_counter", 100);
	end;
	
	my_battle_manager = bm;
	return bm;
end;


function battle_manager:set_naval(value)
	self.is_naval_battle = value;
end;


function battle_manager:is_naval()
	return self.is_naval_battle;
end;


function battle_manager:buildings()
	return self.battle:buildings();
end;


function battle_manager:register_results_callbacks(player_victory_callback, player_defeat_callback)
	self.battle:register_command_handler("Battle_Manager_Battle_Results");
	
	self.player_victory_callback = player_victory_callback;
	self.player_defeat_callback = player_defeat_callback;
end;


function battle_manager:process_results(result)
	if result then
		self:out("The Player has won the battle!");
		if self.player_victory_callback then
			self.player_victory_callback();
		else
			self:out("  No victory callback was present? If you're not seeing outro advice and you expected to then something broke.");
		end;
	else
		self:out("The Player has lost the battle!");
		if self.player_defeat_callback then
			self.player_defeat_callback();
		else
			self:out("  No defeat callback was present? If you're not seeing outro advice and you expected to then something broke.");
		end;
	end;
end;


function Battle_Manager_Battle_Results(event)
	if event:get_name() == "Battle Results" then
		my_battle_manager:process_results(event:get_bool1());
	end;
end;


function battle_manager:setup_battle(new_deployment_end_callback, new_deployment_phase_callback)
	self.deployment_end_callback = new_deployment_end_callback;
	self.deployment_phase_callback = new_deployment_phase_callback;
	self:register_battle_phase_handler("battle_manager_phase_change");
	self:suspend_contextual_advice(true);
	self.battle:steal_input_focus();
	
	self.battle:ui_component("radar_group"):set_visible(false);
	self.battle:ui_component("menu_bar"):set_visible(false);
	self.battle:ui_component("veneer_DY"):set_visible(false);
	self.battle:camera():disable_functionality("CAMERA_ALL_FUNCTIONS");
end;


function battle_manager_phase_change(event)
	deployment_phase_callback = my_battle_manager:deployment_phase_callback();

	if event:get_name() == "Deployment" and not deployment_phase_callback == 0 then
		deployment_phase_callback();
	end;

	if event:get_name() == "Deployed" then
		my_battle_manager:unregister_battle_phase_handler();
		my_battle_manager:end_deployment();
	end;
end;


function battle_manager:deployment_phase_callback()
	return self.deployment_phase_callback;
end;


function battle_manager:end_deployment()
	self.battle:ui_component("radar_group"):set_visible(true);
	self.battle:ui_component("menu_bar"):set_visible(true);
	self.battle:ui_component("veneer_DY"):set_visible(true);
	self.battle:camera():enable_functionality("CAMERA_ALL_FUNCTIONS");
	
	self.battle:release_input_focus();
	
	self.deployment_end_callback();
end;


function battle_manager:register_battle_phase_handler(callback)
	self.battle:register_battle_phase_handler(callback);
end;


function battle_manager:unregister_battle_phase_handler()
	self.battle:unregister_battle_phase_handler();
end;


function battle_manager:suspend_contextual_advice(param)
	self.battle:suspend_contextual_advice(param)
end;

	
function battle_manager:register_singleshot_timer(name, t)
	if not self.timer_list[name] then
		self.battle:register_singleshot_timer(name, t);
		self.timer_list[name] = true;
	end;
end;

function battle_manager:register_repeating_timer(name, t, dont_show_output)
	if not dont_show_output then
		self:out("Registering timer " .. name);
	end;
	if not self.timer_list[name] then
		self.battle:register_repeating_timer(name, t);
		self.timer_list[name] = true;
	end;
end;

function battle_manager:unregister_timer(name, dont_show_output)
	if self.timer_list[name] then
		self.battle:unregister_timer(name);
		self.timer_list[name] = false;
		if not dont_show_output then
			self:out("Unregistering timer " .. name);
		end;
	else
		self:out("Unregistering failed: " .. name .. ": " .. tostring(self.timer_list[name]));
	end;
end;

function battle_manager:out(msg)
	if self.debug_text then
		self.battle:out("<" .. tostring(timestamp_tick) .. "ms> " .. msg);
	end;
end;

function battle_manager:show_advisor_message(localisation_key, default_message)
	self.battle:show_advisor_message(localisation_key, default_message);
end;

function battle_manager:ui_component(param)
	return self.battle:ui_component(param);
end;

function battle_manager:advice_finished()
	return self.battle:advice_finished();
end;


function battle_manager:camera()
	return self.battle:camera();
end;

function battle_manager:steal_escape_key()
	self.battle:release_escape_key();

	return self.battle:steal_escape_key();
end;

function battle_manager:release_escape_key()
	return self.battle:release_escape_key();
end;

function battle_manager:modify_battle_speed(speed)
	return self.battle:modify_battle_speed(speed);
end;

function battle_manager:restore_battle_speed()
	return self.battle:restore_battle_speed();
end;

function battle_manager:close_advisor()
	return self.battle:close_advisor();
end;

function battle_manager:steal_input_focus()
	return self.battle:steal_input_focus();
end;

function battle_manager:release_input_focus()
	return self.battle:release_input_focus();
end;

function battle_manager_tick_increment_counter()
	timestamp_tick = timestamp_tick + 100;
end;

function battle_manager:remove_process(entryname_to_remove)
	if entryname_to_remove == "" then
		return false;
	end;

	local have_removed_entry = false;
	local i = 1;
	local j = #self.watch_list;
		
	if #self.watch_list ~= 0 then
		while i <= j do
			if self.watch_list[i].entryname == entryname_to_remove then
				table.remove(self.watch_list, i);
				have_removed_entry = true;
				j = j - 1;
			else
				i = i + 1;
			end;
		end;
	end;
	
	i = 1;
	j = #self.callback_list;
	
	if #self.callback_list ~= 0 then
		i = 1;
		j = #self.callback_list;

		while i <= j do
			if self.callback_list[i].entryname == entryname_to_remove then
				table.remove(self.callback_list, i);
				have_removed_entry = true;
				j = j - 1;
			else
				i = i + 1;
			end;
		end;
	end;
			
	return have_removed_entry;
end;


function battle_manager:watch(new_condition, new_time_offset, new_callback, new_entryname)
	new_entryname = new_entryname or "";
	self.watch_list[#self.watch_list + 1] = {condition = new_condition, time_offset = new_time_offset, callback = new_callback, entryname = new_entryname};
	if #self.watch_list == 1 then
		self:register_repeating_timer("battle_manager_tick_watch_counter", 2000);
	end;
end;



function battle_manager:watch_unit(new_unit, new_position, new_range, new_time_offset, new_callback, new_entryname)
	new_entryname = new_entryname or "";
	self.watch_list[#self.watch_list + 1] = {condition = function() return new_unit:position():distance(new_position) < new_range end, time_offset = new_time_offset, callback = new_callback, entryname = new_entryname};	
	if #self.watch_list == 1 then
		self:register_repeating_timer("battle_manager_tick_watch_counter", 2000);
	end;
end;


function battle_manager_tick_watch_counter()
	my_battle_manager:tick_watch_counter();
end;


function battle_manager:tick_watch_counter()
	if #self.watch_list == 0 then
		return false;
	end;
		
	local i = 1;
	local j = #self.watch_list;
	my_callback = 0;
	
	while i <= j do
		if self.watch_list[i].condition() then
			if self.watch_list[i].time_offset == 0 then
				my_callback = self.watch_list[i].callback;
				table.remove(self.watch_list, i);
				my_callback();
				self:tick_watch_counter(); -- rescan the whole list
				
				return false;
			else
				self:register_callback(self.watch_list[i].callback, self.watch_list[i].time_offset, self.watch_list[i].entryname);
				table.remove(self.watch_list, i);
				j = j - 1;
			end;
		else
			i = i + 1;
		end;
	end;
end;

function battle_manager:print_watch_list()
	if #self.watch_list == 0 then
		self.battle:out("Watch list is empty");
		return;
	end;
	self.battle:out("Watch list now looks like:");
	for i = 1, #self.watch_list do
		bm:out(i .. ":  " .. tostring(self.watch_list[i].entryname));
	end;
end;


function battle_manager:print_callback_list()
	if #self.callback_list == 0 then
		self.battle:out("Callback list is empty");
		return;
	end;
	self.battle:out("Callback list now looks like:");
	for i = 1, #self.callback_list do
		bm:out(i .. ":  " .. tostring(self.callback_list[i].entryname) .. " will be called at " .. self.callback_list[i].calltime .. "ms");
	end;
end;


function battle_manager:register_callback(new_callback, new_time_offset, new_entryname)
	if not new_callback or not new_time_offset then
		return false;
	end;

	new_entryname = new_entryname or "";
	local new_calltime = new_time_offset + timestamp_tick;
	
	if #self.callback_list == 0 then
		table.insert(self.callback_list, 1, {callback = new_callback, calltime = new_calltime, entryname = new_entryname});
		self:register_repeating_timer("battle_manager_tick_callback", new_time_offset);
	else
		for i = 1, #self.callback_list do
			if self.callback_list[i].calltime > new_calltime then			
				table.insert(self.callback_list, i, {callback = new_callback, calltime = new_calltime, entryname = new_entryname});
				if i == 1 then
					self:unregister_timer("battle_manager_tick_callback", true);
					--self:register_repeating_timer("battle_manager_tick_callback", self.watch_list[i].time_offset, true);   --what the hell was this line doing
					self:register_repeating_timer("battle_manager_tick_callback", new_time_offset, true);
				end;
				break;
			end;
			if i == #self.callback_list then
				table.insert(self.callback_list, #self.callback_list + 1, {callback = new_callback, calltime = new_calltime, entryname = new_entryname});
				break;
			end;
		end;
	end;
end;


function battle_manager_tick_callback()
	my_battle_manager:tick_callback();
end;


function battle_manager:tick_callback()
	my_callback = false;

	while true do
		if #self.callback_list == 0 then
			break;
		end;
		if self.callback_list[1].calltime < timestamp_tick + 50 then
			my_callback = self.callback_list[1].callback;
			table.remove(self.callback_list, 1);
			my_callback();
		else
			break;
		end;
	end;

	bm:unregister_timer("battle_manager_tick_callback", true);
	if #self.callback_list > 0 then
		self:register_repeating_timer("battle_manager_tick_callback", self.callback_list[1].calltime - timestamp_tick, true);
	end;
end;

--**	SAMPLE USAGE:
--**
--**	--create our battle and battle_manager objects

--**	battle = empire_battle:new();
--**	bm = battle_manager:new(battle, true);    --debug messages are on

--**	--register some timers

--**	battle:register_repeating_timer("Test_01", 3000);
--**	battle:register_repeating_timer("Test_01", 3000);     -- oops, this will fail if you try it with the standard battle object!

--**	bm:register_repeating_timer("Test_02", 3000);
--**	bm:register_repeating_timer("Test_02", 3000);         -- this won't fail

--**	Test_01_Counter = 0;

--**	function Test_01
--**      battle:out("Here's a message, no-one knows when it happened though");
--**      Test_01_Counter = Test_01_Counter + 1;
--**      if Test_01_Counter > 2 then
--**            battle:unregister_timer("Test_01");
--**            battle:unregister_timer("Test_01");       -- oops, this will fail again
--**      end;
--**	end;

--**	Test_02_Counter = 0;

--**	function Test_02
--**      bm:out("Here's a message, we know when it happened because it's timestamped!");
--**      Test_02_Counter = Test_02_Counter + 1;
--**      if Test_02_Counter > 2 then
--**            bm:unregister_timer("Test_02");
--**            bm:unregister_timer("Test_02");           -- this won't fail
--**      end;
--**	end;

--**	SAMPLE USAGE OUTPUT:
--**
--**	<0ms> Registering Timer Test_02
--**	Here's a message, no-one knows when it happened though
--**	<3000ms> Here's a message, we know when it happened because it's timestamped!
--**	Here's a message, no-one knows when it happened though
--**	<6000ms> Here's a message, we know when it happened because it's timestamped!
--**	Here's a message, no-one knows when it happened though
--**	<9000ms> Here's a message, we know when it happened because it's timestamped!
--**	Here's a message, no-one knows when it happened though
--**	<12000ms> Here's a message, we know when it happened because it's timestamped!

-----------------------------------------------
-----------------------------------------------

--**	SAMPLE WATCH USAGE:
--**
--**	--create our battle and battle_manager objects

--**	battle = empire_battle:new();
--**	bm = battle_manager:new(battle, true);

--**	bm:watch_unit(Unit_France_Artillery_01, POS_East_Bridge_French_Side, 10, 15000, function() Make_French_Artillery_Fire() end);

--**	-- The above script makes the battle manager watch the unit Unit_France_Artillery_01 (parameter #1).
--**	-- 15000ms (parameter #4) after the unit comes within 10m (parameter #3) of POS_East_Bridge_French_Side (parameter #2),
--**	-- the function "Make_French_Artillery_Fire()" is called. Notice the slightly wierd formatting of the final parameter -
--**	-- the name of your function must be given between "function()" and "end".
--**	-- The above call will make the French Artillery fire 15 seconds after it reaches the end of the bridge - enough time for it to stop
--**	-- and get itself oriented (hopefully)
--**	
--**	function Make_French_Artillery_Fire()
--**		--make the artillery do interesting stuff
--**	end;
--**
--**	-- GENERIC WATCH (more important/superceding the above)
--**
--**	-- the following line does exactly the same as the watch_unit call above
--**	bm:watch(function() return Unit_France_Artillery:position():distance(POS_East_Bridge_French_Side) < 10 end, 15000, function() Make_French_Artillery_Fire() end);
--**
--**	-- parameters are: expression to watch, delay before triggering, code to call, optional name
--**
--**	-- As you can hopefully see, the watch() function is a much more flexible version of the watch_unit() function. Watch() can be used to monitor ANY boolean condition that
--**	-- might change throughout the battle - is this unit within range of that unit, has this building taken damage, is this unit routing etc. Rather than having to write a function
--**	-- for each of these and individually register them the conditions can be passed to the battle manager to watch.
--**
--**	-- the format of the first parameter can be a bit confusing, however. It needs to be of the form --- function() return Boolean_Expression end --- where Boolean_Expression can
--**	-- be evaluated to be true or false, either a boolean value (BOOL_Has_Prussian_Army_Crossed_Bridge) or expression (Town_Hall:health() < 50)


-----------------------------------------------
-----------------------------------------------

--**	SAMPLE WATCH CANCELLING:
--**
--**	-- if you register a watch with the optional name parameter:
--**
--**	bm:watch_unit(Unit_France_General, POS_Top_Of_Hill, 20, 0, function() Launch_Ambush_On_Hill() end, "Napoleon hilltop ambush");
--**
--**	-- or
--**
--**	bm:watch(function() return East_Bridge:health() < 25 end, 2000, function() Divert_AI_Flank_Attack() end, "Bridge Health Monitor");
--**
--**	-- you can cancel it later, before it fires:
--**
--**	bm:remove_process("Napoleon hilltop ambush");
--**	bm:remove_process("Bridge Health Monitor");
--**
--**	-- this will remove any watch or callback that have yet to fire


__Cutscene_List = {}

function Esc_Key_Pressed()
	bm:out("Esc_Key_Pressed!!! Size of __Cutscene_List is " .. #__Cutscene_List);

	if #__Cutscene_List == 0 then
		return;
	end;
	
	for i = 1, #__Cutscene_List do
		if __Cutscene_List[i]:isactive() then
			__Cutscene_List[i]:skip();
			return;
		end;
	end;
end;


cutscene = {
	bm = nil,
	uc_playersarmy = nil,
	end_callback = nil,
	cutscene_length = 0,
	name = nil,
	skippable = false,
	restore_cam_on_end = false,
	action_list = nil,
	action_ptr = 1,
	is_debug = false,
	is_active = false,
	start_time = 0,
	wait_offset = 0,
	advisor_wait = false,
	skip_cam = nil,
	skip_cam_target = nil,
	skip_callback = nil
}


function cutscene:new(bm, uc_playersarmy, end_callback, cutscene_length, name, skippable, restore_cam_on_end, skip_cam, skip_cam_target, skip_callback)
	c = {};
	setmetatable(c, self);
	self.__index = self;
		
	c.bm = bm;
	c.uc_playersarmy = uc_playersarmy;
	c.end_callback = end_callback;
	c.cutscene_length = cutscene_length;
	c.name = name;
	c.skippable = skippable;
	c.restore_cam_on_end = restore_cam_on_end;
	c.action_list = {};
	c.action_ptr = 1;
	c.is_debug = false;
	c.is_active = false;
	c.start_time = 0;
	c.wait_offset = 0;
	c.advisor_wait = false;	
	
	if skippable then
		c.skip_cam = skip_cam;
		c.skip_cam_target = skip_cam_target;
		c.skip_callback = skip_callback;
	end;
	
	table.insert(__Cutscene_List, c);
	
	return c;
end;


function cutscene:set_debug(new_value)
	if new_value == nil then
		self.is_debug = true;
	else
		self.is_debug = new_value;
	end;
end


function cutscene:is_any_cutscene_running()
	if #__Cutscene_List == 0 then
		return false;
	end;
	
	for i = 1, #__Cutscene_List do
		if __Cutscene_List[i]:isactive() then
			return true;
		end;
	end;
	
	return false;
end;


function cutscene:start()
	if self:is_any_cutscene_running() then
		self.bm:out("Cannot start cutscene " .. self.name .. ", another cutscene is running!");
		return false;
	end;
	
	if not self.is_debug then
		self.bm:steal_input_focus();
	
		self.bm:ui_component("radar_group"):set_visible(false);
		self.bm:ui_component("veneer_DY"):set_visible(false);
		self.bm:camera():disable_functionality("CAMERA_ALL_FUNCTIONS");
	end;

	self.bm:out("Starting cutscene " .. tostring(self.name));
	
	self:action(function() self:wait_for_advisor() end, self.cutscene_length);
	self:action(function() self:finish() end, self.cutscene_length);
	
	self.uc_playersarmy:take_control();
	self.is_active = true;
	self.start_time = timestamp_tick;
	
	if self.restore_cam_on_end then	
		self.skip_cam = self.bm:camera():position();
		self.skip_cam_target = self.bm:camera():target();
	end;
	
	if self.skippable then
		self.bm:steal_escape_key();
	end;
	
	self:process_next_action();
		
	return true;
end;


function cutscene:wait_for_advisor()
	self.advisor_wait = true;
end;


function cutscene:process_next_action()
	if not self.isactive then
		self.bm:out("Cutscene " .. name .. " tried to process an action while not active, the action didn't happen.");		
	
		return false;
	end;

	if self.action_ptr > #self.action_list then
		return false;
	end;
		
	--action_time is the absolute time from the battle start that we reckon the next action should take place
	local action_time = self.start_time + self.action_list[self.action_ptr].delay + self.wait_offset;
	
	--if it's not time for the next action to be processed, then check again when it is
	if action_time > timestamp_tick then	
		self.bm:register_callback(function() self:process_next_action() end, self.action_list[self.action_ptr].delay + self.wait_offset - (timestamp_tick - self.start_time), self.name);
		
		return false;	
	end;
	
	--check if the advisor has finished (if we need to). If it's not finished, wait 500ms and try again
	if self.advisor_wait then
		if not self.bm:advice_finished() then
			self.wait_offset = self.wait_offset + 500;
			self.bm:register_callback(function() self:process_next_action() end, 500, self.name);
		
			return false;
		else
			self.advisor_wait = false;
		end;
	end;
		
	--call the current action in the queue, and then speculatively try the next in the queue
	self.action_list[self.action_ptr].callback();
	if self.skippable and self.is_active then
		self.bm:steal_escape_key();
	end;
	
	self.action_ptr = self.action_ptr + 1;
	self:process_next_action();
	
	return true;
end;



function cutscene:action(new_callback, new_delay)
	if self.is_active then
		self.bm:out("Warning: trying to add an action to a running cutscene! You can't do this!");
		return false;
	end;
	if new_delay > self.cutscene_length then
		self.bm:out("Warning: trying to add an action past the end of a cutscene! You can't do this!");
		return false;
	end;
		
	for i = 1, #self.action_list do
		if self.action_list[i].delay > new_delay then
			table.insert(self.action_list, i, {callback = new_callback, delay = new_delay});
			return true;
		end;
	end;
		
	table.insert(self.action_list, {callback = new_callback, delay = new_delay});
	return true;
end;


function cutscene:isactive()
	return self.is_active;
end;


function cutscene:skip()
	self.bm:remove_process(self.name);
	if self.skip_cam_target and self.skip_cam then
		self.bm:camera():move_to(self.skip_cam_target, self.skip_cam, 0.1);
	end;
	
	self.bm:out("Skipping remainder of cutscene " .. tostring(self.name));
	if self.skip_callback then
		self.skip_callback();
	end;
		
	self:release();
end;


function cutscene:finish()
	if self.restore_cam_on_end then	
		self.bm:camera():move_to(self.skip_cam_target, self.skip_cam, 1);
		
		bm:register_callback(function() self:release() end, 1000, self.name);
		
		return true;
	end;
	
	self:release();
end;


function cutscene:release()
	self.is_active = false;
	
	if not self.is_debug then
		self.bm:ui_component("radar_group"):set_visible(true);
		self.bm:ui_component("veneer_DY"):set_visible(true);
		self.bm:camera():enable_functionality("CAMERA_ALL_FUNCTIONS");
		self.bm:release_input_focus();
	end;
		
	self.bm:out("Ending cutscene " .. tostring(self.name));
	
	if self.wait_offset > 0 then
		self.bm:out("This cutscene was " .. self.wait_offset .. "ms longer than specified due to waiting for VO to complete.");
	end;
	
	self.uc_playersarmy:release_control();
	if self.skippable then	
		self.bm:release_escape_key();
	end;
	self.bm:close_advisor();
	self.end_callback();
end;




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
		bm:out("Creating rout manager " .. new_name);
	
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
						end
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
						end
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
							return self.rout_units[i].unit and self.rout_units[i].unit:is_routing() 
						end, 
						0, 
						function()
							bm:out("Rout watch triggered for " .. self.name .. "! Keeping unit routing!");
							self.rout_units[i].unitcontroller:morale_behavior_rout()
						end
					);
	end;
	
	bm:out("Starting rout manager " .. self.name .. ", added " .. #self.rout_units .. " unit watches.");
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