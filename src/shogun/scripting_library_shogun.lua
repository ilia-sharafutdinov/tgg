package.path = package.path .. ";data/Scripting_Library/?.lua"

---------------------- BOOLS SETUP ---------------------------------------
--------------------------------------------------------------------------
Run = true
Walk = false

time_increment_ms = 100;
TYPE_BATTLE_MANAGER = "battle_manager";
TYPE_CUTSCENE_MANAGER = "cutscene_manager";
TYPE_CAMERA_SMOOTHER = "camera_smoother";
TYPE_CONVEX_AREA = "convex_area";
TYPE_FIRESTORM_MANAGER = "firestorm_manager";
TYPE_SCRIPT_UNIT = "scripted_unit";
TYPE_HURT_AREA = "hurt_area";
TYPE_ZONE_MANAGER = "zone_manager";
TYPE_ZONE_CONTROLLER = "zone_controller";
TYPE_HIDING_PLACE = "hiding_place";
TYPE_TELEPORT_SQUAD = "teleport_squad";
TYPE_DECISION_POINT = "decision_point";
TYPE_ESCAPE_ROUTE = "escape_route";
TYPE_ESCAPE_MANAGER = "escape_manager";

require "Scripting_Library_Misc";
require "Scripting_Library_Script_Unit";
require "Scripting_Library_Convex_Area";
require "Scripting_Library_Battlemanager";
require "Scripting_Library_Cutscenes";
require "Scripting_Library_Rout_Manager";
require "Scripting_Library_Pursuit_Manager";
require "Scripting_Library_Patrol_Manager";
require "Scripting_Library_Zone_Manager";
require "Scripting_Library_Firestorm_Manager";
require "Scripting_Library_Teleport_Manager";
require "Scripting_Library_Escape_Manager";

