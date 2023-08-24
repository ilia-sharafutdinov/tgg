
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
	return v(vector1:get_x() + vector2:get_z() - vector1:get_z(), 0, vector1:get_z() + vector1:get_x() - vector2:get_x());
end;


function Distance_To_Line(line_a, line_b, position)
	if line_a:get_x() == line_b:get_x() and line_a:get_z() == line_b:get_z() then
		return 0;
	end;

	--reposition everything as if line_a was the origin
	local new_line_a = v(0,0,0);
	local new_line_b = v(line_b:get_x() - line_a:get_x(), 0, line_b:get_z() - line_a:get_z());
	local new_position = v(position:get_x() - line_a:get_x(), 0, position:get_z() - line_a:get_z());

	return (Dot(Normal(new_line_a, new_line_b), new_position) / new_line_a:distance(new_line_b));
end;


function Has_Crossed_Line(line_a, line_b, position)     
	if (Distance_To_Line(line_a, line_b, position) > 0) then
		--position is on the right side of the line defined by line_a -> line_b
		return true;
	else
		--position is on the left side of the line defined by line_a -> line_b
		return false;
	end;
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
--	UNITS HAVE CROSSED LINE
--
--	Tests a units collection and returns the number of them that have crossed a given line. The number returned is the number of units on the right-hand side of the line
--
--	PARAMETERS:
--	UNITS units collection to test
--	VECTOR start of line
--	VECTOR end of line
--
--	RETURN VALUE:
--	NUMBER of units on the right-hand side of the line
--
----------------------------------------------------------------------------------------------------------


function Units_Have_Crossed_Line(units, line_a, line_b)
	local retval = 0;
	
	for i = 1, units:count() do
		if Has_Crossed_Line(line_a, line_b, units:item(i):position()) then
			retval = retval + 1;
		end;
	end;
	
	return retval;
end;





----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	STANDING UNITS HAVE CROSSED LINE
--
--	Tests a units collection and returns the number of them that are not routing and have crossed a given line. 
--  The number returned is the number of units on the right-hand side of the line
--
--	PARAMETERS:
--	UNITS units collection to test
--	VECTOR start of line
--	VECTOR end of line
--
--	RETURN VALUE:
--	NUMBER of non-routing units on the right-hand side of the line
--
----------------------------------------------------------------------------------------------------------


function Standing_Units_Have_Crossed_Line(units, line_a, line_b)
	local retval = 0;
	
	for i = 1, units:count() do
		if not Is_Unit_Routing_Or_Dead(units:item(i)) and Has_Crossed_Line(line_a, line_b, units:item(i):position()) then
			retval = retval + 1;
		end;
	end;
		
	return retval;
end;












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
	  self.__tostring = function() return TYPE_CONVEX_AREA end;
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

function convex_area:standing_units_in_area(units)
	if not units then 
		return nil
	end;
	
	local count = 0;
	
	for i = 1, units:count() do
		if (not Is_Unit_Routing_Or_Dead(units:item(i))) and self:is_in_area(units:item(i):position()) then
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









hurt_area = {
	bm = nil,
	name = "",
	area = nil,
	damage = 0.2,		-- 20% of the unit will die per tick
	is_debug = false
}

function hurt_area:new(new_bm, new_name, new_area)
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create hurt area, given name is not a string");
	
		return false;
	end;
	
	if not is_convexarea(new_area) then
		new_bm:out("Couldn't create hurt area, area parameter is invalid");
		
		return false;
	end;

	ha = {};
	setmetatable(ha, self);
	self.__index = self;
	self.__tostring = function() return TYPE_HURT_AREA end;
	
	ha.bm = new_bm;
	ha.area = new_area;
	
	return ha;
end;


function hurt_area:set_debug(value)
	if self.is_running then
		self.bm:out(self.name .. " warning :: trying to change debug state of a running hurt area. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		self.is_debug = value;
	else
		self.is_debug = true;
	end;
end;


function hurt_area:set_damage_per_tick(value)
	if not is_number(value) or value < 0 or value > 1 then
		self.bm:out(self.name .. " error :: can't set damage value, number between 0 and 1 wasn't supplied");
		
		return false;
	end;
	
	self.damage = value;
end;


function hurt_area:start()
	if self.is_debug then
		self.bm:out(self.name .. " :: hurt area starting");
	end;
	
	self:process();
end;


function hurt_area:stop()
	if self.is_debug then
		self.bm:out(self.name .. " :: hurt area stopping");
	end;
	
	self.bm:remove_process("hurt_area_" .. self.name);
end;


function hurt_area:process()
	if self.is_debug then
		self.bm:out(self.name .. " :: processing hurt area");
	end;
	
	local alliances = self.bm:alliances();
	local armies = nil;
	local units = nil;
	
	-- check each unit on the battlefield to see if it's in the given area, and make it take damage if it is
	for i = 1, alliances:count() do
		armies = alliances:item(i):armies();
		
		for j = 1, armies:count() do
			units = armies:item(j):units();
		
			for k = 1, units:count() do			
				if self.area:is_in_area(units:item(k):position()) then
					if self.is_debug then
						self.bm:out(self.name .. " :: unit " .. tostring(units:item(k)) .. " found in area, killing " .. tostring(self.damage) .. " (unary) of it's starting strength");
					end;
				
					Kill_Unit_Proportion(units:item(k), self.damage);
				end;
			end;
		end;		
	end;
	
	self.bm:register_callback(function() self:process() end, 3000, "hurt_area_" .. self.name);
end;