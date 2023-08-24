--[[
Automatically generated via export from C:/Users/chris_g\branches/shogun2/boshin/shogun2/raw_data/db
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"

-- Trigger declarations

--[[ S2_boshin_all_blokes_maimed_trigger ]]--

events.CharacterWoundedInAssassinationAttempt[#events.CharacterWoundedInAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("S2_boshin_general_protected", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_all_blokes_maimed", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_boshin_all_blokes_noodles_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtHome(context) >= 50 and conditions.CharacterStationaryForOneTurn(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_all_blokes_noodles", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_all_blokes_womaniser_agent_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("boshin_veteran", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CharacterInBuildingOfChain("bos_criminal", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_all_blokes_womaniser_agents", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_all_blokes_womaniser_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInBuildingOfChain("bos_criminal", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_all_blokes_womaniser", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_daimyo_cruel_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.InsurrectionCrushed(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_cruel", "agent", 1, 3, context)
		return true
	end
	return false
end

--[[ S2_boshin_daimyo_foreign_tastes_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_foreign_tastes", "agent", 1, 5, context)
		return true
	end
	return false
end

--[[ S2_boshin_daimyo_paranoia_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_paranoia", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_daimyo_peace_trigger ]]--

events.DaimyoSignsPeaceTreaty[#events.DaimyoSignsPeaceTreaty+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_peace", "agent", 1, 3, context)
		return true
	end
	return false
end

--[[ S2_boshin_daimyo_protected_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_protected", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_daimyo_unjust_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_unjust", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_geisha_created_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_geisha_new_tricks", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_geisha_maimed_trigger ]]--

events.CharacterWoundedInAssassinationAttempt[#events.CharacterWoundedInAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_geisha_maimed", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_boshin_geisha_new_tricks_trigger ]]--

events.CharacterSuccessfulSeduction[#events.CharacterSuccessfulSeduction+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_geisha_new_tricks", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_bloodthirsty_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfOwnKilled(context) >= 70 and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_bloodthirsty", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_brave_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CommanderFoughtInMelee(context) and not conditions.CharacterRouted(context) and not conditions.CharacterWithdrewFromBattle(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_brave", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_conservative_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_general_new_toys", context) and not conditions.CharacterHasTrait("S2_boshin_general_nostalgic", context) then
		effect.trait("S2_boshin_general_conservative", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_coward_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterRouted(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_coward", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_created_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_brave", "agent", 1, 10, context)
		effect.trait("S2_boshin_general_loyal", "agent", 1, 10, context)
		effect.trait("S2_boshin_general_ambition", "agent", 1, 10, context)
		effect.trait("S2_boshin_general_paranoia", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		effect.trait("S2_boshin_general_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_loyal_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHoldsPost(context) and not conditions.CharacterHasTrait("S2_boshin_general_ambition", context) and not conditions.CharacterWifeHasTrait("S2_boshin_wife_ambition", context) and not conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_loyal", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_mad_grief_trigger ]]--

events.CharacterRelativeKilled[#events.CharacterRelativeKilled+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_mad_grief", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_mad_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtSea(context) >= 30 and not conditions.CharacterHasTrait("S2_boshin_general_seasick", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_mad", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_new_toys_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_general_conservative", context) and not conditions.CharacterHasTrait("S2_boshin_general_nostalgic", context) then
		effect.trait("S2_boshin_general_new_toys", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_nocturnal_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		effect.trait("S2_boshin_general_nocturnal", "agent", 1, 30, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_nostalgic_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_general_new_toys", context) and not conditions.CharacterHasTrait("S2_boshin_general_conservative", context) then
		effect.trait("S2_boshin_general_nostalgic", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_paranoia_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("S2_boshin_general_protected", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_paranoia", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_protected_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("S2_boshin_general_paranoia", context) and not conditions.CharacterHasTrait("S2_boshin_all_blokes_maimed", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_protected", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_general_seasick_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtSea(context) >= 30 and not conditions.CharacterHasTrait("S2_boshin_general_mad", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_general_seasick", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_imperialist_daimyo_created_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_unjust", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_cruel", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_paranoia", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_uncouth", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_boshin_ishin_shishi_created_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_ishinshishi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_ishin_shishi_superpatriot", "agent", 1, 20, context)
		effect.trait("S2_boshin_ishin_shishi_chip", "agent", 1, 20, context)
		effect.trait("S2_boshin_ishin_shishi_cruel", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_ishin_shishi_persuasive_trigger ]]--

events.CharacterSuccessfulConvert[#events.CharacterSuccessfulConvert+1] =
function (context)
	if conditions.CharacterType("boshin_ishinshishi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_ishin_shishi_persuasive", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_shinobi_created_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_shinobi_xenophobe", "agent", 1, 20, context)
		effect.trait("S2_boshin_shinobi_vicious", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_shinobi_vicious_trigger ]]--

events.AssassinationAttemptCriticalSuccess[#events.AssassinationAttemptCriticalSuccess+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_shinobi_vicious", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_boshin_shinsengumi_bandit ]]--

events.CharacterSuccessfulConvert[#events.CharacterSuccessfulConvert+1] =
function (context)
	if conditions.CharacterType("boshin_shinsengumi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_shinsengumi_bandit", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_shinsengumi_cruel_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_shinsengumi", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_shinsengumi_noble", context) then
		effect.trait("S2_boshin_shinsengumi_cruel", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_shinsengumi_noble_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_shinsengumi", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_shinsengumi_cruel", context) then
		effect.trait("S2_boshin_shinsengumi_noble", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_shogunate_daimyo_created_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_daimyo_foreign_tastes", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_paranoia", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_cruel", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_uncouth", "agent", 1, 10, context)
		effect.trait("S2_boshin_daimyo_unjust", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_boshin_veteran_created_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_boshin_veteran_mercenary", "agent", 1, 20, context)
		effect.trait("S2_boshin_veteran_teetotal", "agent", 1, 5, context)
		effect.trait("S2_boshin_veteran_imperialist", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_veteran_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and false then
		effect.trait("S2_boshin_veteran_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_boshin_veteran_japanophile_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_veteran_japanophobe", context) then
		effect.trait("S2_boshin_veteran_japanophile", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_boshin_veteran_japanophobe_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasTrait("S2_boshin_veteran_japanophile", context) then
		effect.trait("S2_boshin_veteran_japanophobe", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_all_blokes_maimed_trigger ]]--

events.CharacterWoundedInAssassinationAttempt[#events.CharacterWoundedInAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("S2_trait_general_protected", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_all_blokes_maimed", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_all_blokes_noodles_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtHome(context) >= 50 and conditions.CharacterStationaryForOneTurn(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_all_blokes_noodles", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_all_blokes_womaniser_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInBuildingOfChain("SHO_Stealth", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_all_blokes_womaniser", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_created_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_daimyo_unjust", "agent", 1, 10, context)
		effect.trait("S2_trait_daimyo_foreign_tastes", "agent", 1, 10, context)
		effect.trait("S2_trait_daimyo_paranoia", "agent", 1, 10, context)
		effect.trait("S2_trait_daimyo_uncouth", "agent", 1, 10, context)
		effect.trait("S2_trait_daimyo_cruel", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_cruel_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_daimyo_cruel", "agent", 1, 3, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_foreign_tastes_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.IsDaimyo(context) and false then
		effect.trait("S2_trait_daimyo_foreign_tastes", "agent", 1, 5, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_paranoia_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.IsDaimyo(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_daimyo_paranoia", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_peace_trigger ]]--

events.DaimyoSignsPeaceTreaty[#events.DaimyoSignsPeaceTreaty+1] =
function (context)
	if conditions.IsDaimyo(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_daimyo_peace", "agent", 1, 3, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_protected_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.IsDaimyo(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_daimyo_protected", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_daimyo_unjust_trigger ]]--

events.CharacterBecomesDaimyo[#events.CharacterBecomesDaimyo+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_daimyo_unjust", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_geisha_maimed_trigger ]]--

events.CharacterWoundedInAssassinationAttempt[#events.CharacterWoundedInAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("geisha", context) then
		effect.trait("S2_trait_geisha_maimed", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_general_bloodthirsty_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfOwnKilled(context) >= 70 and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_bloodthirsty", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_general_brave_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CommanderFoughtInMelee(context) and not conditions.CharacterRouted(context) and not conditions.CharacterWithdrewFromBattle(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_brave", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_general_coward_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterRouted(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_coward", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_general_created_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_brave", "agent", 1, 10, context)
		effect.trait("S2_trait_general_mad", "agent", 1, 10, context)
		effect.trait("S2_trait_general_ambition", "agent", 1, 10, context)
		effect.trait("S2_trait_general_plunder", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_general_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInBuildingOfChain("SHO_Stealth", context) and not conditions.CharacterHoldsPost(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_general_ikko_fanatic_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("ikko_ikki", context) then
		effect.trait("S2_trait_general_brave", "agent", 1, 10, context)
		effect.trait("S2_trait_general_paranoia", "agent", 1, 10, context)
		effect.trait("S2_trait_general_bloodthirsty", "agent", 1, 10, context)
		effect.trait("S2_trait_general_ikko_fanatic", "agent", 2, 100, context)
		return true
	end
	return false
end

--[[ S2_trait_general_ikko_looter ]]--

events.CharacterLootedSettlement[#events.CharacterLootedSettlement+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("ikko_ikki", context) then
		effect.trait("S2_trait_general_ikko_looter", "agent", 1, 30, context)
		return true
	end
	return false
end

--[[ S2_trait_general_loyal_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHoldsPost(context) and not conditions.CharacterHasTrait("S2_trait_general_ambition", context) and not conditions.CharacterWifeHasTrait("S2_trait_wife_ambition", context) and not conditions.IsDaimyo(context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_loyal", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ S2_trait_general_mad_grief_trigger ]]--

events.CharacterRelativeKilled[#events.CharacterRelativeKilled+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_mad_grief", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_general_mad_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtSea(context) >= 30 and not conditions.CharacterHasTrait("S2_trait_general_seasick", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_mad", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_general_nocturnal_2_trigger ]]--

events.CharacterComesOfAge[#events.CharacterComesOfAge+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("iga_ninja", context) then
		effect.trait("S2_trait_general_nocturnal", "agent", 1, 100, context)
		return true
	end
	return false
end

--[[ S2_trait_general_nocturnal_3_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("iga_ninja", context) then
		effect.trait("S2_trait_general_nocturnal", "agent", 1, 100, context)
		return true
	end
	return false
end

--[[ S2_trait_general_nocturnal_trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		effect.trait("S2_trait_general_nocturnal", "agent", 1, 30, context)
		return true
	end
	return false
end

--[[ S2_trait_general_paranoia_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("S2_trait_general_protected", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_paranoia", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_general_plunder_trigger ]]--

events.CharacterLootedSettlement[#events.CharacterLootedSettlement+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("ikko_ikki", context) then
		effect.trait("S2_trait_general_plunder", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_general_protected_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("S2_trait_general_paranoia", context) and not conditions.CharacterHasTrait("S2_trait_all_blokes_maimed", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_protected", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_general_seasick_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsAtSea(context) >= 30 and not conditions.CharacterHasTrait("S2_trait_general_mad", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.trait("S2_trait_general_seasick", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_metsuke_corrupt_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("metsuke", context)  then
		effect.trait("S2_trait_missionary_corrupt", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_metsuke_cruel_1_trigger ]]--

events.CharacterSuccessfulHuntDown[#events.CharacterSuccessfulHuntDown+1] =
function (context)
	if conditions.CharacterType("metsuke", context)  then
		effect.trait("S2_trait_metsuke_cruel", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_metsuke_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("metsuke", context) and conditions.CharacterInBuildingOfChain("SHO_Stealth", context) then
		effect.trait("S2_trait_general_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_metsuke_paranoia_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if conditions.CharacterType("metsuke", context)  then
		effect.trait("S2_trait_metsuke_paranoia", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_missionary_corrupt_trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("missionary", context) then
		effect.trait("S2_trait_missionary_corrupt", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_missionary_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.CharacterInBuildingOfChain("SHO_Stealth", context) and not conditions.CharacterHasTrait("S2_trait_missionary_jaded", context) then
		effect.trait("S2_trait_missionary_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_missionary_jaded_trigger ]]--

events.ConvertAttemptFailure[#events.ConvertAttemptFailure+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CharacterHasTrait("S2_trait_missionary_drunkard", context) then
		effect.trait("S2_trait_missionary_jaded", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_monk_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and conditions.CharacterInBuildingOfChain("SHO_Stealth", context) then
		effect.trait("S2_trait_monk_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_monk_fighter_trigger ]]--

events.CharacterSurvivesAssassinationAttempt[#events.CharacterSurvivesAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context))  then
		effect.trait("S2_trait_monk_fighter", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_monk_unworldly_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and conditions.CharacterTurnsInEnemyLands(context) >= 30 then
		effect.trait("S2_trait_monk_unworldly", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ S2_trait_ninja_drunkard_trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("ninja", context) and conditions.CharacterInBuildingOfChain("SHO_Stealth", context) then
		effect.trait("S2_trait_ninja_drunkard", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ S2_trait_ninja_enjoys_it_trigger ]]--

events.AssassinationAttemptCriticalSuccess[#events.AssassinationAttemptCriticalSuccess+1] =
function (context)
	if conditions.CharacterType("ninja", context) then
		effect.trait("S2_trait_ninja_enjoys_it", "agent", 1, 20, context)
		return true
	end
	return false
end

--[[ S2_trait_wife_fertile_2_trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterIsFemale(context) and conditions.CharacterOlderThan(16, context) and not conditions.CharacterOlderThan(40, context) and conditions.CharacterWifeHasTrait("S2_trait_wife_fertile", context) and conditions.CharacterNumberOfChildren(context) > 1 and not conditions.CharacterHasTrait("S2_trait_wife_loyal", context) and not conditions.CharacterHasTrait("S2_trait_wife_beauty", context) and not conditions.CharacterHasTrait("S2_trait_wife_shrewish", context) and not conditions.CharacterHasTrait("S2_trait_wife_cunning", context) and not conditions.CharacterHasTrait("S2_trait_wife_moneylover", context) and not conditions.CharacterHasTrait("S2_trait_wife_fiscal_prudence", context) and not conditions.CharacterHasTrait("S2_trait_wife_diplomatic", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CharacterType("boshin_geisha", context) then
		effect.trait("S2_trait_wife_fertile", "agent", 2, 1, context)
		return true
	end
	return false
end

