--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Ancillary Declarations

--[[ Anc_Fake_Native_Chief_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInTheatre(1, context) and conditions.CharacterCultureType("european", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Fake_Native_Chief", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Captive_Wife_1_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterFoughtCulture("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Mistress_Captive_Wife_1", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Captive_Wife_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterFoughtCulture("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Mistress_Captive_Wife_2", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Slave_Escaped_Girl_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterFoughtCulture("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Slave_Escaped_Girl", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Slave_Escaped_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterFoughtCulture("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Slave_Escaped", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Combat_Tranny_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.OnAWarFooting(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Combat_Tranny", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Contrary_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Contrary", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Euro_Cap_Woman_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFoughtCulture("european", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Euro_Cap_Woman", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Euro_Captive_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFoughtCulture("european", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Euro_Captive", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Euro_Turncoat_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Euro_Turncoat", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Headdress_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.OnAWarFooting(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Headdress", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Horse_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CharacterTrait("C_Tribal_General_of_Cavalry", context) >= 1 and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Horse", 17,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Medicine_Bag_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.OnAWarFooting(context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Medicine_Bag", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Peace_Pipe_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and conditions.WarEndedCharacterFaction(context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Peace_Pipe", 17,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Stick_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterFactionName("plains_playable", context) and conditions.CharacterTrait("C_Tribal_General_Bloody", context) < 1 and conditions.CharacterTrait("C_Tribal_General_Plains_Coup", context) >= 1 and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Stick", 17,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Trade_Fur_Trigger ]]--

events.TradeRouteEstablished[#events.TradeRouteEstablished+1] =
function (context)
	if (conditions.FactionName("plains_playable", context) or conditions.FactionName("pueblo_playable", context) or conditions.FactionName("cherokee_playable", context) or conditions.FactionName("huron_playable", context) or conditions.FactionName("iroquoi_playable", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Trade_Fur", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Trade_Gentleman_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.OnAWarFooting(context) and conditions.CharacterFoughtCulture("european", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Trade_Gentleman", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Trade_Gold_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsFactionLeader(context) and conditions.CharacterBuildingConstructed("tribal_prospectors_camp", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Trade_Gold", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Trade_Guns_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and conditions.CharacterFactionHasTechType("industry_metal_natives_military_gun_dealing", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Trade_Guns", 17,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Trade_Missionary_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterBuildingConstructed("NA_pioneer_01", context) or conditions.CharacterBuildingConstructed("NA_pioneer_02", context) or conditions.CharacterBuildingConstructed("NA_pioneer_03", context)) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Trade_Missionary", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_Turncoat_Native_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.CharacterFoughtCulture("tribal", context) or conditions.CharacterFoughtCulture("tribal_playable", context)) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_Turncoat_Native", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_War_Axe_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.CharacterFoughtCulture("tribal", context) or conditions.CharacterFoughtCulture("tribal_playable", context)) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_War_Axe", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_War_Lance_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.CharacterFoughtCulture("tribal", context) or conditions.CharacterFoughtCulture("tribal_playable", context)) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_War_Lance", 8,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tribal_War_Rifle_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CharacterFoughtCulture("european", context) and conditions.CampaignName("natives", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Tribal_War_Rifle", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_African_Servant_02_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("governor_america", context) and conditions.CharacterBuildingConstructed("large_cotton_plantation", context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_African_Servant", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Air_Loom_Operator_2_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.CharacterInTheatre(2, context) and conditions.CharacterType("rake", context) and (conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("britain", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Air_Loom_Operator", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Air_Loom_Operator_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and not conditions.CharacterCultureType("tribal", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("france", context)) and conditions.CharacterTrait("C_Agent_Spy_Network", context) == 6 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Air_Loom_Operator", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Amazing_Wine_Cellar_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Amazing_Wine_Cellar", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Amusing_Cad_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Amusing_Cad", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_ADC_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterWonBattle(context) and conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and not conditions.CommanderFoughtInMelee(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_ADC", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_ADC_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and (conditions.CharacterTrait("C_General_Good_Field_Commander", context) >= 2 or conditions.CharacterTrait("C_General_Defender_Good", context) >= 2 or conditions.CharacterTrait("C_General_Attacker_Good", context) >= 2 or conditions.CharacterTrait("C_General_Ambush_Good", context) >= 2) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_ADC", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Aide_Nephew_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtHome(context) >= 2 and conditions.CharacterMPPercentageRemaining(context) >= 90 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Aide_Nephew", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Aide_Nephew_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Aide_Nephew", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Cleric_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.EnemyArmyGreaterCombatStrength(context) and not conditions.CharacterWasAttacker(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Cleric", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Drillmaster_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("land_normal", context) and conditions.CampaignPercentageOfUnitCategory("infantry", context) >= 40 and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Drillmaster", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Drillmaster_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTrait("C_General_Martinet", context) >= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Drillmaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_European_Turncoat_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("european", context) and conditions.CharacterWonBattle(context) and conditions.CharacterFoughtCulture("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_European_Turncoat", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Exploring_Officer_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsInEnemyLands(context) >= 1 and conditions.CharacterMPPercentageRemaining(context) <= 17 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Exploring_Officer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Exploring_Officer_Trigger ]]--

events.MovementPointsExhausted[#events.MovementPointsExhausted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_General_Scout", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Exploring_Officer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Galloper_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterWonBattle(context) and conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and conditions.CommanderFoughtInMelee(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Galloper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Galloper_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.CharacterTrait("C_General_of_Cavalry", context) >= 1 or conditions.CharacterTrait("C_General_Good_Field_Commander", context) >= 2) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Galloper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Hagiographer_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and (conditions.CharacterTurnsInEnemyLands(context) >= 1 or conditions.CharacterTurnsAtHome(context) >= 1) and conditions.CharacterWonBattle(context) and conditions.BattleResult("crushing_victory", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Hagiographer", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Hagiographer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and conditions.BattlesFought(8, context) and conditions.CharacterTrait("C_General_Good_Field_Commander", context) >= 3 and conditions.CharacterTrait("C_General_Press_Hero", context) >= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Hagiographer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Loyal_Sowar_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("middle_east", context)) and conditions.CharacterInTheatre(3, context) and conditions.CharacterWonBattle(context) and conditions.CommanderFoughtInMelee(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Loyal_Sowar", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Merc_Artilleryman_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("indian", context) or conditions.CharacterCultureType("middle_east", context)) and conditions.CampaignPercentageOfUnitCategory("artillery", context) >= 15 and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Merc_Artilleryman", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Merc_Cavalryman_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("indian", context) or conditions.CharacterCultureType("middle_east", context)) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 20 and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterWonBattle(context) and not conditions.CharacterWasAttacker(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Merc_Cavalryman", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Merc_Infantryman_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("indian", context) or conditions.CharacterCultureType("middle_east", context)) and not conditions.CharacterWasAttacker(context) and conditions.CampaignPercentageOfUnitCategory("infantry", context) >= 50 and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Merc_Infantryman", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Military_Artist_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTrait("C_General_Scout", context) >= 1 and conditions.CharacterTurnsInEnemyLands(context) >= 1 and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Military_Artist", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Military_Surveyor_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTrait("C_General_Scout", context) == 1 and conditions.CharacterTurnsInEnemyLands(context) >= 0 and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Military_Surveyor", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Ottoman_Turncoat_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("ottomans", context) and conditions.CharacterFoughtCulture("middle_east", context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("major_victory", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Ottoman_Turncoat", 17,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Pox_Doctor_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInBuildingType("bawdy_house", context) and conditions.CharacterMPPercentageRemaining(context) >= 50 and (conditions.CharacterTrait("C_Feck_Vice", context) >= 2 or conditions.CharacterTrait("C_General_Drunkard", context) > 2) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Pox_Doctor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Quartermaster_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsInEnemyLands(context) >= 3 and conditions.CharacterTrait("C_General_Martinet", context) <= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Quartermaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Surgeon_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterWonBattle(context) and conditions.CharacterTrait("C_General_Bloody", context) <= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Surgeon", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Tribal_Shaman_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal", context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Tribal_Shaman", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Waggonmaster_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsInEnemyLands(context) >= 1 and conditions.CharacterAttribute("command_land", context) >= 3 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Waggonmaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Artillery_Expert_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignPercentageOfUnitCategory("artillery", context) >= 20 and conditions.CharacterAttribute("command_land", context) <= 5 and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Artillery_Expert", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Assassin_Thug_3_Trigger ]]--

events.AssassinationAttemptSuccess[#events.AssassinationAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and conditions.CharacterInTheatre(3, context) and conditions.CharacterAttribute("subterfuge", context) >= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("indian", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Assassin_Thug", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Assassin_Thug_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("assassin", context) and conditions.CharacterCultureType("indian", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Assassin_Thug", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Barber_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtHome(context) >= 1 and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("indian", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Barber", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Blood_Brother_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and  conditions.CharacterCultureType("european", context) and conditions.CharacterFoughtCulture("tribal", context) and conditions.CharacterInTheatre(1, context) and conditions.CharacterTurnsInEnemyLands(context) >= 1 and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Blood_Brother", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Bodysnatcher_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("education", context) and conditions.ResearchCategory("philosophy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Bodysnatcher", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Boxer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInBuildingType("bawdy_house", context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Boxer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Hidalgo_Fop_2_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_sword", context) and (conditions.CharacterFactionName("spain", context) or conditions.CharacterFactionName("portugal", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Hidalgo_Fop", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Hidalgo_Fop_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("gentleman", context)) and (conditions.CharacterFactionName("spain", context) or conditions.CharacterFactionName("portugal", context)) and conditions.CharacterTrait("C_Gent_Duelling_Sword", context) >= 3 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Hidalgo_Fop", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Minx_2_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterInBuildingOfChain("happiness", context) and conditions.CharacterTrait("C_Feck_Vice", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Minx", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Minx_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("gentleman", context)) and conditions.CharacterCultureType("european", context) and (conditions.CharacterTrait("C_Gent_Duelling_Sword", context) >= 2 or conditions.CharacterTrait("C_Gent_Duelling_Pistol", context) >= 4) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Minx", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Pistols_2_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_pistols", context) and not conditions.CharacterFactionName("britain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Pistols", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Pistols_Manton_2_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_pistols", context) and conditions.CharacterFactionName("britain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Pistols_Manton", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_European_Captive_Ferang_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("admiral", context) or conditions.CharacterType("General", context)) and conditions.CharacterInBuildingOfChain("port-trade", context) and conditions.CharacterMPPercentageRemaining(context) >= 50 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("indian", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_European_Captive_Ferang", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_European_Captive_Ferang_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterCultureType("indian", context) and conditions.CharacterFoughtCulture("european", context) or (conditions.CharacterInTheatre(836795134, context) or conditions.CharacterInTheatre(-1133129049, context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_European_Captive_Ferang", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Foodtaster_2_Trigger ]]--

events.SufferSpyingAttempt[#events.SufferSpyingAttempt+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.CharacterAttribute("management", context) >= 3 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Foodtaster", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Garden_Hermit_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Garden_Hermit", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Architect_2_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("finance", context)) and conditions.CharacterBuildingConstructed("imperial_palace", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Architect", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Architect_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterTrait("C_Leader_Foreign_Tastes", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Architect", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Comptroller_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("finance", context)) and conditions.CharacterAttribute("management", context) <= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Comptroller", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Comptroller_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Minister_Miser", context) <= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Comptroller", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Controller_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterCultureType("tribal", context) and (conditions.CharacterTrait("C_Minister_Entertainer", context) >= 2 or conditions.CharacterTrait("C_Minister_Industrialist", context) >= 2) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Controller", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Crimper_2_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Crimper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Crimper_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Crimper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Cypher_2_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterTurnsInEnemyLands(context) >= 1 and conditions.FactionLeadersTrait("C_Leader_M", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Cypher", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Executioner_Nasty_2_Trigger ]]--

events.SufferSpyingAttempt[#events.SufferSpyingAttempt+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and (conditions.CharacterCultureType("indian", context) or conditions.CharacterCultureType("middle_east", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Executioner_Nasty", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Executioner_Nasty_Trigger ]]--

events.SufferSpyingAttempt[#events.SufferSpyingAttempt+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and not conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Executioner_Nasty", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Guardian_2_Trigger ]]--

events.SufferSpyingAttempt[#events.SufferSpyingAttempt+1] =
function (context)
	if conditions.IsFactionLeader(context) and conditions.CharacterAttribute("management", context) <= 5 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and (conditions.CharacterCultureType("indian", context) or conditions.CharacterCultureType("middle_east", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Guardian", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secret_Policeman_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("justice", context)) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secret_Policeman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secret_Policeman_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CharacterCultureType("tribal", context) and (conditions.CharacterTrait("C_Minister_Unjust", context) >= 2 or conditions.FactionLeadersTrait("C_Leader_Harsh_Ruler", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secret_Policeman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secretary_Efficient_2_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterHoldsPost(context) and conditions.FactionLeadersTrait("C_Leader_Merit", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secretary_Efficient", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secretary_Efficient_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterHoldsPost(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterCultureType("tribal", context) and (conditions.CharacterTrait("C_Minister_Fiscal_Genius", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Intellectual_Pretensions", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secretary_Efficient", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secretary_Gobby_2_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterHoldsPost(context) and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secretary_Gobby", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secretary_Gobby_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterHoldsPost(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterCultureType("tribal", context) and (conditions.FactionLeadersTrait("C_Leader_M", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Mr_Waverley", context) >= 1 or conditions.CharacterTrait("C_Minister_Corrupt", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secretary_Gobby", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Spymaster_2_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("head_of_government", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Spymaster", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Spymaster_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CharacterCultureType("tribal", context) and (conditions.FactionLeadersTrait("C_Leader_M", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Mr_Waverley", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Harsh_Ruler", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Agent_99", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Spymaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Thieftaker_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterCultureType("european", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("justice", context)) and conditions.CharacterAttribute("management", context) >= 3 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Thieftaker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Thieftaker_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Minister_Unjust", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Thieftaker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Vampire_Hunter_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterFactionName("austria", context) and conditions.FactionLeadersTrait("C_Personal_Piety", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Vampire_Hunter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Wrestler_2_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("justice", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not  conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Wrestler", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Great_Composer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterBuildingConstructed("grand_opera_house", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Great_Composer", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Grizzly_Adams_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterWonBattle(context) and conditions.CharacterInTheatre(1, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Grizzly_Adams", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Historian_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.FactionDestroyedByCharacterFaction(context) and conditions.IsFactionLeader(context) and (conditions.CharacterTrait("C_Leader_Dullard", context) < 1 or conditions.CharacterTrait("C_Leader_Enlightened_Despot", context) == 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Historian", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Astronomer_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.CharacterInBuildingOfChain("education", context) and conditions.CharacterTurnsAtHome(context) >= 1 and conditions.ResearchCategory("philosophy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not  conditions.CharacterCultureType("tribal", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Astronomer", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Loony_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("education", context) and conditions.CharacterTurnsAtHome(context) >= 1 and conditions.ResearchCategory("industry", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Loony", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Mill_Worker_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("education", context) and conditions.CharacterTurnsAtHome(context) >= 1 and conditions.ResearchCategory("industry", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Mill_Worker", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Mill_Worker_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Gent_Research_Industry", context) >= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Mill_Worker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Justice_Witness_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("indian", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Justice_Witness", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Justice_Witness_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterTrait("C_Minister_Unjust", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Harsh_Ruler", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("indian", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Justice_Witness", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Landscape_Gardener_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Leader_Philistine", context) < 1 and conditions.CharacterTrait("C_Leader_Uncouth", context) < 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Landscape_Gardener", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Madman_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterTrait("C_Gent_Science_Club", context) >= 1 and conditions.CharacterInBuildingOfChain("education", context) and conditions.CharacterTurnsAtHome(context) >= 1 and conditions.ResearchCategory("philosophy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Madman", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Madman_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Gent_Academic_Honours", context) >= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Madman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Master_of_Lunacy_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.CharacterCultureType("european", context) and conditions.FactionLeadersTrait("C_Leader_Intellectual_Pretensions", context) >= 2 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Master_of_Lunacy", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Merchant_Corn_Factor_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Minister_Trader", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Merchant_Corn_Factor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Military_Riding_Master_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and not conditions.CharacterFactionName("hungary", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Military_Riding_Master", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Actress_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("rake", context)) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Personal_Piety", context) < 1 and conditions.CharacterTrait("C_Rake_Im_A_Laydee", context) < 1 and conditions.CharacterInBuildingOfChain("happiness", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Actress", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Circassian_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("middle_east", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Circassian", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Common_Floozy_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Feck_Vice", context) >= 3 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Common_Floozy", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Gorgeous_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("minister", context) or conditions.CharacterType("gentleman", context)) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Gorgeous", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Molly_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("france", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_absolute_monarchy", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Molly", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Noble_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Noble", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Spycatcher_Lady_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Spycatcher_Lady", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Spymistress_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		return true
	end
	return false
end

--[[ Ancillary_Mystic_Mysterious_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CharacterCultureType("european", context) and conditions.CharacterFoughtCulture("middle_east", context) and not conditions.CharacterInTheatre(1, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mystic_Mysterious", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mystic_Useful_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("indian_missionary", context)) and not conditions.CharacterInTheatre(1, context) and not conditions.CharacterInTheatre(2, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mystic_Useful", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Cleric_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterCultureType("european", context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Cleric", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Flag_Lieutenant_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterWonBattle(context) and (conditions.CharacterTrait("C_Admiral_Defender_Good", context) >= 1 or conditions.CharacterTrait("C_Admiral_Attacker_Good", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Flag_Lieutenant", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Merc_Sea_Captain_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("indian", context) or conditions.CharacterCultureType("middle_east", context)) and conditions.CharacterFoughtCulture("european", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Merc_Sea_Captain", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Naval_Architect_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterCultureType("european", context) and conditions.FactionLeadersTrait("C_Leader_Navy_Buff", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Naval_Architect", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Naval_Surveryor_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterAttribute("management", context) > 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Naval_Surveryor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Prize_Agent_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterWonBattle(context) and conditions.CharacterCapturedEnemyShip(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Prize_Agent_Good", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Purser_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterTrait("C_Admiral_Slacker", context) < 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Purser", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Sailing_Master_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and (conditions.CharacterInTheatre(-1133129049, context) or conditions.CharacterInTheatre(836795134, context) or conditions.CharacterInTheatre(1197997136, context) or conditions.CharacterInTheatre(2113354257, context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Sailing_Master", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Surgeon_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("pyrrhic_victory", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Surgeon", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Watch_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterAttribute("command_sea", context) >= 4 and conditions.CharacterFactionHasTechType("military_navy_longitude_watch", context) and conditions.CharacterInBuildingOfChain("port-navy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Watch", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Numismatist_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and conditions.CharacterMinisterialPosition("finance", context) and (conditions.CharacterTrait("C_Minister_Corrupt", context) >= 1 or conditions.CharacterTrait("C_Minister_Miser", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Numismatist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Outstanding_Choirmaster_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Leader_Philistine", context) < 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Outstanding_Choirmaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Pamphleteer_Government_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Pamphleteer_Government", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Pamphleteer_Radical_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterTrait("C_Agent_Spy_Network", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Pamphleteer_Radical", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Personal_Physician_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTrait("C_General_Slacker", context) >= 1 and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Personal_Physician", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Pet_Monkey_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterInTheatre(3, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Pet_Monkey", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Pet_Sacred_Cow_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterFactionSubcultureType("sc_indian_hindu", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Pet_Sacred_Cow", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Pet_Tiger_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("indian", context) and (conditions.CharacterTrait("C_Leader_Mad", context) >= 1 or conditions.CharacterTrait("C_Leader_Harsh_Ruler", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Pet_Tiger", 1,  context)
		end
		effect.remove_ancillary("Ancillary_Pet_Sacred_Cow", context)
		return true
	end
	return false
end

--[[ Ancillary_Poet_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Leader_Intellectual_Pretensions", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Poet", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Police_Torturer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.InsurrectionCrushed(context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Police_Torturer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Presentation_Sword_1_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) and conditions.BattlesFought(8, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Presentation_Sword_1", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Presentation_Sword_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) and conditions.BattlesFought(8, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Presentation_Sword_2", 8,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Rake_Bawd_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterTrait("C_Agent_Spy_Network", context) >= 1 and conditions.CharacterInBuildingType("bawdy_house", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Rake_Bawd", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Rake_Professional_Second_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("gentleman", context)) and conditions.CharacterWonDuel(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Rake_Professional_Second", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Religion_Bishop_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Personal_Piety", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Religion_Bishop", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Religion_Imam_Learned_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("middle_east", context) and conditions.CharacterTrait("C_Personal_Piety", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Religion_Imam_Learned", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Religion_Imam_Rabblerouser_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("middle_east", context) and conditions.CharacterTrait("C_Personal_Piety", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Religion_Imam_Rabblerouser", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Religion_Methodist_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("united_states", context)) and conditions.CharacterTrait("C_Personal_Piety", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Religion_Methodist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Librarian_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.CharacterInBuildingOfChain("education", context) or conditions.CharacterTurnsAtHome(context) >= 1) and not conditions.CharacterCultureType("indian", context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Librarian", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Lunatic_Jack_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("education", context) and conditions.CharacterTurnsAtHome(context) >= 1 and conditions.ResearchCategory("philosophy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Lunatic_Jack", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Lunatic_Jack_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Lunatic_Jack", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Taxonomist_2_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("education", context) and conditions.CharacterTurnsAtHome(context) >= 1 and (conditions.ResearchType("industry_agriculture_advanced_irrigation", context) or conditions.ResearchType("industry_agriculture_common_land_enclosures", context) or conditions.ResearchType("industry_agriculture_four_field_crop_rotation", context) or conditions.ResearchType("industry_agriculture_improved_animal_husbandry", context) or conditions.ResearchType("industry_agriculture_seed_planting_drill", context) or conditions.ResearchType("industry_agriculture_selective_breeding", context) or conditions.ResearchType("industry_agriculture_steam-pumped_land_drainage", context) or conditions.ResearchType("industry_agriculture_threshing_machine", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Taxonomist", 2,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Tax_Farmer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and (conditions.CharacterTrait("C_Minister_Miser", context) >= 1 or conditions.CharacterAttribute("management", context) >= 3) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Tax_Farmer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Wife_Ambitious_2_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and (conditions.FactionLeadersTrait("C_Leader_Dullard", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Inbred", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Huntin_Shootin_Fishin", context) >= 1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("european", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Wife_Ambitious", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Wife_Unpleasant_2_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and (conditions.FactionLeadersTrait("C_Leader_Merit", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Mad", context) >= 1 or conditions.FactionLeadersAttribute("management", context) <= 3) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterIsLocalCampaign(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Wife_Unpleasant", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancilllary_Dead_Parrot_Pirate_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterType("pirate", context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Dead_Parrot_Pirate", 2,  context)
		end
		effect.remove_ancillary("Ancilllary_Pet_Parrot_Nasty", context)
		effect.remove_ancillary("Ancilllary_Pet_Parrot_Ordinary", context)
		effect.remove_ancillary("Ancilllary_Pet_Parrot_Pirate", context)
		return true
	end
	return false
end

--[[ Ancilllary_Dead_Parrot_Pirate_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterCultureType("european", context) and conditions.CharacterTrait("C_Admiral_Mad", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Dead_Parrot_Pirate", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancilllary_Pet_Parrot_Nasty_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and conditions.CharacterInTheatre(1, context) and conditions.CharacterCultureType("european", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Pet_Parrot_Nasty", 4,  context)
		end
		return true
	end
	return false
end

--[[ Ancilllary_Pet_Parrot_Ordinary_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterInTheatre(1, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterCultureType("european", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Pet_Parrot_Ordinary", 1,  context)
		end
		return true
	end
	return false
end

--[[ Government_Spying_Locksmith_2_Trigger ]]--

events.SufferSpyingAttempt[#events.SufferSpyingAttempt+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("head_of_government", context) or conditions.CharacterMinisterialPosition("justice", context)) and (conditions.FactionLeadersTrait("C_Leader_M", context) >= 1 or conditions.FactionLeadersTrait("C_Leader_Mr_Waverley", context) >=1) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Government_Spying_Locksmith", 4,  context)
		end
		return true
	end
	return false
end

