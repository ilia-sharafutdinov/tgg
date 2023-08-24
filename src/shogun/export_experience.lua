--[[
Automatically generated via export from C:/Users/chris_g\branches/shogun2/boshin/shogun2/raw_data/db
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Experience Declarations

--[[ C_2nd_General_Defeat_Experience_2_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_2nd_General_Defeat_Experience_2_Trigger", 2, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Defeat_Experience_AI_2_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_2nd_General_Defeat_Experience_AI_2_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Defeat_Experience_AI_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and not conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_2nd_General_Defeat_Experience_AI_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Defeat_Experience_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and not conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_2nd_General_Defeat_Experience_Trigger", 1, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Victory_Experience_2_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_2nd_General_Victory_Experience_2_Trigger", 5, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Victory_Experience_AI_2_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and not conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_2nd_General_Victory_Experience_AI_2_Trigger", 10, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Victory_Experience_AI_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and not conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_2nd_General_Victory_Experience_AI_Trigger", 7, context)
		return true
	end
	return false
end

--[[ C_2nd_General_Victory_Experience_Trigger ]]--

events.CharacterParticipatedAsSecondaryGeneralInBattle[#events.CharacterParticipatedAsSecondaryGeneralInBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and not conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_2nd_General_Victory_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Agent_Assassination_Experience_Trigger ]]--

events.AssassinationAttemptSuccess[#events.AssassinationAttemptSuccess+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Assassination_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Agent_Assassination_Failure_Experience_Trigger ]]--

events.AssassinationAttemptFailure[#events.AssassinationAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Assassination_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Agent_Convert_Experience_Trigger ]]--

events.CharacterSuccessfulConvert[#events.CharacterSuccessfulConvert+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Convert_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Agent_Convert_Failure_Experience_Trigger ]]--

events.ConvertAttemptFailure[#events.ConvertAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Convert_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Agent_Demoralise_Experience_Trigger ]]--

events.CharacterSuccessfulDemoralise[#events.CharacterSuccessfulDemoralise+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Demoralise_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Agent_Demoralise_Failure_Experience_Trigger ]]--

events.DemoraliseAttemptFailure[#events.DemoraliseAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Demoralise_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Agent_Friendly_Action_Experience_Trigger ]]--

events.CharacterPerformsActionAgainstFriendlyTarget[#events.CharacterPerformsActionAgainstFriendlyTarget+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Friendly_Action_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Agent_Incite_Revolt_Experience_Trigger ]]--

events.CharacterSuccessfulInciteRevolt[#events.CharacterSuccessfulInciteRevolt+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Incite_Revolt_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Agent_Incite_Revolt_Failure_Experience_Trigger ]]--

events.InciteRevoltAttemptFailure[#events.InciteRevoltAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Incite_Revolt_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Agent_Seduction_Experience_Trigger ]]--

events.CharacterSuccessfulSeduction[#events.CharacterSuccessfulSeduction+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Seduction_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Agent_Seduction_Failure_Experience_Trigger ]]--

events.CharacterFailedSeduction[#events.CharacterFailedSeduction+1] =
function (context)
	if true then
		effect.add_character_experience("C_Agent_Seduction_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Geisha_Distract_Garrison_Experience_Trigger ]]--

events.CharacterSuccessfulDistractGarrison[#events.CharacterSuccessfulDistractGarrison+1] =
function (context)
	if true then
		effect.add_character_experience("C_Geisha_Distract_Garrison_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Geisha_Distract_Garrison_Failure_Experience_Trigger ]]--

events.CharacterFailedDistractGarrison[#events.CharacterFailedDistractGarrison+1] =
function (context)
	if true then
		effect.add_character_experience("C_Geisha_Distract_Garrison_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_General_Bombardment_Experience_AI_Trigger ]]--

events.CharacterSuccessfulBombardment[#events.CharacterSuccessfulBombardment+1] =
function (context)
	if true then
		effect.add_character_experience("C_General_Bombardment_Experience_AI_Trigger", 1, context)
		return true
	end
	return false
end

--[[ C_General_Bombardment_Experience_Trigger ]]--

events.CharacterSuccessfulBombardment[#events.CharacterSuccessfulBombardment+1] =
function (context)
	if true then
		effect.add_character_experience("C_General_Bombardment_Experience_Trigger", 1, context)
		return true
	end
	return false
end

--[[ C_General_Defeat_Experience_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_General_Defeat_Experience_2_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_General_Defeat_Experience_AI_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_General_Defeat_Experience_AI_2_Trigger", 5, context)
		return true
	end
	return false
end

--[[ C_General_Defeat_Experience_AI_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and not conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_General_Defeat_Experience_AI_Trigger", 5, context)
		return true
	end
	return false
end

--[[ C_General_Defeat_Experience_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and not conditions.CharacterWonBattle(context) and not conditions.BattleResult("crushing_defeat", context) then
		effect.add_character_experience("C_General_Defeat_Experience_Trigger", 5, context)
		return true
	end
	return false
end

--[[ C_General_Victory_Experience_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_General_Victory_Experience_2_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_General_Victory_Experience_AI_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_General_Victory_Experience_AI_2_Trigger", 20, context)
		return true
	end
	return false
end

--[[ C_General_Victory_Experience_AI_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if not conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and not conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_General_Victory_Experience_AI_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_General_Victory_Experience_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.FactionIsHuman(context) and conditions.CharacterWonBattle(context) and not conditions.BattleResult("heroic_victory", context) then
		effect.add_character_experience("C_General_Victory_Experience_Trigger", 10, context)
		return true
	end
	return false
end

--[[ C_Metsuke_Army_Bribe_Experience_Trigger ]]--

events.CharacterSuccessfulArmyBribe[#events.CharacterSuccessfulArmyBribe+1] =
function (context)
	if true then
		effect.add_character_experience("C_Metsuke_Army_Bribe_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Metsuke_Army_Bribe_Failure_Experience_Trigger ]]--

events.ArmyBribeAttemptFailure[#events.ArmyBribeAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Metsuke_Army_Bribe_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Metsuke_Hunt_Down_Experience_Trigger ]]--

events.CharacterSuccessfulHuntDown[#events.CharacterSuccessfulHuntDown+1] =
function (context)
	if true then
		effect.add_character_experience("C_Metsuke_Hunt_Down_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Metsuke_Hunt_Down_Failure_Experience_Trigger ]]--

events.HuntDownAttemptFailure[#events.HuntDownAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Metsuke_Hunt_Down_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Ninja_Army_Sabotage_Experience_Trigger ]]--

events.ArmySabotageAttemptSuccess[#events.ArmySabotageAttemptSuccess+1] =
function (context)
	if true then
		effect.add_character_experience("C_Ninja_Army_Sabotage_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Ninja_Army_Sabotage_Failure_Experience_Trigger ]]--

events.ArmySabotageAttemptFailure[#events.ArmySabotageAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Ninja_Army_Sabotage_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

--[[ C_Ninja_Sabotage_Experience_Trigger ]]--

events.SabotageAttemptSuccess[#events.SabotageAttemptSuccess+1] =
function (context)
	if true then
		effect.add_character_experience("C_Ninja_Sabotage_Experience_Trigger", 15, context)
		return true
	end
	return false
end

--[[ C_Ninja_Sabotage_Failure_Experience_Trigger ]]--

events.SabotageAttemptFailure[#events.SabotageAttemptFailure+1] =
function (context)
	if true then
		effect.add_character_experience("C_Ninja_Sabotage_Failure_Experience_Trigger", 3, context)
		return true
	end
	return false
end

