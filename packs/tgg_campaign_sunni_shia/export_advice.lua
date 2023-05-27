--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Advice Triggers

--[[ 0001_Battle_Advice_Friendly_Fire_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_line", context) >= 10 and conditions.BattleAllianceNumberOfUnits(context) >= 4 then
		effect.advance_contextual_advice_thread("0001_Battle_Advice_Friendly_Fire_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0002_Battle_Advice_Enemy_Forming_Up_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0002_Battle_Advice_Enemy_Forming_Up_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0003_Battle_Advice_Enemy_Holding_Ground_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0003_Battle_Advice_Enemy_Holding_Ground_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0004_Battle_Advice_Enemy_Holding_Crossing_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0004_Battle_Advice_Enemy_Holding_Crossing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0005_Battle_Advice_Enemy_Holding_Crossing_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0005_Battle_Advice_Enemy_Holding_Crossing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0006_Battle_Advice_Player_Outnumbered_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) > 0.4 and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) < 0.6 then
		effect.advance_contextual_advice_thread("0006_Battle_Advice_Player_Outnumbered_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0007_Battle_Advice_Enemy_Defending_Hill_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) and not conditions.BattlePlayerAllianceDefendingHill(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0007_Battle_Advice_Enemy_Defending_Hill_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0008_Battle_Advice_Player_Defending_Hill_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattlePlayerAllianceDefendingHill(context) then
		effect.advance_contextual_advice_thread("0008_Battle_Advice_Player_Defending_Hill_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0009_Battle_Advice_Fatigue_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitActionStatus("exhausted", context) then
		effect.advance_contextual_advice_thread("0009_Battle_Advice_Fatigue_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0011_Battle_Advice_Preserve_Skirmishers_Triggers ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_light", context) >= 1 and (conditions.BattleEnemyAlliancePercentageOfUnitCategory("cavalry", context) >= 10 or conditions.BattleEnemyAlliancePercentageOfUnitClass("dragoons", context) >= 10 or conditions.BattleEnemyAlliancePercentageOfUnitClass("infantry_light", context) >= 10) then
		effect.advance_contextual_advice_thread("0011_Battle_Advice_Preserve_Skirmishers_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0012_Battle_Advice_Enemy_Sitting_Targets_Thread ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitActionStatus("firing", context) and conditions.BattleEnemyUnitActionStatus("idling", context) and not conditions.BattleEnemyUnitActionStatus("routing", context) and not conditions.BattleEnemyHasMissileSuperiority(context) then
		effect.advance_contextual_advice_thread("0012_Battle_Advice_Enemy_Sitting_Targets_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0013_Battle_Advice_Missile_Superiority_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleEnemyHasMissileSuperiority(context) then
		effect.advance_contextual_advice_thread("0013_Battle_Advice_Missile_Superiority_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0014_Battle_Advice_Chasing_Skirmishers_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("infantry_light", context) and (conditions.BattleEnemyUnitClass("infantry_skirmishers", context) or conditions.BattleEnemyUnitClass("infantry_light", context)) then
		effect.advance_contextual_advice_thread("0014_Battle_Advice_Chasing_Skirmishers_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0015_Battle_Advice_Close_Gaps_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0015_Battle_Advice_Close_Gaps_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0016_Battle_Advice_Draw_Their_Fire_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and (conditions.BattlePlayerDirectionOfMissileAttack("front", context) or conditions.BattlePlayerDirectionOfMissileAttack("rear", context) or conditions.BattlePlayerDirectionOfMissileAttack("right_flank", context) or conditions.BattlePlayerDirectionOfMissileAttack("left_flank", context)) and (conditions.BattleEnemyUnitClass("infantry_mob", context) or conditions.BattleEnemyUnitClass("infantry_light", context) or conditions.BattleEnemyUnitClass("infantry_militia", context) or conditions.BattleEnemyUnitClass("infantry_skirmishers", context) or conditions.BattleEnemyUnitClass("infantry_irregulars", context)) then
		effect.advance_contextual_advice_thread("0016_Battle_Advice_Draw_Their_Fire_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0017_Battle_Advice_Counter_Charge_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("infantry", context) and conditions.BattleEnemyUnitCategory("infantry", context) and conditions.BattleEnemyUnitActionStatus("idling", context) and (conditions.BattlePlayerUnitActionStatus("charging", context) or conditions.BattlePlayerUnitActionStatus("moving_fast", context)) then
		effect.advance_contextual_advice_thread("0017_Battle_Advice_Counter_Charge_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0018_Battle_Advice_Fight_To_The_Death_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0018_Battle_Advice_Fight_To_The_Death_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0019_Battle_Advice_Fight_To_The_Death_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0019_Battle_Advice_Fight_To_The_Death_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0020_Battle_Advice_Expendable_Troops_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 and (conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_mob", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_militia", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_skirmishers", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_light", context) >= 1) then
		effect.advance_contextual_advice_thread("0020_Battle_Advice_Expendable_Troops_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0021_Battle_Advice_Go_For_The_Throat_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 and (conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 10 or conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 10) then
		effect.advance_contextual_advice_thread("0021_Battle_Advice_Go_For_The_Throat_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0022_Battle_Advice_Fixing_And_Killing_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 10 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 10 then
		effect.advance_contextual_advice_thread("0022_Battle_Advice_Fixing_And_Killing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0023_Battle_Advice_Outflanking_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 4 then
		effect.advance_contextual_advice_thread("0023_Battle_Advice_Outflanking_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0024_Battle_Advice_Outflanking_With_Cavalry_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 4 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 10 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 10 then
		effect.advance_contextual_advice_thread("0024_Battle_Advice_Outflanking_With_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0025_Battle_Advice_Find_Weak_Spots_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 10 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 10 and (conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_elite", context) >= 5 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_grenadiers", context) >= 5) then
		effect.advance_contextual_advice_thread("0025_Battle_Advice_Find_Weak_Spots_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0026_Battle_Advice_Avoid_Flanking_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 1 and conditions.BattleAllianceNumberOfUnits(context) >= 4 then
		effect.advance_contextual_advice_thread("0026_Battle_Advice_Avoid_Flanking_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0027_Battle_Advice_Reserves_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0027_Battle_Advice_Reserves_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0028_Battle_Advice_Wavy_Line_Formation_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0028_Battle_Advice_Wavy_Line_Formation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0029_Battle_Advice_Attacking_Hills_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattlePlayerAllianceDefendingHill(context) and not conditions.BattleEnemyHasMissileSuperiority(context) then
		effect.advance_contextual_advice_thread("0029_Battle_Advice_Attacking_Hills_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0030_Battle_Advice_Fighting_With_Cavalry_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_light", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_heavy", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitClass("infantry_light", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitClass("infantry_melee", context) >= 1 then
		effect.advance_contextual_advice_thread("0030_Battle_Advice_Fighting_With_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0031_Battle_Advice_Defending_With_Cavalry_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 10 and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0031_Battle_Advice_Defending_With_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0032_Battle_Advice_Cavalry_In_Reserve_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 10 then
		effect.advance_contextual_advice_thread("0032_Battle_Advice_Cavalry_In_Reserve_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0033_Battle_Advice_Cavalry_Cycle_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and  conditions.BattlePlayerUnitActionStatus("charging", context) and conditions.BattlePlayerUnitCategory("cavalry", context) and not conditions.BattlePlayerUnitClass("cavalry_missile", context) then
		effect.advance_contextual_advice_thread("0033_Battle_Advice_Cavalry_Cycle_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0035_Battle_Advice_Cavalry_Against_Points_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerDirectionOfMeleeAttack("front", context) and conditions.BattlePlayerUnitCategory("cavalry", context) and not conditions.BattleEnemyUnitActionStatus("routing", context) and (conditions.BattlePlayerUnitActionStatus("charging", context) or conditions.BattlePlayerUnitActionStatus("moving_fast", context)) and (conditions.BattleEnemyUnitSpecialAbilitySupported("plug_bayonets", context) or conditions.BattleEnemyUnitTechnologySupported("socket_bayonets", context) or conditions.BattleEnemyUnitTechnologySupported("ring_bayonets", context) or conditions.BattleEnemyUnitSpecialAbilitySupported("pike_square_formation", context) or conditions.BattleEnemyUnitSpecialAbilitySupported("pike_wall_formation", context)) then
		effect.advance_contextual_advice_thread("0035_Battle_Advice_Cavalry_Against_Points_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0036_Battle_Advice_Cavalry_Against_Points_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and (conditions.BattlePlayerDirectionOfMeleeAttack("left_flank", context) or conditions.BattlePlayerDirectionOfMeleeAttack("right_flank", context)) and conditions.BattlePlayerUnitCategory("cavalry", context) and (conditions.BattlePlayerUnitActionStatus("charging", context) or conditions.BattlePlayerUnitActionStatus("moving_fast", context)) and not conditions.BattleEnemyUnitCurrentFormation("square_formation", context) and (conditions.BattleEnemyUnitSpecialAbilitySupported("plug_bayonets", context) or conditions.BattleEnemyUnitTechnologySupported("socket_bayonets", context) or conditions.BattleEnemyUnitTechnologySupported("ring_bayonets", context) or conditions.BattleEnemyUnitSpecialAbilitySupported("pike_square_formation", context) or conditions.BattleEnemyUnitSpecialAbilitySupported("pike_wall_formation", context)) then
		effect.advance_contextual_advice_thread("0036_Battle_Advice_Cavalry_Against_Points_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0037_Battle_Advice_Cavalry_Against_Points_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("cavalry", context) and conditions.BattlePlayerDirectionOfMeleeAttack("behind", context) and conditions.BattleEnemyUnitCategory("infantry", context) and not conditions.BattleEnemyUnitCurrentFormation("square_formation", context) then
		effect.advance_contextual_advice_thread("0037_Battle_Advice_Cavalry_Against_Points_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0038_Battle_Advice_Defence_Against_Cavalry_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 10 and conditions.BattleEnemyAlliancePercentageOfUnitCategory("cavalry", context) >= 10 then
		effect.advance_contextual_advice_thread("0038_Battle_Advice_Defence_Against_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0039_Battle_Advice_Defence_Against_Cavalry_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("cavalry", context) and (conditions.BattlePlayerDirectionOfMeleeAttack("left_flank", context) or conditions.BattlePlayerDirectionOfMeleeAttack("right_flank", context)) and (conditions.BattlePlayerUnitActionStatus("charging", context) or conditions.BattlePlayerUnitActionStatus("moving_fast", context)) then
		effect.advance_contextual_advice_thread("0039_Battle_Advice_Defence_Against_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0040_Battle_Advice_Defence_Against_Cavalry_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("cavalry", context) and conditions.BattleEnemyUnitCategory("infantry", context) and (conditions.BattleEnemyUnitActionStatus("fighting_melee", context) or conditions.BattleEnemyUnitActionStatus("firing", context)) and (conditions.BattlePlayerDirectionOfMeleeAttack("left_flank", context) or conditions.BattlePlayerDirectionOfMeleeAttack("right_flank", context)) and (conditions.BattlePlayerUnitActionStatus("charging", context) or conditions.BattlePlayerUnitActionStatus("moving_fast", context)) then
		effect.advance_contextual_advice_thread("0040_Battle_Advice_Defence_Against_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0041_Battle_Advice_Cavalry_Against_Camels_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("cavalry_camels", context) and conditions.BattlePlayerUnitCategory("cavalry", context) and not conditions.BattlePlayerUnitClass("cavalry_camels", context) and not conditions.BattlePlayerUnitClass("cavalry_missile", context) then
		effect.advance_contextual_advice_thread("0041_Battle_Advice_Cavalry_Against_Camels_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0042_Battle_Advice_Cavalry_Against_Camels_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("cavalry_camels", context) and conditions.BattlePlayerUnitCategory("cavalry", context) and not conditions.BattlePlayerUnitClass("cavalry_camels", context) then
		effect.advance_contextual_advice_thread("0042_Battle_Advice_Cavalry_Against_Camels_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0043_Battle_Advice_Cavalry_Against_Camels_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("cavalry_camels", context) and conditions.BattlePlayerUnitClass("cavalry_light", context) and conditions.BattlePlayerUnitEngagedInMelee(context) then
		effect.advance_contextual_advice_thread("0043_Battle_Advice_Cavalry_Against_Camels_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0044_Battle_Advice_Camels_Against_Cavalry_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("cavalry_camels", context) and conditions.BattleEnemyUnitCategory("cavalry", context) and not conditions.BattleEnemyUnitClass("cavalry_camels", context) then
		effect.advance_contextual_advice_thread("0044_Battle_Advice_Camels_Against_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0045_Battle_Advice_Camels_Against_Cavalry_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("cavalry_camels", context) and conditions.BattleEnemyUnitCategory("cavalry", context) and not conditions.BattleEnemyUnitClass("cavalry_camels", context) then
		effect.advance_contextual_advice_thread("0045_Battle_Advice_Camels_Against_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0046_Battle_Advice_Fighting_Skirmishers_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("cavalry_heavy", context) and (conditions.BattleEnemyUnitClass("infantry_light", context) or conditions.BattleEnemyUnitClass("infantry_skirmishers", context)) then
		effect.advance_contextual_advice_thread("0046_Battle_Advice_Fighting_Skirmishers_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0047_Battle_Advice_Good_Artillery_Target_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("artillery", context) and conditions.BattleEnemyUnitCurrentFormation("square_formation", context) then
		effect.advance_contextual_advice_thread("0047_Battle_Advice_Good_Artillery_Target_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0048_Battle_Advice_Good_Artillery_Target_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleHasCoverBuildings(context) and conditions.BattleEnemyAlliancePercentageOfUnitCategory("infantry", context) >= 20 and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 10 then
		effect.advance_contextual_advice_thread("0048_Battle_Advice_Good_Artillery_Target_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0048a_Battle_Advice_Good_Artillery_Target_Trigger ]]--

events.BattleUnitUsingBuilding[#events.BattleUnitUsingBuilding+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not BattleUnitIsPlayers and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 10 then
		return true
	end
	return false
end

--[[ 0049_Battle_Advice_Poor_Artillery_Target_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("artillery", context) and not conditions.BattlePlayerUnitActionStatus("fighting_melee", context) and (conditions.BattleEnemyUnitActionStatus("moving_fast", context) or conditions.BattleEnemyUnitActionStatus("charging", context)) then
		effect.advance_contextual_advice_thread("0049_Battle_Advice_Poor_Artillery_Target_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0050_Battle_Advice_Risky_Elephant_Attack_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("elephants", context) and conditions.BattlePlayerUnitCategory("infantry", context) and not conditions.BattlePlayerUnitClass("infantry_light", context) then
		effect.advance_contextual_advice_thread("0050_Battle_Advice_Risky_Elephant_Attack_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0050a_Battle_Advice_Risky_Elephant_Attack_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("elephants", context) and conditions.BattlePlayerUnitCategory("infantry", context) and not conditions.BattlePlayerUnitClass("infantry_skirmishers", context) then
		return true
	end
	return false
end

--[[ 0051_Battle_Advice_Points_Against_Points_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("infantry", context) and conditions.BattleEnemyUnitCategory("infantry", context) and (conditions.BattleEnemyUnitSpecialAbilitySupported("plug_bayonets", context) or conditions.BattleEnemyUnitTechnologySupported("socket_bayonets", context) or conditions.BattleEnemyUnitTechnologySupported("ring_bayonets", context)) and (conditions.BattlePlayerUnitSpecialAbilitySupported("plug_bayonets", context) or conditions.BattlePlayerUnitTechnologySupported("socket_bayonets", context) or conditions.BattlePlayerUnitTechnologySupported("ring_bayonets", context)) and conditions.BattlePlayerUnitEngagedInMelee(context) then
		effect.advance_contextual_advice_thread("0051_Battle_Advice_Points_Against_Points_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0052_Battle_Advice_Driving_Off_Skirmishers_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("infantry_light", context) and conditions.BattlePlayerUnitClass("cavalry_light", context) then
		effect.advance_contextual_advice_thread("0052_Battle_Advice_Driving_Off_Skirmishers_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0053_Battle_Advice_Artillery_Vs_Elephants_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitClass("elephants", context) >= 1 then
		effect.advance_contextual_advice_thread("0053_Battle_Advice_Artillery_Vs_Elephants_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0055_Battle_Advice_Light_Cavalry_Tactics_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_light", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitClass("cavalry_light", context) == 0 then
		effect.advance_contextual_advice_thread("0055_Battle_Advice_Light_Cavalry_Tactics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0056_Battle_Advice_Selective_Targeting_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("artillery", context) then
		effect.advance_contextual_advice_thread("0056_Battle_Advice_Selective_Targeting_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0058_Battle_Advice_Stay_In_Cover_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0058_Battle_Advice_Stay_In_Cover_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0059_Battle_Advice_Offer_Ambush_Bait_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleType("land_ambush", context) then
		return true
	end
	return false
end

--[[ 0060_Battle_Advice_Feigning_A_Rout_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0060_Battle_Advice_Feigning_A_Rout_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0061_Battle_Advice_Entice_The_Enemy_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0061_Battle_Advice_Entice_The_Enemy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0062_Battle_Advice_Study_Their_Lines_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0062_Battle_Advice_Study_Their_Lines_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0063_Battle_Advice_Enrage_The_Enemy_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) and (conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_light", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_missile", context) >=1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_skirmishers", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_light", context) >= 1) then
		effect.advance_contextual_advice_thread("0063_Battle_Advice_Enrage_The_Enemy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0064_Battle_Advice_Encircle_The_Enemy_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) > 1.9 and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) < 2.1 then
		effect.advance_contextual_advice_thread("0064_Battle_Advice_Encircle_The_Enemy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0065_Battle_Advice_Outnumbered_By_The_Enemy_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) > 0.4 and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) < 0.6 and conditions.BattleAllianceNumberOfUnits(context) >= 4 then
		effect.advance_contextual_advice_thread("0065_Battle_Advice_Outnumbered_By_The_Enemy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0066_Battle_Advice_Take_The_Initiative_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 then
		effect.advance_contextual_advice_thread("0066_Battle_Advice_Take_The_Initiative_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0067_Battle_Advice_Distract_The_Enemy_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAllianceDefendingHill(context) then
		effect.advance_contextual_advice_thread("0067_Battle_Advice_Distract_The_Enemy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0068_Battle_Advice_Overcommitment_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0068_Battle_Advice_Overcommitment_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0069_Battle_Advice_High_Ground_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0069_Battle_Advice_High_Ground_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0070_Battle_Advice_Avoid_Elite_Units_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and (conditions.BattleEnemyAlliancePercentageOfUnitClass("infantry_elite", context) >= 1 or conditions.BattleEnemyAlliancePercentageOfUnitClass("infantry_grenadiers", context) >= 1) and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_elite", context) == 0 and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_grenadiers", context) == 0 then
		effect.advance_contextual_advice_thread("0070_Battle_Advice_Avoid_Elite_Units_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0071_Battle_Advice_Keep_Enemy_Occupied_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) > 0.4 and conditions.BattlePlayerAllianceToEnemyAllianceRatio(context) < 0.6 and conditions.BattleAllianceNumberOfUnits(context) >= 7 then
		effect.advance_contextual_advice_thread("0071_Battle_Advice_Keep_Enemy_Occupied_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0073_Battle_Advice_Mountain_Passes_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0073_Battle_Advice_Mountain_Passes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0074_Battle_Advice_Fight_Downhill_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAllianceDefendingHill(context) then
		effect.advance_contextual_advice_thread("0074_Battle_Advice_Fight_Downhill_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0076_Battle_Advice_Skirmish_Mode_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and (conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_skirmishers", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_missile", context) >= 1) then
		effect.advance_contextual_advice_thread("0076_Battle_Advice_Skirmish_Mode_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0077_Battle_Advice_Fire_At_Will_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0077_Battle_Advice_Fire_At_Will_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0078_Battle_Advice_Guard_Mode_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0078_Battle_Advice_Guard_Mode_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0079_Battle_Advice_Group_Formations_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 7 then
		effect.advance_contextual_advice_thread("0079_Battle_Advice_Group_Formations_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0080_Battle_Advice_Withdraw_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0080_Battle_Advice_Withdraw_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0081_Battle_Advice_Cancel_Order_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0081_Battle_Advice_Cancel_Order_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0082_Battle_Advice_Group_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 4 then
		effect.advance_contextual_advice_thread("0082_Battle_Advice_Group_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0083_Battle_Advice_Group_Formations_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfUnits(context) >= 10 then
		effect.advance_contextual_advice_thread("0083_Battle_Advice_Group_Formations_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0084_Battle_Advice_Routing_Trigger ]]--

events.BattleUnitRouts[#events.BattleUnitRouts+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitActionStatus("routing", context) then
		effect.advance_contextual_advice_thread("0084_Battle_Advice_Routing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0085_Battle_Advice_Fighting_Elephants_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("elephants", context) and (conditions.BattlePlayerUnitClass("infantry_grenadiers", context) or conditions.BattlePlayerUnitClass("infantry_melee", context)) then
		effect.advance_contextual_advice_thread("0085_Battle_Advice_Fighting_Elephants_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0086_Battle_Advice_Fighting_Elephants_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("elephants", context) and conditions.BattlePlayerUnitCategory("cavalry", context) then
		effect.advance_contextual_advice_thread("0086_Battle_Advice_Fighting_Elephants_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0087_Battle_Advice_Elephants_Amok_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0087_Battle_Advice_Elephants_Amok_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0089_Battle_Advice_Facing_Artillery_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("artillery", context) and conditions.BattleEnemyUnitCategory("infantry", context) and (conditions.BattleHasCoverWalls(context) or conditions.BattleHasCoverBuildings(context)) then
		effect.advance_contextual_advice_thread("0089_Battle_Advice_Facing_Artillery_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0089a_Battle_Advice_Facing_Artillery_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("artillery", context) and conditions.BattleEnemyUnitCategory("infantry", context) and conditions.BattleHasCoverWalls(context) and conditions.BattleHasCoverBuildings(context) then
		return true
	end
	return false
end

--[[ 0090_Battle_Advice_Missile_Cavalry_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_missile", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_heavy", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_lancers", context) >= 1 then
		effect.advance_contextual_advice_thread("0090_Battle_Advice_Missile_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0091_Battle_Advice_Facing_Cavalry_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("cavalry", context) and conditions.BattleEnemyUnitClass("infantry_line", context) and (conditions.BattlePlayerUnitActionStatus("charging", context) or conditions.BattlePlayerUnitActionStatus("moving_fast", context)) then
		effect.advance_contextual_advice_thread("0091_Battle_Advice_Facing_Cavalry_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0092_Battle_Advice_Rallying_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("general", context) >= 1 then
		effect.advance_contextual_advice_thread("0092_Battle_Advice_Rallying_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0093_Battle_Advice_General_Threatened_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("general", context) and conditions.BattleEnemyUnitActionStatus("fighting_melee", context) then
		effect.advance_contextual_advice_thread("0093_Battle_Advice_General_Threatened_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0094_Battle_Advice_Line_Wavering_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitActionStatus("fighting_melee", context) and conditions.BattleEnemyUnitActionStatus("wavering", context) then
		return true
	end
	return false
end

--[[ 0095_Battle_Advice_Wedge_Formations_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("cavalry", context) and conditions.BattlePlayerUnitMovingFast(context) and (conditions.BattlePlayerUnitSpecialAbilitySupported("wedge_formation", context) or conditions.BattlePlayerUnitSpecialAbilitySupported("diamond_formation", context)) and not conditions.BattlePlayerUnitSpecialAbilityActive("diamond_formation", context) and not conditions.BattlePlayerUnitSpecialAbilityActive("wedge_formation", context) and not conditions.BattlePlayerUnitCurrentFormation("wedge_formation", context) and not conditions.BattlePlayerUnitCurrentFormation("diamond_formation", context) then
		return true
	end
	return false
end

--[[ 0096_Battle_Advice_Skirmish_Mode_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and (conditions.BattlePlayerUnitClass("infantry_skirmishers", context) or conditions.BattlePlayerUnitClass("cavalry_missile", context)) then
		effect.advance_contextual_advice_thread("0096_Battle_Advice_Skirmish_Mode_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0097_Battle_Advice_Crossing_Attack_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleType("land_bridge", context) and conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0097_Battle_Advice_Crossing_Attack_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0098_Battle_Advice_Crossing_Defence_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleType("land_bridge", context) and conditions.BattleAllianceIsAttacker(context) and not conditions.BattleAllianceIsPlayers(context) and conditions.BattleEnemyAlliancePercentageOfUnitCategory("artillery", context) >= 15 then
		effect.advance_contextual_advice_thread("0098_Battle_Advice_Crossing_Defence_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0099_Battle_Advice_Ambush_Attack_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageCanHide(context) >= 1 then
		effect.advance_contextual_advice_thread("0099_Battle_Advice_Ambush_Attack_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0100_Battle_Advice_Radar_Map_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0100_Battle_Advice_Radar_Map_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0101_Battle_Advice_Hour_Glass_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed(-1755835367, context) then
		return true
	end
	return false
end

--[[ 0102_Battle_Advice_Cavalry_Charges_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("cavalry", context) and not conditions.BattlePlayerUnitClass("cavalry_missile", context) and not conditions.BattlePlayerUnitClass("elephants", context) and conditions.BattlePlayerUnitMovingFast(context) then
		effect.advance_contextual_advice_thread("0102_Battle_Advice_Cavalry_Charges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0103_Battle_Advice_Melee_Button_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitEngagedInMelee(context) then
		effect.advance_contextual_advice_thread("0103_Battle_Advice_Melee_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0104_Battle_Advice_Run_Button_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("infantry", context) and not conditions.BattlePlayerUnitMovingFast(context) and not conditions.BattlePlayerUnitActionStatus("charging", context) then
		effect.advance_contextual_advice_thread("0104_Battle_Advice_Run_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0105_Battle_Advice_Fighting_Irregulars_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleEnemyAlliancePercentageOfUnitClass("infantry_irregulars", context) >= 1 then
		effect.advance_contextual_advice_thread("0105_Battle_Advice_Fighting_Irregulars_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0106_Battle_Advice_Killometer_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed(97123942, context) then
		effect.advance_contextual_advice_thread("0106_Battle_Advice_Killometer_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0107_Battle_Advice_Bombardment_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0107_Battle_Advice_Bombardment_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0108_Battle_Advice_Defences_Stakes_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_light", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitCategory("cavalry", context) >= 1 then
		effect.advance_contextual_advice_thread("0108_Battle_Advice_Defences_Stakes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0109_Battle_Advice_Defences_Stakes_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 1 and (conditions.BattleEnemyAlliancePercentageOfSpecialAbility("chevaux_de_frise", context) >= 1 or conditions.BattleEnemyAlliancePercentageOfSpecialAbility("wooden_stakes", context) >= 1) then
		effect.advance_contextual_advice_thread("0109_Battle_Advice_Defences_Stakes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0110_Battle_Advice_Defences_Chevaux_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("chevaux_de_frise", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitCategory("cavalry", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0110_Battle_Advice_Defences_Chevaux_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0111_Battle_Advice_Defences_Fougasse_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and (conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fougasse_basic", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fougasse_improved", context) >= 1) then
		effect.advance_contextual_advice_thread("0111_Battle_Advice_Defences_Fougasse_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0112_Battle_Advice_Defences_Earthworks_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("earthworks", context) >= 1 then
		effect.advance_contextual_advice_thread("0112_Battle_Advice_Defences_Earthworks_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0113_Battle_Advice_Defences_Gabionades_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("gabionade", context) >= 1 then
		effect.advance_contextual_advice_thread("0113_Battle_Advice_Defences_Gabionades_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0114_Battle_Advice_Siege_Ladders_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_melee", context) == 0 then
		effect.advance_contextual_advice_thread("0114_Battle_Advice_Siege_Ladders_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0115_Battle_Advice_Grenadiers_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_grenadiers", context) >= 1 then
		effect.advance_contextual_advice_thread("0115_Battle_Advice_Grenadiers_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0116_Battle_Advice_Dragoons_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("dragoons", context) then
		effect.advance_contextual_advice_thread("0116_Battle_Advice_Dragoons_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0117_Battle_Advice_Light_Dragoons_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("dragoons", context) then
		return true
	end
	return false
end

--[[ 0118_Battle_Advice_First_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0118_Battle_Advice_First_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0119_Battle_Advice_Unlimbering_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfUnitClass("artillery_fixed", context) == 0 then
		effect.advance_contextual_advice_thread("0119_Battle_Advice_Unlimbering_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0120_Battle_Advice_Limbering_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed(-1892323933, context) then
		effect.advance_contextual_advice_thread("0120_Battle_Advice_Limbering_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0121_Battle_Advice_Galloper_Guns_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitClass("artillery_horse", context) >= 1 then
		effect.advance_contextual_advice_thread("0121_Battle_Advice_Galloper_Guns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0124_Battle_Advice_Round_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if not conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("round_shot", context) >= 1 then
		effect.advance_contextual_advice_thread("0124_Battle_Advice_Round_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0125_Battle_Advice_Explosive_Shells_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("explosive_shell", context) >= 1 then
		effect.advance_contextual_advice_thread("0125_Battle_Advice_Explosive_Shells_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0126_Battle_Advice_Percussive_Shells_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("percussive_shell", context) >= 1 then
		effect.advance_contextual_advice_thread("0126_Battle_Advice_Percussive_Shells_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0127_Battle_Advice_Cannister_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("canister", context) >= 1 then
		effect.advance_contextual_advice_thread("0127_Battle_Advice_Cannister_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0128_Battle_Advice_Spherical_Case_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("shrapnel", context) >= 1 then
		effect.advance_contextual_advice_thread("0128_Battle_Advice_Spherical_Case_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0129_Battle_Advice_Carcass_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("carcass", context) >= 1 then
		effect.advance_contextual_advice_thread("0129_Battle_Advice_Carcass_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0130_Battle_Advice_Quicklime_Shells_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("quicklime", context) >= 1 then
		effect.advance_contextual_advice_thread("0130_Battle_Advice_Quicklime_Shells_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0131_Battle_Advice_Infantry_Square_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("square_formation", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("square_formation", context) < 10 then
		effect.advance_contextual_advice_thread("0131_Battle_Advice_Infantry_Square_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0132_Battle_Advice_Supporting_Squares_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("square_formation", context) >= 10 then
		effect.advance_contextual_advice_thread("0132_Battle_Advice_Supporting_Squares_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0133_Battle_Advice_Lancers_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitClass("cavalry_lancers", context) and conditions.BattlePlayerUnitActionStatus("charging", context) then
		effect.advance_contextual_advice_thread("0133_Battle_Advice_Lancers_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0135_Battle_Advice_Irregular_Troops_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and (conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_irregular", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_irregulars", context) >= 1) then
		effect.advance_contextual_advice_thread("0135_Battle_Advice_Irregular_Troops_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0136_Battle_Advice_Plug_Bayonets_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfSpecialAbility("plug_bayonets", context) >= 1 then
		effect.advance_contextual_advice_thread("0136_Battle_Advice_Plug_Bayonets_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0137_Battle_Advice_Ring_Bayonets_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfTechnology("ring_bayonets", context) >= 1 then
		return true
	end
	return false
end

--[[ 0138_Battle_Advice_Socket_Bayonets_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfTechnology("socket_bayonets", context) >= 1 then
		effect.advance_contextual_advice_thread("0138_Battle_Advice_Socket_Bayonets_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0139_Battle_Advice_Deployment_Image_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0139_Battle_Advice_Deployment_Image_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0140_Battle_Advice_Select_All_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleEnemyAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0140_Battle_Advice_Select_All_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0141_Battle_Advice_Terrain_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0141_Battle_Advice_Terrain_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0142_Battle_Advice_Sabres_Muskets_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("cavalry", context) >= 1 and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_missile", context) == 0 and conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_lancers", context) == 0 then
		effect.advance_contextual_advice_thread("0142_Battle_Advice_Sabres_Muskets_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0144_Battle_Advice_Defending_Forts_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0144_Battle_Advice_Defending_Forts_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0145_Battle_Advice_Kill_Their_General_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitClass("general", context) then
		effect.advance_contextual_advice_thread("0145_Battle_Advice_Kill_Their_General_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0146_Battle_Advice_Buildings_As_Cover_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattleHasCoverBuildings(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0146_Battle_Advice_Buildings_As_Cover_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0148_Battle_Advice_Special_Abilities_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and (conditions.BattlePlayerAlliancePercentageOfSpecialAbility("chevaux_de_frise", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("diamond_formation", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("earthworks", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fire_and_advance", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fire_mounted", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fire_volley", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fougasse_basic", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("fougasse_improved", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("gabionade", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("improved_platoon_fire_column", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("improved_platoon_fire_dispersed", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("improved_platoon_fire_grouped", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("mass_fire", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("pike_square_formation", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("pike_wall_formation", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("platoon_fire_column", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("platoon_fire_dispersed", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("platoon_fire_grouped", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("plug_bayonets", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("rank_fire", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfTechnology("ring_bayonets", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfTechnology("socket_bayonets", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("square_formation", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("wedge_formation", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfSpecialAbility("wooden_stakes", context) >= 1) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("0148_Battle_Advice_Special_Abilities_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0149_Battle_Advice_Walls_As_Cover_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattleHasCoverWalls(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("infantry", context) >= 1 and conditions.BattleEnemyAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0149_Battle_Advice_Walls_As_Cover_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0150_Battle_Advice_Target_Their_Weaknesses_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0150_Battle_Advice_Target_Their_Weaknesses_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0151_Battle_Advice_Sinking_Ship_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleEnemyShipActionStatus("sinking", context) then
		effect.advance_contextual_advice_thread("0151_Battle_Advice_Sinking_Ship_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0152_Battle_Advice_Dismasted_Ship_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleEnemyShipActionStatus("dismasted", context) then
		effect.advance_contextual_advice_thread("0152_Battle_Advice_Dismasted_Ship_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0153_Battle_Advice_Sails_Destroyed_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleShipSailsPercentageDamage(context) == 100 then
		effect.advance_contextual_advice_thread("0153_Battle_Advice_Sails_Destroyed_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0154_Battle_Advice_Hull_Damaged_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleEnemyShipActionStatus("hull_damaged", context) then
		effect.advance_contextual_advice_thread("0154_Battle_Advice_Hull_Damaged_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0156_Battle_Advice_Ship_Aground_Trigger ]]--

events.BattleShipRunAground[#events.BattleShipRunAground+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) then
		effect.advance_contextual_advice_thread("0156_Battle_Advice_Ship_Aground_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0157_Battle_Advice_Ship_Ablaze_Trigger ]]--

events.BattleShipCaughtFire[#events.BattleShipCaughtFire+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and not conditions.BattlePlayerShipActionStatus("sinking", context) then
		effect.advance_contextual_advice_thread("0157_Battle_Advice_Ship_Ablaze_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0158_Battle_Advice_Magazine_Explosion_Trigger ]]--

events.BattleShipMagazineExplosion[#events.BattleShipMagazineExplosion+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) then
		effect.advance_contextual_advice_thread("0158_Battle_Advice_Magazine_Explosion_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0160_Battle_Advice_Ship_Routing_Trigger ]]--

events.BattleShipRouts[#events.BattleShipRouts+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and conditions.BattlePlayerShipActionStatus("routing", context) then
		effect.advance_contextual_advice_thread("0160_Battle_Advice_Ship_Routing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0161_Battle_Advice_Ship_Routing_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleEnemyShipActionStatus("routing", context) and conditions.BattlePlayerShipActionStatus("pursue_routers", context) then
		effect.advance_contextual_advice_thread("0161_Battle_Advice_Ship_Routing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0162_Battle_Advice_Ship_Routing_Trigger ]]--

events.BattleShipRouts[#events.BattleShipRouts+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleEnemyShipActionStatus("routing", context) then
		effect.advance_contextual_advice_thread("0162_Battle_Advice_Ship_Routing_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0163_Battle_Advice_Ship_Captured_Trigger ]]--

events.BattleShipSurrendered[#events.BattleShipSurrendered+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and not conditions.BattlePlayerShipActionStatus("sinking", context) then
		effect.advance_contextual_advice_thread("0163_Battle_Advice_Ship_Captured_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0164_Battle_Advice_Ship_Captured_Trigger ]]--

events.BattleShipSurrendered[#events.BattleShipSurrendered+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and not conditions.BattleEnemyShipActionStatus("sinking", context) then
		effect.advance_contextual_advice_thread("0164_Battle_Advice_Ship_Captured_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0165_Battle_Advice_Ship_Rallying_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and not conditions.BattleShipIsPlayers(context) and conditions.BattleEnemyShipActionStatus("wavering", context) then
		effect.advance_contextual_advice_thread("0165_Battle_Advice_Ship_Rallying_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0166_Battle_Advice_Ship_Rallying_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0166_Battle_Advice_Ship_Rallying_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0167_Battle_Advice_Sloop_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and conditions.BattlePlayerShipClass("naval_sloop", context) then
		effect.advance_contextual_advice_thread("0167_Battle_Advice_Sloop_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0168_Battle_Advice_Brig_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and conditions.BattlePlayerShipClass("naval_brig", context) then
		effect.advance_contextual_advice_thread("0168_Battle_Advice_Brig_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0169_Battle_Advice_Frigate_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and (conditions.BattlePlayerShipClass("naval_fifth_rate", context) or conditions.BattlePlayerShipClass("naval_sixth_rate", context)) then
		effect.advance_contextual_advice_thread("0169_Battle_Advice_Frigate_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0170_Battle_Advice_Lineship_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and (conditions.BattlePlayerShipClass("naval_first_rate", context) or conditions.BattlePlayerShipClass("naval_second_rate", context) or conditions.BattlePlayerShipClass("naval_third_rate", context) or conditions.BattlePlayerShipClass("naval_fourth_rate", context) or conditions.BattlePlayerShipClass("naval_over_first_rate", context)) then
		effect.advance_contextual_advice_thread("0170_Battle_Advice_Lineship_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0171_Battle_Advice_Galley_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and (conditions.BattlePlayerShipClass("naval_heavy_galley", context) or conditions.BattlePlayerShipClass("naval_light_galley", context) or conditions.BattlePlayerShipClass("naval_medium_galley", context)) then
		effect.advance_contextual_advice_thread("0171_Battle_Advice_Galley_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0172_Battle_Advice_Xebec_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and conditions.BattlePlayerShipClass("naval_xebec", context) then
		effect.advance_contextual_advice_thread("0172_Battle_Advice_Xebec_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0173_Battle_Advice_Steam_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and conditions.BattlePlayerShipClass("naval_steam_ship", context) then
		effect.advance_contextual_advice_thread("0173_Battle_Advice_Steam_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0174_Battle_Advice_Razee_Characteristics_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) and conditions.BattlePlayerShipClass("naval_razee", context) then
		effect.advance_contextual_advice_thread("0174_Battle_Advice_Razee_Characteristics_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0175_Battle_Advice_Wind_Direction_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0175_Battle_Advice_Wind_Direction_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0176_Battle_Advice_Sailing_Into_Wind_Trigger ]]--

events.BattleShipSailingIntoWind[#events.BattleShipSailingIntoWind+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) then
		effect.advance_contextual_advice_thread("0176_Battle_Advice_Sailing_Into_Wind_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0177_Battle_Advice_Line_Astern_Formation_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("line_astern", context) then
		effect.advance_contextual_advice_thread("0177_Battle_Advice_Line_Astern_Formation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0178_Battle_Advice_Crescent_Formation_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("crescent_attack", context) and not conditions.AdviceDisplayed(2106012703, context) then
		effect.advance_contextual_advice_thread("0178_Battle_Advice_Crescent_Formation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0178a_Battle_Advice_Crescent_Formation_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("crescent_envelope", context) and not conditions.AdviceDisplayed(2106012703, context) then
		return true
	end
	return false
end

--[[ 0180_Battle_Advice_Line_Abreast_Formation_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("line_abreast", context) then
		effect.advance_contextual_advice_thread("0180_Battle_Advice_Line_Abreast_Formation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0181_Battle_Advice_Outgunned_Avoidance_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleEnemyHasMissileSuperiority(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfShips(context) >= 7 and conditions.BattlePlayerAlliancePercentageOfAmmoType("chain", context) >= 1 then
		effect.advance_contextual_advice_thread("0181_Battle_Advice_Outgunned_Avoidance_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0182_Battle_Advice_Crossing_The_T_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0182_Battle_Advice_Crossing_The_T_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0183_Battle_Advice_Weather_Gauge_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0183_Battle_Advice_Weather_Gauge_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0184_Battle_Advice_Hiding_At_Sea_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0184_Battle_Advice_Hiding_At_Sea_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0185_Battle_Advice_Naval_Round_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("round_shot", context) >= 1 then
		effect.advance_contextual_advice_thread("0185_Battle_Advice_Naval_Round_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0186_Battle_Advice_Naval_Grape_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("grape", context) >= 1 then
		effect.advance_contextual_advice_thread("0186_Battle_Advice_Naval_Grape_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0187_Battle_Advice_Naval_Chain_Shot_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfAmmoType("chain", context) >= 1 then
		effect.advance_contextual_advice_thread("0187_Battle_Advice_Naval_Chain_Shot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0188_Battle_Advice_Naval_Radar_Map_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0188_Battle_Advice_Naval_Radar_Map_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0189_Battle_Advice_Naval_Manoeuvre_Compass_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0189_Battle_Advice_Naval_Manoeuvre_Compass_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0190_Battle_Advice_Left_Broadside_Button_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) then
		effect.advance_contextual_advice_thread("0190_Battle_Advice_Left_Broadside_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0191_Battle_Advice_Right_Broadside_Button_Trigger ]]--

events.BattleShipAttacksEnemyShip[#events.BattleShipAttacksEnemyShip+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleShipIsPlayers(context) then
		effect.advance_contextual_advice_thread("0191_Battle_Advice_Right_Broadside_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0192_Battle_Advice_Naval_Group_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfShips(context) >= 4 then
		effect.advance_contextual_advice_thread("0192_Battle_Advice_Naval_Group_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0193_Battle_Advice_Naval_Grouping_Ships_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("nav_button_group", context) then
		effect.advance_contextual_advice_thread("0193_Battle_Advice_Naval_Grouping_Ships_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0195_Battle_Advice_Naval_Withdraw_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0195_Battle_Advice_Naval_Withdraw_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0196_Battle_Advice_Naval_Fire_At_Will_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0196_Battle_Advice_Naval_Fire_At_Will_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0197_Battle_Advice_Naval_Boarding_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0197_Battle_Advice_Naval_Boarding_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0198_Battle_Advice_Naval_Formations_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceNumberOfShips(context) >= 4 then
		effect.advance_contextual_advice_thread("0198_Battle_Advice_Naval_Formations_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0200_Battle_Advice_Naval_Speed_Slider_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("fwd", context) or conditions.IsComponentType("ffwd", context) or conditions.IsComponentType("play", context) or conditions.IsComponentType("slow_mo", context)) then
		return true
	end
	return false
end

--[[ 0201_Battle_Advice_Naval_Review_Panel_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) then
		effect.advance_contextual_advice_thread("0201_Battle_Advice_Naval_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0202_Battle_Advice_Siege_Sapping_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		return true
	end
	return false
end

--[[ 0203_Battle_Advice_Siege_Sapping_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		return true
	end
	return false
end

--[[ 0204_Battle_Advice_Siege_Assault_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0204_Battle_Advice_Siege_Assault_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0206_Battle_Advice_Siege_Defence_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0206_Battle_Advice_Siege_Defence_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0207_Battle_Advice_Walls_Breached_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0207_Battle_Advice_Walls_Breached_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0208_Battle_Advice_Walls_Breached_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0208_Battle_Advice_Walls_Breached_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0209_Battle_Advice_Concentrate_Fire_Trigger ]]--

events.BattleUnitAttacksWalls[#events.BattleUnitAttacksWalls+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("artillery", context) then
		effect.advance_contextual_advice_thread("0209_Battle_Advice_Concentrate_Fire_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0211_Battle_Advice_Siege_Ladders_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) then
		effect.advance_contextual_advice_thread("0211_Battle_Advice_Siege_Ladders_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0213_Battle_Advice_Deployment_Phase_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) then
		effect.advance_contextual_advice_thread("0213_Battle_Advice_Deployment_Phase_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0215_Battle_Advice_Camera_Controls_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed(2032462934, context) then
		effect.advance_contextual_advice_thread("0215_Battle_Advice_Camera_Controls_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0216_Battle_Advice_Unit_Morale_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitCategory("infantry", context) then
		effect.advance_contextual_advice_thread("0216_Battle_Advice_Unit_Morale_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0217_Battle_Advice_Wavering_Morale_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattlePlayerUnitActionStatus("wavering", context) then
		effect.advance_contextual_advice_thread("0217_Battle_Advice_Wavering_Morale_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0218_Battle_Advice_Wavering_Morale_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitActionStatus("wavering", context) then
		effect.advance_contextual_advice_thread("0218_Battle_Advice_Wavering_Morale_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0219_Battle_Advice_Bayonet_Charge_Trigger ]]--

events.BattleUnitAttacksEnemyUnit[#events.BattleUnitAttacksEnemyUnit+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleUnitIsPlayers(context) and conditions.BattleEnemyUnitCategory("infantry", context) and conditions.BattleEnemyUnitActionStatus("reloading", context) and conditions.BattlePlayerUnitActionStatus("firing", context) and (conditions.BattlePlayerUnitSpecialAbilitySupported("plug_bayonets", context) or conditions.BattlePlayerUnitTechnologySupported("ring_bayonets", context) or conditions.BattlePlayerUnitTechnologySupported("socket_bayonets", context)) then
		effect.advance_contextual_advice_thread("0219_Battle_Advice_Bayonet_Charge_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0220_Battle_Advice_Ammo_Types_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattlePlayerAlliancePercentageOfUnitCategory("artillery", context) >= 1 then
		effect.advance_contextual_advice_thread("0220_Battle_Advice_Ammo_Types_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0221_Battle_Advice_Keeping Control Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		effect.advance_contextual_advice_thread("0221_Battle_Advice_Keeping Control Thread", 1, context)
		return true
	end
	return false
end

--[[ 1001_Campaign_Advice_Britain_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("britain", context) then
		effect.advance_contextual_advice_thread("1001_Campaign_Advice_Britain_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1002_Campaign_Advice_France_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("france", context) then
		effect.advance_contextual_advice_thread("1002_Campaign_Advice_France_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1003_Campaign_Advice_Spain_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("spain", context) then
		effect.advance_contextual_advice_thread("1003_Campaign_Advice_Spain_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1004_Campaign_Advice_Ottoman_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("ottomans", context) then
		effect.advance_contextual_advice_thread("1004_Campaign_Advice_Ottoman_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1005_Campaign_Advice_Russia_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("russia", context) then
		effect.advance_contextual_advice_thread("1005_Campaign_Advice_Russia_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1006_Campaign_Advice_Prussia_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("prussia", context) then
		effect.advance_contextual_advice_thread("1006_Campaign_Advice_Prussia_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1007_Campaign_Advice_Sweden_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("sweden", context) then
		effect.advance_contextual_advice_thread("1007_Campaign_Advice_Sweden_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1008_Campaign_Advice_Dutch_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("netherlands", context) then
		effect.advance_contextual_advice_thread("1008_Campaign_Advice_Dutch_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1009_Campaign_Advice_Austria_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("austria", context) then
		effect.advance_contextual_advice_thread("1009_Campaign_Advice_Austria_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1010_Campaign_Advice_Mughal_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("mughal", context) then
		effect.advance_contextual_advice_thread("1010_Campaign_Advice_Mughal_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1010a_Campaign_Advice_Maratha_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("maratha", context) then
		effect.advance_contextual_advice_thread("1010a_Campaign_Advice_Maratha_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1011_Campaign_Advice_America_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("united_states", context) and conditions.CampaignName("main_2", context) then
		effect.advance_contextual_advice_thread("1011_Campaign_Advice_America_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1012_Campaign_Advice_Poland_Initial_Turns_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("poland_lithuania", context) then
		effect.advance_contextual_advice_thread("1012_Campaign_Advice_Poland_Initial_Turns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1013_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("diplomatic_relations", context) then
		effect.advance_contextual_advice_thread("1013a_Campaign_Advice_UI_Diplomacy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1013b_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_minor_nations", context) or conditions.IsComponentType("tab_major_nations", context) then
		effect.advance_contextual_advice_thread("1013_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("diplomacy_panel", context) then
		effect.advance_contextual_advice_thread("1014_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014a_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_trade", context) then
		effect.advance_contextual_advice_thread("1014a_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014b_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_alliance", context) then
		effect.advance_contextual_advice_thread("1014b_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014c_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_state_gift", context) then
		effect.advance_contextual_advice_thread("1014c_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014d_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_protector", context) then
		effect.advance_contextual_advice_thread("1014d_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014e_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_war", context) then
		effect.advance_contextual_advice_thread("1014e_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014f_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_access", context) then
		effect.advance_contextual_advice_thread("1014f_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014g_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_regions", context) then
		effect.advance_contextual_advice_thread("1014g_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014h_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_technology", context) then
		effect.advance_contextual_advice_thread("1014h_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014j_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_payments", context) then
		effect.advance_contextual_advice_thread("1014j_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1017_Campaign_Advice_UI_Objectives_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_missions", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1017_Campaign_Advice_UI_Missions_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1017a_Campaign_Advice_UI_Objectives_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_victory_conditions", context) then
		effect.advance_contextual_advice_thread("1115_Campaign_Advice_Victory_Conditions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1017b_Campaign_Advice_UI_Objectives_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("missions", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1017_Campaign_Advice_UI_Missions_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1019_Campaign_Advice_UI_Technology_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1019_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1019a_Campaign_Advice_UI_Technology_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_military", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1019a_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1020_Campaign_Advice_UI_Set_Taxes_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_taxes", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1020_Campaign_Advice_UI_Set_Taxes_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1021_Campaign_Advice_UI_Automanagement_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_taxes", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1021_Campaign_Advice_UI_Automanagement_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1022a_Campaign_Advice_UI_Set_Taxes_Slider_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("handle", context) and conditions.IsChildOf("tx_classes_lower", context) then
		effect.advance_contextual_advice_thread("1022a_Campaign_Advice_UI_Set_Taxes_Slider_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1022b_Campaign_Advice_UI_Set_Taxes_Slider_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("handle", context) and conditions.IsChildOf("tx_classes_upper", context) then
		effect.advance_contextual_advice_thread("1022b_Campaign_Advice_UI_Set_Taxes_Slider_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1023_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("entity_lists", context) then
		effect.advance_contextual_advice_thread("1023_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1024_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("fleets", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1024_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1025_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("regions", context) then
		effect.advance_contextual_advice_thread("1025_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1026_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("agents", context) then
		effect.advance_contextual_advice_thread("1026_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1027_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("armies", context) then
		effect.advance_contextual_advice_thread("1027_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1028_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("government_screens", context) then
		effect.advance_contextual_advice_thread("1028_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_taxes", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1029_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_ministers", context) then
		effect.advance_contextual_advice_thread("1030_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030b_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed(1217408458, context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1030b_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030c_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if (conditions.AdviceJustDisplayed(1257998467, context) or conditions.AdviceJustDisplayed(-56839928, context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1030c_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030d_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_instant_election", context) then
		effect.advance_contextual_advice_thread("1030d_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1031_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_trade", context) then
		effect.advance_contextual_advice_thread("1031_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1032_Campaign_Advice_UI_Government_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_national_summary", context) then
		effect.advance_contextual_advice_thread("1032_Campaign_Advice_UI_Government_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1033_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("map", context) then
		effect.advance_contextual_advice_thread("1033_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1034_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("funds", context) then
		effect.advance_contextual_advice_thread("1034_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1035_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("date", context) then
		effect.advance_contextual_advice_thread("1035_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1036_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("season_icon", context) then
		effect.advance_contextual_advice_thread("1036_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1037_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 2 then
		return true
	end
	return false
end

--[[ 1038_Campaign_Advice_UI_Browser_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("building_browser", context) then
		effect.advance_contextual_advice_thread("1038_Campaign_Advice_UI_Browser_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1039_Campaign_Advice_UI_Prebattle_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_pre_battle", context) then
		effect.advance_contextual_advice_thread("1039_Campaign_Advice_UI_Prebattle_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1040_Campaign_Advice_UI_Postbattle_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_battle_results", context) then
		effect.advance_contextual_advice_thread("1040_Campaign_Advice_UI_Postbattle_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1041_Campaign_Advice_UI_Incoming_Message_Trigger ]]--

events.IncomingMessage[#events.IncomingMessage+1] =
function (context)
	if not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_2", context) and not conditions.CampaignName("episodic_3", context) then
		return true
	end
	return false
end

--[[ 1043_Campaign_Advice_UI_Incoming_Message_Trigger ]]--

events.IncomingMessage[#events.IncomingMessage+1] =
function (context)
	if conditions.IsMessageType("internal_mission_issued", context) then
		effect.advance_contextual_advice_thread("1043_Campaign_Advice_UI_Incoming_Message_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1044_Campaign_Advice_UI_Incoming_Message_Trigger ]]--

events.IncomingMessage[#events.IncomingMessage+1] =
function (context)
	if conditions.IsMessageType("internal_mission_issued", context) and not conditions.CampaignName("main", context) and not conditions.CampaignName("main_2", context) then
		return true
	end
	return false
end

--[[ 1045_Campaign_Advice_UI_Incoming_Message_Trigger ]]--

events.IncomingMessage[#events.IncomingMessage+1] =
function (context)
	if conditions.IsMessageType("disaster_earthquake", context) or conditions.IsMessageType("disaster_eruption", context) or conditions.IsMessageType("disaster_fire", context) or conditions.IsMessageType("disaster_flood", context) or conditions.IsMessageType("disaster_hurricane", context) then
		return true
	end
	return false
end

--[[ 1046_Campaign_Advice_UI_Incoming_Message_Trigger ]]--

events.IncomingMessage[#events.IncomingMessage+1] =
function (context)
	if conditions.IsMessageType("disease_cholera", context) or conditions.IsMessageType("disease_dengue_fever", context) or conditions.IsMessageType("disease_gripe", context) or conditions.IsMessageType("disease_malaria", context) or conditions.IsMessageType("disease_plague", context) or conditions.IsMessageType("disease_small_pox", context) or conditions.IsMessageType("disease_typhoid_fever", context) or conditions.IsMessageType("disease_typhus", context) or conditions.IsMessageType("disease_yellow_fever", context) then
		return true
	end
	return false
end

--[[ 1047_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("infrastructure_tab", context) then
		effect.advance_contextual_advice_thread("1047_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1048_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("construction_tab", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1048_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1049_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("recruitment_tab", context) then
		effect.advance_contextual_advice_thread("1049_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1049a_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("agents_tab", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1049a_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1050_Campaign_Advice_UI_Exchange_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("unit_exchange", context) then
		effect.advance_contextual_advice_thread("1050_Campaign_Advice_UI_Exchange_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1051_Campaign_Advice_Army_Promotions_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("army_tab", context) and (conditions.CampaignName("main", context) or conditions.CampaignName("main_2", context)) then
		effect.advance_contextual_advice_thread("1051_Campaign_Advice_Army_Promotions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1052_Campaign_Advice_Navy_Promotions_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("navy_tab", context) and (conditions.CampaignName("main", context) or conditions.CampaignName("main_2", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1052_Campaign_Advice_Navy_Promotions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1053_Campaign_Advice_Missions_Clock_Ticking_Trigger ]]--

events.MissionNearingExpiry[#events.MissionNearingExpiry+1] =
function (context)
	if true then
		effect.advance_contextual_advice_thread("1053_Campaign_Advice_Missions_Clock_Ticking_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1056_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("town", context) or conditions.SlotType("town-metal", context) or conditions.SlotType("town-textile", context)) then
		effect.advance_contextual_advice_thread("1056_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1057_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("port", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1057_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1058_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("sheep", context) or conditions.SlotType("wheat", context) or conditions.SlotType("rice", context) or conditions.SlotType("corn", context) or conditions.SlotType("cattle", context)) then
		effect.advance_contextual_advice_thread("1058_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1059_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("iron", context) or conditions.SlotType("silver", context) or conditions.SlotType("gold", context) or conditions.SlotType("gems", context)) then
		effect.advance_contextual_advice_thread("1059_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1060_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("wine", context) then
		effect.advance_contextual_advice_thread("1060_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1061_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("fur", context) then
		effect.advance_contextual_advice_thread("1061_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1062_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("timber", context) then
		effect.advance_contextual_advice_thread("1062_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1063_Campaign_Advice_Slot_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("southern_usa", context) or conditions.SlotType("caribbean", context) or conditions.SlotType("cuba", context) or conditions.SlotType("egypt", context) or conditions.SlotType("india_highlands", context) or conditions.SlotType("tropical_humid", context)) then
		effect.advance_contextual_advice_thread("1063_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1064_Campaign_Advice_Slot_Selected_Trigger ]]--

events.FortSelected[#events.FortSelected+1] =
function (context)
	if conditions.FortIsLocal(context) then
		effect.advance_contextual_advice_thread("1064_Campaign_Advice_Slot_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1065_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) then
		effect.advance_contextual_advice_thread("1065_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1066_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("admiral", context) or conditions.CharacterType("captain", context)) then
		effect.advance_contextual_advice_thread("1066_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1067_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("gentleman", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1067_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1068_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("rake", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1068_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1069_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("Eastern_Scholar", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1069_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1070_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("assassin", context) and conditions.CharacterCultureType("middle_east", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1070_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1071_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("assassin", context) and conditions.CharacterCultureType("indian", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1071_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1072_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("Protestant_Missionary", context) or conditions.CharacterType("orthodox_missionary", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1072_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1073_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1073_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1074_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("indian_missionary", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1074_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1075_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterType("pirate", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1075_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1076_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("bandit", context) and not conditions.CampaignName("natives", context) then
		return true
	end
	return false
end

--[[ 1077_Campaign_Advice_Character_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if not conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("captain", context) or conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context) or conditions.CharacterType("Eastern_Scholar", context) or conditions.CharacterType("assassin", context) or conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("Protestant_Missionary", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("indian_missionary", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1077_Campaign_Advice_Character_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1079a_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) then
		effect.advance_contextual_advice_thread("1079a_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1079b_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("admiral", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1079b_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1079c_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context) or conditions.CharacterType("Eastern_Scholar", context) or conditions.CharacterType("assassin", context)) then
		effect.advance_contextual_advice_thread("1079c_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1080_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if not conditions.CharacterIsLocalCampaign(context) then
		effect.advance_contextual_advice_thread("1080_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1081_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and (conditions.CampaignName("main", context) or conditions.CampaignName("main_2", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1081_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1081a_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and not conditions.CampaignName("main", context) and not conditions.CampaignName("main_2", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1081a_Episodic_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1082_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("UnitInfoPopup", context) then
		effect.advance_contextual_advice_thread("1082_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1083_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.BuildingInfoPanelOpenedCampaign[#events.BuildingInfoPanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("BuildingInfoPopup", context) then
		effect.advance_contextual_advice_thread("1083_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1083b_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.TechnologyInfoPanelOpenedCampaign[#events.TechnologyInfoPanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("BuildingInfoPopup", context) then
		effect.advance_contextual_advice_thread("1214_Campaign_Advice_Right_Click_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1084_Campaign_Advice_War_Weariness_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionWarWeariness(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1084_Campaign_Advice_War_Weariness_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1085_Campaign_Advice_Patriotic_Fervour_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionPatrioticFervour(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1085_Campaign_Advice_Patriotic_Fervour_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1086_Campaign_Advice_Ambush_Trigger ]]--

events.MovementPointsExhausted[#events.MovementPointsExhausted+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.CharacterEndedInAmbushPosition(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1086_Campaign_Advice_Ambush_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1087_Campaign_Advice_Settlement_Occupied_Trigger ]]--

events.SettlementOccupied[#events.SettlementOccupied+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1087_Campaign_Advice_Settlement_Occupied_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1088_Campaign_Advice_New_Township_Emerges_Trigger ]]--

events.SlotOpens[#events.SlotOpens+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.IsColony(context) and not conditions.SlotType("port", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1088_Campaign_Advice_New_Township_Emerges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1089_Campaign_Advice_New_Town_Emerges_Trigger ]]--

events.SlotOpens[#events.SlotOpens+1] =
function (context)
	if conditions.SlotIsLocal(context) and not conditions.IsColony(context) and not conditions.SlotType("port", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1089_Campaign_Advice_Town_Appears_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1090_Campaign_Advice_Multi_Turn_Moves_Trigger ]]--

events.MultiTurnMove[#events.MultiTurnMove+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1090_Campaign_Advice_Multi_Turn_Moves_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1091_Campaign_Advice_Movement_Exhausted_Trigger ]]--

events.MovementPointsExhausted[#events.MovementPointsExhausted+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1091_Campaign_Advice_Movement_Exhausted_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1092_Campaign_Advice_Region_Capital_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1092_Campaign_Advice_Region_Capital_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1093_Campaign_Advice_Faction_Capital_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsHomeRegion(context) and conditions.TurnNumber(context) == 4 then
		effect.advance_contextual_advice_thread("1093_Campaign_Advice_Faction_Capital_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1094_Campaign_Advice_Slums_Appear_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if conditions.SlotIsLocal(context) then
		effect.advance_contextual_advice_thread("1094_Campaign_Advice_Slums_Appear_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1095_Campaign_Advice_Trade_Agreement_Trigger ]]--

events.TradeRouteEstablished[#events.TradeRouteEstablished+1] =
function (context)
	if conditions.IsPlayerTurn(context) and conditions.FactionIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1095_Campaign_Advice_Trade_Agreement_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1096a_Campaign_Advice_Ungarrisoned_Fort_Trigger ]]--

events.UngarrisonedFort[#events.UngarrisonedFort+1] =
function (context)
	if conditions.FortIsLocal(context) and (conditions.TurnsSinceThreadLastAdvanced("1096a_Campaign_Advice_Ungarrisoned_Fort_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1096a_Campaign_Advice_Ungarrisoned_Fort_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1096a_Campaign_Advice_Ungarrisoned_Fort_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1097_Campaign_Advice_Government_Type_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) and conditions.TurnNumber(context) == 9 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1097_Campaign_Advice_Government_Type_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1098_Campaign_Advice_Government_Type_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionGovernmentType("gov_constitutional_monarchy", context) and conditions.TurnNumber(context) == 9 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1098_Campaign_Advice_Government_Type_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1099_Campaign_Advice_Government_Type_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionGovernmentType("gov_republic", context) and conditions.TurnNumber(context) == 9 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1099_Campaign_Advice_Government_Type_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1100_Campaign_Advice_Government_Type_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and conditions.TurnNumber(context) == 10 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1100_Campaign_Advice_Government_Type_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1101a_Campaign_Advice_Sieges_Trigger ]]--

events.CampaignSettlementAttacked[#events.CampaignSettlementAttacked+1] =
function (context)
	if conditions.PlayerFactionIsAttacker(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1101_Campaign_Advice_Sieges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1101c_Campaign_Advice_Sieges_Trigger ]]--

events.CampaignSettlementAttacked[#events.CampaignSettlementAttacked+1] =
function (context)
	if not conditions.PlayerFactionIsAttacker(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1101a_Campaign_Advice_Sieges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1101d_Campaign_Advice_Sieges_Trigger ]]--

events.CampaignSlotAttacked[#events.CampaignSlotAttacked+1] =
function (context)
	if not conditions.PlayerFactionIsAttacker(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1101a_Campaign_Advice_Sieges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1103_Campaign_Advice_Warning_Undeveloped_Farm_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and (conditions.SlotType("sheep", context) or conditions.SlotType("wheat", context) or conditions.SlotType("rice", context) or conditions.SlotType("corn", context) or conditions.SlotType("cattle", context)) and (conditions.TurnsSinceThreadLastAdvanced("1103_Campaign_Advice_Undeveloped_Farm_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1103_Campaign_Advice_Undeveloped_Farm_Thread", context) == 5) then
		effect.advance_contextual_advice_thread("1103_Campaign_Advice_Undeveloped_Farm_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1104_Campaign_Advice_Warning_Undeveloped_Port_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and conditions.SlotType("port", context) and (conditions.TurnsSinceThreadLastAdvanced("1104_Campaign_Advice_Undeveloped_Port_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1104_Campaign_Advice_Undeveloped_Port_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1104_Campaign_Advice_Undeveloped_Port_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1105_Campaign_Advice_Warning_Undeveloped_Plantation_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and (conditions.SlotType("southern_usa", context) or conditions.SlotType("caribbean", context) or conditions.SlotType("cuba", context) or conditions.SlotType("egypt", context) or conditions.SlotType("india_highlands", context) or conditions.SlotType("tropical_humid", context)) and (conditions.TurnsSinceThreadLastAdvanced("1105_Campaign_Advice_Undeveloped_Plantation_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1105_Campaign_Advice_Undeveloped_Plantation_Thread", context) == 5) then
		effect.advance_contextual_advice_thread("1105_Campaign_Advice_Undeveloped_Plantation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1106_Campaign_Advice_Warning_Undeveloped_Town_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and conditions.SlotType("town", context) and (conditions.TurnsSinceThreadLastAdvanced("1106_Campaign_Advice_Undeveloped_Town_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1106_Campaign_Advice_Undeveloped_Town_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1106_Campaign_Advice_Undeveloped_Town_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1107_Campaign_Advice_Warning_Unexploited_Resources_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and (conditions.SlotType("iron", context) or conditions.SlotType("silver", context) or conditions.SlotType("gold", context) or conditions.SlotType("gems", context) or conditions.SlotType("iron", context) or conditions.SlotType("silver", context) or conditions.SlotType("gold", context) or conditions.SlotType("gems", context)) and (conditions.TurnsSinceThreadLastAdvanced("1107_Campaign_Advice_Unexploited_Resources_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1107_Campaign_Advice_Unexploited_Resources_Thread", context) == 5) then
		effect.advance_contextual_advice_thread("1107_Campaign_Advice_Unexploited_Resources_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1108_Campaign_Advice_Bookmarks_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 11 then
		effect.advance_contextual_advice_thread("1108_Campaign_Advice_Bookmarks_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1109_Campaign_Advice_Fog_Of_War_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 3 then
		effect.advance_contextual_advice_thread("1109_Campaign_Advice_Fog_Of_War_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1110_Campaign_Advice_Trade_Routes_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 5 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1110_Campaign_Advice_Trade_Routes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1111_Campaign_Advice_Slots_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 7 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1111_Campaign_Advice_Slots_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1112_Campaign_Advice_Resources_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 8 then
		effect.advance_contextual_advice_thread("1112_Campaign_Advice_Resources_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1114_Campaign_Advice_Keyboard_Shortcuts_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 13 then
		effect.advance_contextual_advice_thread("1114_Campaign_Advice_Keyboard_Shortcuts_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1116_Campaign_Advice_Prestige_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_prestige", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1116_Campaign_Advice_Prestige_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1117_Campaign_Advice_Merging_Armies_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 13 then
		effect.advance_contextual_advice_thread("1117_Campaign_Advice_Merging_Armies_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1118_Campaign_Advice_Warning_Riot_Trigger ]]--

events.RegionRiots[#events.RegionRiots+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1118_Campaign_Advice_Warning_Riot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1119_Campaign_Advice_Warning_Rebellion_Trigger ]]--

events.RegionRebels[#events.RegionRebels+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1119_Campaign_Advice_Warning_Rebellion_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1120_Campaign_Advice_Warning_Revolution_Trigger ]]--

events.RegionRebels[#events.RegionRebels+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsHomeRegion(context) and conditions.WouldRebellionInRegionBeRevolution(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1120_Campaign_Advice_Warning_Revolution_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1121_Campaign_Advice_Warning_Clamour_Reform_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionClamoursReform(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1121_Campaign_Advice_Warning_Clamour_Reform_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1122_Campaign_Advice_Warning_Demands_Trigger ]]--

events.RegionIssuesDemands[#events.RegionIssuesDemands+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1122_Campaign_Advice_Warning_Letter_Demands_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1123_Campaign_Advice_Warning_Upkeep_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.SupportCostsPercentage(context) > 60 and conditions.FactionTreasury(context) > 0 and (conditions.FactionTaxLevel("upper_classes", context) < conditions.TaxLevel("tax_extortionate", context) or conditions.FactionTaxLevel("lower_classes", context) < conditions.TaxLevel("tax_extortionate", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1123_Campaign_Advice_Warning_Upkeep_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1124_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 0 and conditions.UnusedInternationalTradeRoute(context) then
		effect.advance_contextual_advice_thread("1124_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1124a_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 0 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1124a_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1125_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.SupportCostsPercentage(context) > 60 and conditions.FactionTreasury(context) <= 0 then
		effect.advance_contextual_advice_thread("1125_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1126_Campaign_Advice_Warning_Cashflow_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionTreasury(context) < 200 and (conditions.FactionTaxLevel("upper_classes", context) < conditions.TaxLevel("tax_extortionate", context) or conditions.FactionTaxLevel("lower_classes", context) < conditions.TaxLevel("tax_extortionate", context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1126_Campaign_Advice_Warning_Cashflow_Trigger", 1, context)
		return true
	end
	return false
end

--[[ 1126a_Campaign_Advice_Warning_Cashflow_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) < 200 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1126a_Campaign_Advice_Warning_Cashflow_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1127_Campaign_Advice_Warning_Trade_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.UnusedInternationalTradeRoute(context) and (conditions.TurnsSinceThreadLastAdvanced("1127_Campaign_Advice_Warning_Trade_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1127_Campaign_Advice_Warning_Trade_Thread", context) == 5) then
		effect.advance_contextual_advice_thread("1127_Campaign_Advice_Warning_Trade_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1128_Campaign_Advice_Warning_Adjacent_Rebellion_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.IsHomeRegion(context) and conditions.AdjacentRegionRebelling(context) then
		return true
	end
	return false
end

--[[ 1129_Campaign_Advice_Warning_Adjacent_Revolution_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsHomeRegion(context) and conditions.AdjacentRegionRebelling(context) then
		return true
	end
	return false
end

--[[ 1133_Campaign_Advice_Warning_High_Tax_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionTaxLevel("upper_classes", context) == conditions.TaxLevel("tax_extortionate", context) and not conditions.RegionTaxExempt(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1133_Campaign_Advice_Warning_High_Tax_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1134_Campaign_Advice_Warning_High_Tax_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionTaxLevel("lower_classes", context) == conditions.TaxLevel("tax_extortionate", context) and not conditions.RegionTaxExempt(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1134_Campaign_Advice_Warning_High_Tax_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1135_Campaign_Advice_Warning_Culture_Shock_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.RegionCultureIsFactionCulture(context) and (conditions.TurnsSinceThreadLastAdvanced("1135_Campaign_Advice_Warning_Culture_Shock_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1135_Campaign_Advice_Warning_Culture_Shock_Thread", context) == 5) then
		effect.advance_contextual_advice_thread("1135_Campaign_Advice_Warning_Culture_Shock_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1136_Campaign_Advice_Warning_Religious_Unrest_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.IsColony(context) and conditions.RegionReligiousEmigration(context) and (conditions.TurnsSinceThreadLastAdvanced("1136_Campaign_Advice_Religious_Unrest_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1136_Campaign_Advice_Religious_Unrest_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1136_Campaign_Advice_Religious_Unrest_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1137_Campaign_Advice_Warning_Religious_Unrest_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsColony(context) and not conditions.RegionReligionIsStateReligion(context) and (conditions.TurnsSinceThreadLastAdvanced("1137_Campaign_Advice_Religious_Unrest_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1137_Campaign_Advice_Religious_Unrest_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1137_Campaign_Advice_Religious_Unrest_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1138_Campaign_Advice_Warning_Population_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionHasFoodShortages(context) and conditions.RegionPopulationLow(context) and (conditions.TurnsSinceThreadLastAdvanced("1138_Campaign_Advice_Warning_Population_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1138_Campaign_Advice_Warning_Population_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1138_Campaign_Advice_Warning_Population_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1139_Campaign_Advice_Warning_Population_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionFoodShortageEmigration(context) and (conditions.TurnsSinceThreadLastAdvanced("1139_Campaign_Advice_Warning_Population_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1139_Campaign_Advice_Warning_Population_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1139_Campaign_Advice_Warning_Population_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1141_Campaign_Advice_Warning_Population_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionPopulationLow(context) and conditions.RegionTaxLevel("lower_classes", context) >= conditions.TaxLevel("tax_high", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1141_Campaign_Advice_Warning_Population_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1142a_Campaign_Advice_Trade_Route_Raided_Trigger ]]--

events.LandTradeRouteRaided[#events.LandTradeRouteRaided+1] =
function (context)
	if conditions.TradeRouteIsEnemy(context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1142_Campaign_Advice_Trade_Route_Raided_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1142b_Campaign_Advice_Trade_Route_Raided_Trigger ]]--

events.SeaTradeRouteRaided[#events.SeaTradeRouteRaided+1] =
function (context)
	if conditions.TradeRouteIsEnemy(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1142_Campaign_Advice_Trade_Route_Raided_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1143_Campaign_Advice_Trade_Route_Raided_Trigger ]]--

events.FactionRoundStart[#events.FactionRoundStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.SeaTradeRouteRaided(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1143_Campaign_Advice_Trade_Route_Raided_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1144_Campaign_Advice_Trade_Route_Raided_Trigger ]]--

events.FactionRoundStart[#events.FactionRoundStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LandTradeRouteRaided(context) then
		effect.advance_contextual_advice_thread("1144_Campaign_Advice_Trade_Route_Raided_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1146_Campaign_Advice_Trade_Theatres_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 6 and not conditions.CampaignName("episodic_3", context) and not conditions.CampaignName("episodic_2", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1146_Campaign_Advice_Trade_Theatres_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1147_Campaign_Advice_Trade_Theatres_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterInTheatre(-1133129049, context) or conditions.CharacterInTheatre(836795134, context) or conditions.CharacterInTheatre(1197997136, context) or conditions.CharacterInTheatre(2113354257, context)) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1147_Campaign_Advice_Trade_Theatres_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1148_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if not conditions.SlotIsLocal(context) and not conditions.SlotIsAlliedCampaign(context) and not conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-navy", context)) and conditions.PortBlockadedLocal(context) then
		effect.advance_contextual_advice_thread("1148_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1149_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and not conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-navy", context)) and conditions.PortBlockaded(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1149_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1150_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if not conditions.SlotIsLocal(context) and not conditions.SlotIsAlliedCampaign(context) and not conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-fish", context)) and conditions.PortBlockadedLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1150_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1151_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and not conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-fish", context)) and conditions.PortBlockaded(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1151_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1152_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if not conditions.SlotIsLocal(context) and not conditions.SlotIsAlliedCampaign(context) and not conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-trade", context)) and conditions.PortBlockadedLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1152_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1153_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and not conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-trade", context)) and conditions.PortBlockaded(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1153_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1154_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if not conditions.SlotIsLocal(context) and not conditions.SlotIsAlliedCampaign(context) and conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-trade", context)) and conditions.PortBlockadedLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1154_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1155_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.IsColony(context) and (conditions.SlotType("port", context) and conditions.IsBuildingInChain("port-trade", context)) and conditions.PortBlockaded(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1155_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1156_Campaign_Advice_Port_Occupied_Trigger ]]--

events.SlotOccupied[#events.SlotOccupied+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("port", context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1157_Campaign_Advice_Port_Occupied_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1157_Campaign_Advice_Port_Occupied_Trigger ]]--

events.SlotOccupied[#events.SlotOccupied+1] =
function (context)
	if not conditions.SlotIsLocal(context) and conditions.SlotType("port", context) and conditions.IsPlayerTurn(context) then
		effect.advance_contextual_advice_thread("1156_Campaign_Advice_Port_Occupied_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1158_Campaign_Advice_Build_Industrial_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("town", context) and not conditions.SlotType("port", context) and not conditions.IsBuildingInChain("industry-metal", context) and not conditions.IsBuildingInChain("industry-pottery", context) and not conditions.IsBuildingInChain("industry-textile", context) and not conditions.IsBuildingInChain("happiness", context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1158_Campaign_Advice_Build_Industrial_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1160_Campaign_Advice_Trade_Export_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsColony(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1160_Campaign_Advice_Trade_Export_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1161_Campaign_Advice_Trade_Export_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsColony(context) and not conditions.TradePortsAtMaxLevel(context) and conditions.RegionHasUnexportedTrade(context) and (conditions.TurnsSinceThreadLastAdvanced("1161_Campaign_Advice_Trade_Export_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1161_Campaign_Advice_Trade_Export_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1161_Campaign_Advice_Trade_Export_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1162_Campaign_Advice_Trade_Export_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsColony(context) and conditions.TradePortsAtMaxLevel(context) and not conditions.HasUnspecialisedPort(context) and conditions.RegionHasUnexportedTrade(context) and (conditions.TurnsSinceThreadLastAdvanced("1162_Campaign_Advice_Trade_Export_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1162_Campaign_Advice_Trade_Export_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1162_Campaign_Advice_Trade_Export_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1163_Campaign_Advice_Trade_Export_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsHomeRegion(context) and not conditions.TradePortsAtMaxLevel(context) and conditions.RegionHasUnexportedTrade(context) and (conditions.TurnsSinceThreadLastAdvanced("1163_Campaign_Advice_Trade_Export_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1163_Campaign_Advice_Trade_Export_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1163_Campaign_Advice_Trade_Export_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1164_Campaign_Advice_Trade_Export_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsHomeRegion(context) and conditions.TradePortsAtMaxLevel(context) and conditions.HasUnspecialisedPort(context) and conditions.RegionHasUnexportedTrade(context) and (conditions.TurnsSinceThreadLastAdvanced("1164_Campaign_Advice_Trade_Export_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1164_Campaign_Advice_Trade_Export_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1164_Campaign_Advice_Trade_Export_Trigger", 1, context)
		return true
	end
	return false
end

--[[ 1165_Campaign_Advice_Slow_Population_Growth_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionPopulationGrowthLow(context) and (conditions.TurnsSinceThreadLastAdvanced("1165_Campaign_Advice_Slow_Population_Growth_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1165_Campaign_Advice_Slow_Population_Growth_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1165_Campaign_Advice_Slow_Population_Growth_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1166_Campaign_Advice_Slow_Economic_Growth_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionEconomicGrowthLow(context) and (conditions.TurnsSinceThreadLastAdvanced("1166_Campaign_Advice_Slow_Economic_Growth_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1166_Campaign_Advice_Slow_Economic_Growth_Thread", context) == 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1166_Campaign_Advice_Slow_Economic_Growth_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1167_Campaign_Advice_Warning_Ally_Betrayal_Trigger ]]--

events.CharacterAttacksAlly[#events.CharacterAttacksAlly+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) then
		effect.advance_contextual_advice_thread("1167_Campaign_Advice_Warning_Ally_Betrayal_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1172_Campaign_Advice_Change_Governor_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionGovernorAttribute("management", context) < 3 and conditions.RegionRiots(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1172_Campaign_Advice_Change_Governor_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1175_Campaign_Advice_Change_Minister_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterTrait("C_Minister_Corrupt", context) >= 1 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1175_Campaign_Advice_Change_Minister_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1176_Campaign_Advice_Change_Commander_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("admiral", context) or conditions.CharacterType("General", context)) and (conditions.CharacterAttribute("command_land", context) == 0 or conditions.CharacterAttribute("command_sea", context) == 0) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1176_Campaign_Advice_Change_Commander_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1177_Campaign_Advice_Good_Stats_Character_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterAttribute("command_land", context) >= 5 or conditions.CharacterAttribute("command_sea", context) >= 5 or conditions.CharacterAttribute("management", context) >= 5 or conditions.CharacterAttribute("subterfuge", context) >= 5 or conditions.CharacterAttribute("research", context) >= 5) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1177_Campaign_Advice_Good_Stats_Character_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1179_Campaign_Advice_Move_Between_Theatres_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("travel_destinations", context) then
		effect.advance_contextual_advice_thread("1179_Campaign_Advice_Move_Between_Theatres_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1180_Campaign_Advice_Town_Region_Wealth_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 13 and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1180_Campaign_Advice_Town_Region_Wealth_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1181_Campaign_Advice_Devastation_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 13 then
		effect.advance_contextual_advice_thread("1181_Campaign_Advice_Devastation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1184_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 0 and conditions.TaxCollectionLimited(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1184_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1185_Campaign_Advice_Warning_Infrastructure_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 2000 and conditions.TaxCollectionLimited(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1185_Campaign_Advice_Warning_Infrastructure_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1186_Campaign_Advice_Post_Rebellion_Trigger ]]--

events.FactionGovernmentTypeChanged[#events.FactionGovernmentTypeChanged+1] =
function (context)
	if conditions.FactionIsLocal(context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1186_Campaign_Advice_Post_Rebellion_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1189_Campaign_Advice_UI_Help_Buttons_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 12 then
		effect.advance_contextual_advice_thread("1189_Campaign_Advice_UI_Help_Buttons_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1190_Campaign_Advice_UI_Help_Lists_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("entity_lists", context) then
		effect.advance_contextual_advice_thread("1190_Campaign_Advice_UI_Help_Lists_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1192_Campaign_Advice_UI_Help_Technologies_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1192_Campaign_Advice_UI_Help_Technologies_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1193_Campaign_Advice_UI_Help_Diplomacy_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("diplomatic_relations", context) then
		effect.advance_contextual_advice_thread("1193_Campaign_Advice_UI_Help_Diplomacy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1194_Campaign_Advice_UI_Help_Diplomacy_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("diplomacy_panel", context) then
		effect.advance_contextual_advice_thread("1194_Campaign_Advice_UI_Help_Diplomacy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1195_Campaign_Advice_UI_Help_Missions_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("missions", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1195_Campaign_Advice_UI_Help_Missions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1196_Campaign_Advice_UI_Help_Government_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("government_screens", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1196_Campaign_Advice_UI_Help_Government_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1197_Campaign_Advice_UI_Help_Prebattle_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_pre_battle", context) then
		effect.advance_contextual_advice_thread("1197_Campaign_Advice_UI_Help_Prebattle_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1198_Campaign_Advice_UI_Help_Postbattle_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_battle_results", context) then
		effect.advance_contextual_advice_thread("1198_Campaign_Advice_UI_Help_Postbattle_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1199_Campaign_Advice_UI_Help_Browser_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("building_browser", context) then
		effect.advance_contextual_advice_thread("1199_Campaign_Advice_UI_Help_Browser_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1200_Campaign_Advice_UI_Help_Regions_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and not conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1200_Campaign_Advice_UI_Help_Regions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1201_Campaign_Advice_UI_Help_Units_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("UnitInfoPopup", context) then
		effect.advance_contextual_advice_thread("1201_Campaign_Advice_UI_Help_Units_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1201a_Campaign_Advice_UI_Help_Units_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("CharacterInfoUnitInfoPopup", context) then
		effect.advance_contextual_advice_thread("1201_Campaign_Advice_UI_Help_Units_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1202_Campaign_Advice_UI_Help_Buildings_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("BuildingInfoPanel", context) then
		effect.advance_contextual_advice_thread("1202_Campaign_Advice_UI_Help_Buildings_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1203_Campaign_Advice_UI_Help_Characters_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("CharacterInfoPopup", context) then
		effect.advance_contextual_advice_thread("1203_Campaign_Advice_UI_Help_Characters_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1204_Campaign_Advice_UI_Help_Exchange_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("unit_exchange", context) then
		effect.advance_contextual_advice_thread("1204_Campaign_Advice_UI_Help_Exchange_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1206_Campaign_Advice_UI_Help_Agents_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("agent_options", context) then
		effect.advance_contextual_advice_thread("1206_Campaign_Advice_UI_Help_Agents_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1206a_Campaign_Advice_UI_Help_Agents_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("agent_action", context) then
		effect.advance_contextual_advice_thread("1206_Campaign_Advice_UI_Help_Agents_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1207_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("agent_options", context) then
		effect.advance_contextual_advice_thread("1207_Campaign_Advice_UI_Agent_Options_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1208_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("sabotage", context) then
		effect.advance_contextual_advice_thread("1208_Campaign_Advice_UI_Agent_Options_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1209_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("assassinate", context) then
		effect.advance_contextual_advice_thread("1209_Campaign_Advice_UI_Agent_Options_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1210_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("embed", context) then
		effect.advance_contextual_advice_thread("1210_Campaign_Advice_UI_Agent_Options_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1211_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("research", context) and conditions.CampaignName("natives", context) then
		effect.advance_contextual_advice_thread("1019_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1212_Campaign_Advice_UI_Help_Move_Theatres_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("travel_destinations", context) then
		effect.advance_contextual_advice_thread("1212_Campaign_Advice_UI_Help_Move_Theatres_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1213_Campaign_Advice_Digging_In_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.NoActionThisTurn(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) then
		effect.advance_contextual_advice_thread("1213_Campaign_Advice_Digging_In_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1215_Campaign_Advice_Right_Click_Details_Trigger ]]--

events.PanelAdviceRequestedCampaign[#events.PanelAdviceRequestedCampaign+1] =
function (context)
	if conditions.IsComponentType("TechnologyInfoPanel", context) then
		effect.advance_contextual_advice_thread("1215_Campaign_Advice_UI_Help_Details_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1216_Campaign_Advice_Interception_Attack_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("captain", context)) then
		effect.advance_contextual_advice_thread("1216_Campaign_Advice_Interception_Attack_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2189_Campaign_Advice_Flying_Columns_Trigger ]]--

events.DummyEvent[#events.DummyEvent+1] =
function (context)
	if n then
		return true
	end
	return false
end

--[[ 2001_Campaign_Advice_Iroquois_Initial_Turn_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.CampaignName("natives", context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("iroquoi_playable", context) then
		effect.advance_contextual_advice_thread("2001_Campaign_Advice_Iroquois_Initial_Turn_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2002_Campaign_Advice_Huron_Initial_Turn_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.CampaignName("natives", context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("huron_playable", context) then
		effect.advance_contextual_advice_thread("2002_Campaign_Advice_Huron_Initial_Turn_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2003_Campaign_Advice_Pueblo_Initial_Turn_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.CampaignName("natives", context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("pueblo_playable", context) then
		effect.advance_contextual_advice_thread("2003_Campaign_Advice_Pueblo_Initial_Turn_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2004_Campaign_Advice_Plains_Initial_Turn_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.CampaignName("natives", context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("plains_playable", context) then
		effect.advance_contextual_advice_thread("2004_Campaign_Advice_Plains_Initial_Turn_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2005_Campaign_Advice_Cherokee_Initial_Turn_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.CampaignName("natives", context) and conditions.TurnNumber(context) == 1 and conditions.FactionName("cherokee_playable", context) then
		effect.advance_contextual_advice_thread("2005_Campaign_Advice_Cherokee_Initial_Turn_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2006_Campaign_Advice_Scout_Agent_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("scout", context) then
		effect.advance_contextual_advice_thread("2006_Campaign_Advice_Scout_Agent_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2007_Campaign_Advice_Shaman_Agent_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("medicine_man", context) then
		effect.advance_contextual_advice_thread("2007_Campaign_Advice_Shaman_Agent_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2008_Campaign_Advice_Pioneer_Buildings_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.CampaignName("natives", context) and conditions.TurnNumber(context) == 2 then
		effect.advance_contextual_advice_thread("2008_Campaign_Advice_Pioneer_Buildings_Thread", 1, context)
		return true
	end
	return false
end

