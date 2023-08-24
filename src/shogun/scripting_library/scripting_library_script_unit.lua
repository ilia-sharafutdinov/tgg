
----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	SCRIPT UNIT
--
--	An encapsulation of the way we tend to set up units and a shorthand method of setting that data up.
--  Scripters can save themselves a fair bit of copy+pasting by setting up a script unit in place of individual
--	units and unitcontrollers, and then get the data out of the script unit later when they need it.
--
--
--	PARAMETERS:
--	On Creation:
--	BATTLEMANAGER object
--	ARMY that the unit belongs to
--	UNIT to set up

--	Once a script unit is created, the actual unit it contains can be retrieved by referring to
--	sunit.unit, sunit.Unit, sunit.ship or sunit.Ship.
--
--	It's unitcontroller can be retrieved via any of the following:-
--
--	sunit.uc;
--	sunit.UC;
--	sunit.unitcontroller;
--	sunit.Unitcontroller;
--	sunit.sc;
--	sunit.SC;
--	sunit.shipcontroller;
--	sunit.Shipcontroller;
--
--	The position the unit started the battle in can be retrieved via:-
--
--	sunit.start_position;
--	sunit.start_bearing;
--	sunit.start_width;

----------------------------------------------------------------------------------------------------------

--[[

	SAMPLE USAGE:
			
	SUnit_Player_01 = script_unit:new(bm, Army_Player, Units_Player:item(01)); -- declare/set-up the unit, controller and other stuff
	SUnit_Player_02 = script_unit:new(bm, Army_Player, Units_Player:item(02));
	SUnit_Enemy_01 = script_unit:new(bm, Army_Enemy, Units_Enemy:item(01));
	
	-- sample script sending player unit #1 to attack enemy unit #1, and player unit #2 to move to player unit #1's start position
	
	SUnit_Player_01.uc:attack_unit(SUnit_Enemy_01.unit);
	SUnit_Player_02.uc:goto_location_angle_width(SUnit_Player_01.start_position, SUnit_Player_01.start_bearing, SUnit_Player_01.start_width);
]]


script_unit = {
	bm = nil,
	army = nil,
	unit = nil,
	Unit = nil,
	ship = nil,
	Ship = nil,
	uc = nil,
	UC = nil,
	unitcontroller = nil,
	Unitcontroller = nil,	
	sc = nil,
	SC = nil,
	shipcontroller = nil,
	Shipcontroller = nil,
	start_position = nil,
	start_bearing = nil,
	start_width = nil,
	is_naval = false;
};


function script_unit:new(new_bm, new_army, new_unit)
	
	-- type check our startup parameters

	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_army(new_army) then
		new_bm:out("Couldn't create script unit, army parameter is invalid");
		
		return false;
	end;
	
	if not is_unit(new_unit) and not is_ship(new_unit) then
		new_bm:out("Couldn't create script unit, unit parameter is not a unit or a ship");
		
		return false;
	end;
	
	local is_naval = false;
	
	if is_unit(new_unit) then
		if not Army_Contains_Unit(new_army, new_unit) then
			new_bm:out("Couldn't create script unit, given unit is not a member of the given army!");
		
			return false;
		end;
	else
		is_naval = true;
		if not Army_Contains_Ship(new_army, new_unit) then
			new_bm:out("Couldn't create script unit, given ship is not a member of the given army!");
		
			return false;
		end;
	end;
	
	-- set up the script unit
	
	su = {};
	setmetatable(su, self);
	
	self.__index = self;
	self.__tostring = function() return TYPE_SCRIPT_UNIT end;
	
	su.bm = new_bm;
	su.army = new_army;
	su.unit = new_unit;
	su.Unit = new_unit;								--duplicate unit name, use whichever
	su.ship = new_unit;
	su.Ship = new_unit;
	
	if not is_naval then
		su.uc = Create_Unitcontroller(new_army, new_unit);
	else
		su.uc = Create_Shipcontroller(new_army, new_unit);
	end;
	
	su.UC = su.uc;									--duplicate unitcontroller names, use whichever
	su.unitcontroller = su.uc;
	su.Unitcontroller = su.uc;
	su.sc = su.uc;
	su.SC = su.uc;
	su.shipcontroller = su.uc;
	su.Shipcontroller = su.uc;
	
	su.start_position = new_unit:position();
	su.start_bearing = new_unit:bearing();
	-- if we're in a naval battle use a preset width
	if is_naval then
		su.start_width = 10;
	else
		su.start_width = new_unit:ordered_width();
	end;

	su.is_naval = is_naval;
	
	return su;
end;
