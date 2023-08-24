function Unit_Is_Routing_Or_Dead(array_name, index)
	if ((array_name[index]:number_of_men_alive() == 0) or (array_name[index]:is_routing())) then
		return true
	else
		return false
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


function Distance_To_Unit_Is_Less(Unit1, Enemy_Name, T)
	
	T.Min_Distance = T.Original_Min_Distance;   -- I set this back to its original distance in case the unit range function has changed it.
	local Shortest_Distance = 20000

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
	
	if(Shortest_Distance <= T.Min_Distance) then
		T.Enemy_Unit = Remember_This_Unit;
		return true;
	else
		T.Enemy_Unit = nil
		return false
	end
			
end

--function Distance_To_Unit_Is_Less(Unit1, Enemy_Name, Distance_Value)
	
--	vec_Unit = Unit1:position();
--	vec_Unit:set_y(0);
	
--	for i, Enemy_Unit in ipairs(Enemy_Name) do
--		vec_Enemy_Unit = Enemy_Unit:position();
--		vec_Enemy_Unit:set_y(0);
				
		--Unit_Distance = vec_Unit:distance(vec_Enemy_Unit);
--		Unit_Distance = Unit1:unit_distance(Enemy_Unit)
		
--		if(Unit_Distance < Distance_Value) then
--			return true;
			--break;
--		end
--	end
--end

-- This function takes a Table as its parameter and returns true if the distance from the unit in the table to thats units enemy is less than the specified distance.
-- In order for this function to work the table must contain a Unit_Name, Unit_Num, Min_Distance and Enemy_Unit field 
-- eg
-- T_Furster = {Unit_Num = 12,
-- Unit_Name = ai_unit_russia,
-- Min_Distance = 75,
-- Enemy_Unit = france_unit[1]}

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
	
	return 100000; -- Im returning a huge number cause i know if i didnt find a proper house then i know i didnt find a house and i dont want the game to crash as a result
end


-- ------------------------------------------------------------ --------------------------------------------------------------------------------------
--
-- This function takes the X. Z value of the centre point of the building you want your men to go to and it returns the index of that building for use
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------------------

function Find_Which_Building_To_Go_To2(Array_Name, X_Value, Z_Value)
	
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
		
		
		if ((X_Difference < 10) and (Z_Difference < 10)) then
			return i;
			--break;
		end
	end	
	
	return 100000; -- Im returning a huge number cause i know if i didnt find a proper house then i know i didnt find a house and i dont want the game to crash as a result
end

-- ------------------------------------------------------------ --------------------------------------------------------------------------
--
-- This function takes the unit in the controller name and garrisons it inside the building positioned at the given Pos_Name co-ordinates
--
-- ------------------------------------------------------------ --------------------------------------------------------------------------

function Garrison_Building(Building_Array, Table_Name, Pos_Name, Move_Speed)
	index = Find_Which_Building_To_Go_To(Building_Array, Pos_Name:get_x(), Pos_Name:get_z())
	
	if (index == 100000) then -- Didnt find a suitable house, maybe the co-ordinates given for the house are incorrect cause the house was moved when the map was being tidied up.
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
	self.battle:ui_component("layout"):set_visible(false);
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
	self.battle:ui_component("layout"):set_visible(true);
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
	bm:out("Esc_Key_Pressed!!!");
	
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
	action_list = nil,
	bm = nil,
	uc_playersarmy = nil,
	end_callback = nil,
	cutscene_length = 0,
	name = nil,
	skippable = false,
	restore_cam_on_end = false,
	skip_cam = nil,
	skip_cam_target = nil,
	skip_callback = nil,
	is_active = false,
	temp_name = nil,
	is_debug = false
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
	c.is_debug = false;
	
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
		self.bm:ui_component("layout"):set_visible(false);
		self.bm:camera():disable_functionality("CAMERA_ALL_FUNCTIONS");
	end;

	self.bm:out("Starting cutscene " .. tostring(self.name));
	self.uc_playersarmy:take_control();
	self.is_active = true;
	
	if self.restore_cam_on_end then	
		self.skip_cam = self.bm:camera():position();
		self.skip_cam_target = self.bm:camera():target();
		self.bm:register_callback(function() self.bm:camera():move_to(self.skip_cam_target, self.skip_cam, 1) end, self.cutscene_length - 1000, self.name);
	end;
	
	for i = 1, #self.action_list do	
		self.bm:register_callback(self.action_list[i].callback, self.action_list[i].delay, self.name);
		if self.skippable then
			self.bm:register_callback(function() self.bm:steal_escape_key() end, self.action_list[i].delay + 10, self.name);
		end;
	end;
	
	self.bm:steal_escape_key();
		
	self.bm:register_callback(function() self:finish() end, self.cutscene_length, self.name);
		
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
		
	self:finish();
end;


function cutscene:finish()
	self.is_active = false;
	
	if not self.is_debug then
		self.bm:ui_component("radar_group"):set_visible(true);
		self.bm:ui_component("layout"):set_visible(true);
		self.bm:camera():enable_functionality("CAMERA_ALL_FUNCTIONS");
		self.bm:release_input_focus();
	end;
		
	self.bm:out("Ending cutscene " .. tostring(self.name));
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