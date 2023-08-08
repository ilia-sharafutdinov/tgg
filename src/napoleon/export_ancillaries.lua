--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Ancillary Declarations

--[[ Anc_Agent_Provocateur_Trigger ]]--

events.CharacterEntersGarrison[#events.CharacterEntersGarrison+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context) or conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and conditions.CharacterInEnemyLands(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Agent_Provocateur", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Artist_Playwright_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.CharacterMinisterialPosition("navy", context) or conditions.CharacterMinisterialPosition("army", context)) and conditions.CharacterTrait("C_Honourable_Service", context) >= 2 and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Artist_Playwright", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Artist_Portrait_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and conditions.CharacterTrait("C_General_Press_Hero", context) == 3 then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Artist_Portrait", 2,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Balloonist_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("egy_french_republic", context) or conditions.CharacterFactionName("ita_french_republic", context) or conditions.CharacterFactionName("spa_france", context)) and conditions.CharacterAttribute("command_land", context) >= 6 then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Balloonist", 100,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Banker_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.CharacterMinisterialPosition("navy", context) or conditions.CharacterMinisterialPosition("army", context)) and conditions.FactionwideAncillaryTypeExists("Anc_Banker", context) == false and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Banker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Beau_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_absolute_monarchy", context) or conditions.FactionGovernmentType("gov_constitutional_monarchy", context)) and conditions.FactionwideAncillaryTypeExists("Anc_Beau", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Beau", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Biographer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.CharacterTrait("C_Leader_Intellectual_Pretensions", context) == 3 and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Biographer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Boatswain_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterTrait("C_Admiral_Good", context) >= 1 and conditions.FactionwideAncillaryTypeExists("Anc_Boatswain", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Boatswain", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Bodyguard_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterTrait("C_Personal_High_Personal_Security", context) >= 2 then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Bodyguard", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Book_Keeper_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Election_Agent", context) and not conditions.CharacterHasAncillary("Anc_Voter", context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Book_Keeper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Carpenter_Loony_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterHasTrait("C_Admiral_Mad", context) or conditions.CharacterHasTrait("C_Admiral_Drunkard", context)) and not conditions.CharacterHasAncillary("Anc_Carpenter", context) and not conditions.CharacterHasAncillary("Anc_Shipwright", context) and conditions.FactionwideAncillaryTypeExists("Anc_Carpenter_Loony", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Carpenter_Loony", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Carpenter_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterTrait("C_Admiral_Good", context) >= 2 and not conditions.CharacterHasAncillary("Anc_Carpenter_Loony", context) and not conditions.CharacterHasAncillary("Anc_Shipwright", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Carpenter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Chaplain_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterMinisterialPosition("finance", context) and (conditions.CharacterTrait("C_Minister_Reactionary", context) == 1 or conditions.CharacterTrait("C_Minister_Corrupt", context) >= 1 or conditions.CharacterTrait("C_Personal_Piety", context) == 3) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Chaplain", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Classical_Scholar_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.CharacterInRegion("eur_papal_state", context) or conditions.CharacterInRegion("eur_greece", context)) and conditions.FactionwideAncillaryTypeExists("Anc_Classical_Scholar", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Classical_Scholar", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Commissioner_of_Public_Safety_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.FactionGovernmentType("gov_republic", context) and conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("head_of_government", context) or conditions.CharacterMinisterialPosition("faction_leader", context)) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Commissioner_of_Public_Safety", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Cornet_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterFactionName("russia", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 and not conditions.CharacterHasAncillary("Anc_Favourite_Charger", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Cornet", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Cossack_Brave_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("russia", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 and (conditions.CharacterInRegion("eur_little_tatary", context) or conditions.CharacterInRegion("eur_moldova_bessarabia", context) or conditions.CharacterInRegion("eur_belgorod_guberniya", context) or conditions.CharacterInRegion("eur_kiev_guberniya", context) or conditions.CharacterInRegion("eur_volhynia_podolia", context)) and not conditions.CharacterHasAncillary("Anc_Cossack_Drunken", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Cossack_Brave", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Cossack_Drunken_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("russia", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 and (conditions.CharacterInRegion("eur_little_tatary", context) or conditions.CharacterInRegion("eur_moldova_bessarabia", context) or conditions.CharacterInRegion("eur_belgorod_guberniya", context) or conditions.CharacterInRegion("eur_kiev_guberniya", context) or conditions.CharacterInRegion("eur_volhynia_podolia", context)) and not conditions.CharacterHasAncillary("Anc_Cossack_Brave", context) and conditions.CharacterHasTrait("C_General_Drunkard", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Cossack_Drunken", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Decorated_Hero_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("minister", context)) and (conditions.CharacterMinisterialPosition("army", context) or conditions.CharacterTrait("C_General_Press_Hero", context) >= 2) and conditions.OnAWarFooting(context) and conditions.FactionwideAncillaryTypeExists("Anc_Decorated_Hero", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Decorated_Hero", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Dilletante_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and conditions.CharacterHoldsPost(context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and conditions.FactionwideAncillaryTypeExists("Anc_Dilletante_Trigger", context) == false and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Dilletante", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Doctor_Quack_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) and not conditions.CharacterWonDuel(context) and not conditions.CharacterHasAncillary("Anc_Physician_Euro", context) and conditions.CharacterDuelsFought(context) >= 3 and conditions.CharacterDuelsLost(context) >= 3 and conditions.FactionwideAncillaryTypeExists("Anc_Doctor_Quack", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Doctor_Quack", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Drummer_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("military1_conscription", context) and conditions.CharacterType("General", context) and not conditions.CharacterHasAncillary("Anc_Piper", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Drummer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Duellist_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) and conditions.CharacterWonDuel(context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Hidalgo_Fop", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Pistols", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Pistols_Manton", context) and conditions.CharacterDuelsFought(context) >= 3 then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Duellist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Election_Agent_Trigger ]]--

events.CharacterCandidateBecomesMinister[#events.CharacterCandidateBecomesMinister+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Book_Keeper", context) and not conditions.CharacterHasAncillary("Anc_Voter", context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Election_Agent", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Excise_Man_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("pTrade", context) and conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("finance", context) or conditions.CharacterMinisterialPosition("justice", context)) and not conditions.CharacterHasAncillary("Anc_Gov_Customs_Officer", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Excise_Man", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Factor_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("economy2_joint_stock_company", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and not conditions.CharacterHasAncillary("Anc_Gov_Trader_Merchant", context) and not conditions.CharacterHasAncillary("Anc_Gov_Trader_Ottoman", context) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Factor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Fake_Emir_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and (conditions.CharacterHasTrait("C_Leader_Mad", context) or conditions.CharacterHasTrait("C_Leader_Philistine", context) or conditions.CharacterHasTrait("C_Leader_Foreign_Tastes", context)) and not conditions.CharacterHasAncillary("Anc_Fake_Native_Chief", context) and not conditions.CharacterHasAncillary("Ancillary_Mystic_Mysterious", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Fake_Emir", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Fake_Native_Chief_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and (conditions.CharacterHasTrait("C_Leader_Mad", context) or conditions.CharacterHasTrait("C_Leader_Philistine", context) or conditions.CharacterHasTrait("C_Leader_Foreign_Tastes", context)) and not conditions.CharacterHasAncillary("Anc_Fake_Emir", context) and not conditions.CharacterHasAncillary("Ancillary_Mystic_Mysterious", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Fake_Native_Chief", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Family_Cousin_1_Trigger ]]--

events.CharacterEmbarksNavy[#events.CharacterEmbarksNavy+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Family_Cousin_2", context) and not conditions.CharacterHasAncillary("Ancillary_Army_Aide_Nephew", context) and conditions.FactionwideAncillaryTypeExists("Anc_Family_Cousin_1", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Family_Cousin_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Family_Cousin_2_Trigger ]]--

events.CharacterEmbarksNavy[#events.CharacterEmbarksNavy+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Family_Cousin_1", context) and not conditions.CharacterHasAncillary("Ancillary_Army_Aide_Nephew", context) and conditions.FactionwideAncillaryTypeExists("Anc_Family_Cousin_2", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Family_Cousin_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Family_Retainer_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Family_Retainer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Family_Son_In_Law_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterAttribute("management", context) >= 8 and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and conditions.FactionwideAncillaryTypeExists("Anc_Family_Son_In_Law", context) == false and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Family_Son_In_Law", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Favourite_Charger_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 and not conditions.CharacterHasAncillary("Anc_Cornet", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Favourite_Charger", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Fiddler_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context))  and conditions.CharacterHasTrait("C_General_Bloody", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Fiddler", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Financier_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterTrait("C_Minister_Corrupt", context) == 3 and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and conditions.FactionwideAncillaryTypeExists("Anc_Financier", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Financier", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gen_Supply_Agent_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tSupply1_supply_post", context) and conditions.CharacterType("General", context) and not conditions.CharacterHasAncillary("Ancillary_Army_Quartermaster", context) and not conditions.CharacterHasAncillary("Ancillary_Army_Waggonmaster", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gen_Supply_Agent", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Cryptographer_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CharacterHasAncillary("Ancillary_Government_Cypher", context) and conditions.CharacterInOwnFactionLands(context) and conditions.FactionwideAncillaryTypeExists("Anc_Gov_Cryptographer", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Cryptographer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Customs_Officer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("pTrade", context) and conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("finance", context) or conditions.CharacterMinisterialPosition("justice", context)) and not conditions.CharacterHasAncillary("Anc_Excise_Man", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Customs_Officer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Gardener_Royal_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("rFarm3_great_estates", context) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.WorldwideAncillaryTypeExists("Anc_Gov_Gardener_Royal", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Gardener_Royal", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Metropolitan_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterFactionName("russia", context) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and not conditions.CharacterFactionHasTechType("admin4_dialectics", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Metropolitan", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Scandal_Writer_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("economy1_poverty_control_laws", context) and conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("justice", context) or conditions.CharacterMinisterialPosition("head_of_government", context)) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CharacterHasAncillary("Ancillary_Pamphleteer_Government", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and conditions.FactionwideAncillaryTypeExists("Anc_Gov_Scandal_Writer", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Scandal_Writer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Taxman_Crook_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("admin1_national_debt", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Gov_Taxman_Honest", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Taxman_Crook", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Taxman_Honest_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("admin1_national_debt", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and not conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Gov_Taxman_Crook", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Gov_Taxman_Honest", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Thieftaker_Honest_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("sAdmin2_magistrate", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and conditions.FactionwideAncillaryTypeExists("Anc_Gov_Thieftaker", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Thieftaker_Honest", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Trader_Merchant_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("pTrade", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and not conditions.CharacterHasAncillary("Anc_Factor", context) and not conditions.CharacterHasAncillary("Anc_Gov_Trader_Ottoman", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Gov_Trader_Merchant", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Trader_Monopolist_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("economy3_limited_liability_company", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Trader_Monopolist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Trader_Ottoman_Trigger ]]--

events.TradeRouteEstablished[#events.TradeRouteEstablished+1] =
function (context)
	if (conditions.FactionName("ottomans", context) or conditions.FactionName("egy_ottomans", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Trader_Ottoman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gov_Trader_Stock_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("economy2_joint_stock_company", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gov_Trader_Stock", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Governess_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsTheatreGovernor(context) and conditions.FactionwideAncillaryTypeExists("Anc_Governess", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Governess", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Grand_Tourist_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterAttribute("research", context) >= 8 and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterFactionHasTechType("admin5_passports", context) and conditions.CharacterFactionHasTechType("admin5_national_propaganda", context) and conditions.CharacterFactionHasTechType("military5_rockets", context) and conditions.CharacterFactionHasTechType("military5_percussion_cap", context) and conditions.CharacterFactionHasTechType("military5_rifled_cannons", context) and conditions.CharacterFactionHasTechType("military5_iron_plating", context) and conditions.CharacterFactionHasTechType("economy3_screw_propeller", context) and conditions.CharacterFactionHasTechType("economy3_interchangeable_parts", context) and conditions.CharacterFactionHasTechType("economy3_limited_liability_company", context) and conditions.CharacterFactionHasTechType("economy3_steam_locomotive", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Grand_Tourist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Grizzled_Old_Sergeant_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.BattlesFought(context) >= 15 and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.FactionwideAncillaryTypeExists("Anc_Grizzled_Old_Sergeant", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Grizzled_Old_Sergeant", 2,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Gunsmith_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_pistols", context) and conditions.CharacterAttribute("duelling_pistols", context) >= 3 then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Gunsmith", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Hack_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("egy_britain", context) or conditions.CharacterFactionName("spa_britain", context)) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterFactionHasTechType("admin3_trade_unions", context) and not conditions.CharacterFactionHasTechType("admin5_national_propaganda", context) and not conditions.CharacterHasAncillary("Anc_Journalist_Honest", context) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.IsTheatreGovernor(context) and not conditions.FactionwideAncillaryTypeExists("Anc_Hack", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Hack", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Heroic_Saviour_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CharacterHasAncillary("Anc_Highland_Servant", context) and conditions.FactionwideAncillaryTypeExists("Anc_Heroic_Saviour", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Heroic_Saviour", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Highland_Servant_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context) or conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterInEnemyLands(context) and not conditions.CharacterHasAncillary("Anc_Heroic_Saviour", context) and conditions.FactionwideAncillaryTypeExists("Anc_Highland_Servant", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Highland_Servant", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Highlander_Trigger ]]--

events.DuelDemanded[#events.DuelDemanded+1] =
function (context)
	if (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) and conditions.CharacterInEnemyLands(context) and not conditions.CharacterHasAncillary("Anc_Highland_Servant", context) and conditions.WorldwideAncillaryTypeExists("Anc_Highlander", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Highlander", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Impoverished_Nephew_Trigger ]]--

events.CharacterEmbarksNavy[#events.CharacterEmbarksNavy+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.FactionwideAncillaryTypeExists("Anc_Impoverished_Nephew", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Impoverished_Nephew", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Instrument_Maker_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("economy2_plateways", context) or conditions.ResearchType("economy2_steam_engine", context) or conditions.ResearchType("economy3_interchangeable_parts", context) or conditions.ResearchType("economy3_screw_propeller", context) or conditions.ResearchType("economy3_steam_locomotive", context) or conditions.ResearchType("economy3_steam_ship_propulsion", context)) and conditions.CharacterType("gentleman", context) and not conditions.CharacterHasAncillary("Ancillary_Inventive_Genius_Mill_Worker", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Instrument_Maker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Alchemist_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("economy2_plateways", context) or conditions.ResearchType("economy2_steam_engine", context) or conditions.ResearchType("economy3_interchangeable_parts", context) or conditions.ResearchType("economy3_screw_propeller", context) or conditions.ResearchType("economy3_steam_locomotive", context) or conditions.ResearchType("economy3_steam_ship_propulsion", context)) and conditions.CharacterType("Eastern_Scholar", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Alchemist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Alim_Trigger ]]--

events.CharacterDisembarksNavy[#events.CharacterDisembarksNavy+1] =
function (context)
	if conditions.CharacterType("Eastern_Scholar", context) and not conditions.CharacterHasAncillary("Anc_Islam_Astronomer", context) and not conditions.CharacterHasAncillary("Anc_Islam_Brahmin", context) and not conditions.CharacterInOwnFactionLands(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Alim", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Astronomer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation3_enlightened_university", context) and conditions.CharacterType("Eastern_Scholar", context) and not conditions.CharacterHasAncillary("Anc_Islam_Brahmin", context) and not conditions.CharacterHasAncillary("Anc_Islam_Alim", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Astronomer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Brahmin_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation3_enlightened_university", context) and conditions.CharacterType("Eastern_Scholar", context) and not conditions.CharacterHasAncillary("Anc_Islam_Astronomer", context) and not conditions.CharacterHasAncillary("Anc_Islam_Alim", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Brahmin", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Convert_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("admiral", context) or conditions.CharacterType("General", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and (conditions.CharacterFoughtCulture("european", context) or conditions.CharacterFoughtCulture("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Islam_Fighter", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Convert", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Corsair_Trigger ]]--

events.CharacterBlockadedPort[#events.CharacterBlockadedPort+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Corsair", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Darwis_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInEnemyLands(context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and not conditions.CharacterHasAncillary("Anc_Islam_Preacher", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Darwis", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Fighter_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("admiral", context) or conditions.CharacterType("General", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and (conditions.CharacterFoughtCulture("european", context) or conditions.CharacterFoughtCulture("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Islam_Convert", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Fighter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Heretic_Trigger ]]--

events.FactionTurnEnd[#events.FactionTurnEnd+1] =
function (context)
	if conditions.FactionWarWeariness(context) and (conditions.FactionName("ottomans", context) or conditions.FactionName("egy_ottomans", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Heretic", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Judge_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("sAdmin5_court_supreme", context) and conditions.CharacterType("minister", context) and not conditions.CharacterHasAncillary("Anc_Islam_Legal_Scholar_1", context) and not conditions.CharacterHasAncillary("Anc_Islam_Legal_Scholar_2", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Judge", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Legal_Scholar_1_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("sAdmin5_court_supreme", context) and conditions.CharacterType("minister", context) and not conditions.CharacterHasAncillary("Anc_Islam_Judge", context) and not conditions.CharacterHasAncillary("Anc_Islam_Legal_Scholar_2", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Legal_Scholar_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Legal_Scholar_2_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("sAdmin5_court_supreme", context) and conditions.CharacterType("minister", context) and not conditions.CharacterHasAncillary("Anc_Islam_Judge", context) and not conditions.CharacterHasAncillary("Anc_Islam_Legal_Scholar_1", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Legal_Scholar_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Physician_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("Eastern_Scholar", context) or conditions.CharacterType("assassin", context)) and conditions.CharacterHasTrait("C_Personal_Sickly", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Physician", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Pious_Man_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CharacterHasAncillary("Anc_Islam_Protector", context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Pious_Man", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Preacher_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInEnemyLands(context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and not conditions.CharacterHasAncillary("Anc_Islam_Darwis", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Preacher", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Protector_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CharacterHasAncillary("Anc_Islam_Pious_Man", context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Protector", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Scholar_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation2_university", context) and conditions.CharacterType("Eastern_Scholar", context) and not conditions.CharacterHasAncillary("Anc_Islam_Sufi", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Scholar", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Sufi_Teacher_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation2_university", context) and conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Islam_Sufi_Teacher", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Sufi_Teacher", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islam_Sufi_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation2_university", context) and conditions.CharacterType("Eastern_Scholar", context) and not conditions.CharacterHasAncillary("Anc_Islam_Scholar", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islam_Sufi", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Islamic_Turncoat_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("admiral", context) or conditions.CharacterType("General", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.CharacterFoughtCulture("middle_east", context) or conditions.CharacterFoughtCulture("egy_middle_east", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Islamic_Turncoat", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Journalist_Honest_Trigger ]]--

events.CharacterCandidateBecomesMinister[#events.CharacterCandidateBecomesMinister+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHasTrait("C_Minister_Radical", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Journalist_Honest", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Judge_Bent_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.InsurrectionCrushed(context) or conditions.CharacterHasTrait("C_Minister_Reactionary", context)) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Judge_Bent", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Judge_Honest_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.CharacterHasTrait("C_Minister_Radical", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Judge_Honest", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Justice_of_the_Peace_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CharacterHasTrait("C_Minister_Radical", context) and not conditions.CharacterHasTrait("C_Minister_Reactionary", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Justice_of_the_Peace", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Lapdog_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.CharacterHasTrait("C_Minister_Upright", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Minion", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Lapdog", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Lawyer_Bent_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("economy1_poverty_control_laws", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterHasTrait("C_Minister_Reactionary", context) or conditions.CharacterHasTrait("C_Minister_Corrupt", context)) and not conditions.CharacterHasAncillary("Anc_Lawyer_Honest", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Lawyer_Bent", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Lawyer_Honest_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterFactionHasTechType("admin3_trade_unions", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterHasTrait("C_Minister_Radical", context) or conditions.CharacterHasTrait("C_Minister_Upright", context)) and not conditions.CharacterHasAncillary("Anc_Lawyer_Bent", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Lawyer_Honest", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Lawyer_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("admin3_abolition_of_slavery", context) or conditions.ResearchType("admin3_code_napoleon", context) or conditions.ResearchType("admin3_trade_unions", context) or conditions.ResearchType("economy1_division_of_labour", context)) and conditions.CharacterType("gentleman", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Lawyer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Magic_Cucumber_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterHasTrait("C_Admiral_Mad", context) and conditions.CharacterTurnsAtSea(context) >= 20 and conditions.WorldwideAncillaryTypeExists("Anc_Magic_Cucumber", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Magic_Cucumber", 50,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Manufacturing_Genius_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("tFactory", context) and conditions.CharacterType("gentleman", context) and conditions.CharacterFactionHasTechType("economy2_steam_engine", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Manufacturing_Genius", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Master_Gunner_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterFactionHasTechType("military4_uniform_armament", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Master_Gunner", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Master_of_the_Dockyards_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("pNavy3_steam_drydock", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterTrait("C_Minister_Navy_Good", context) >= 2 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Master_of_the_Dockyards", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Master_of_the_Hunt_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("rHorse3_equestrian_estate", context) and conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and conditions.CharacterHasTrait("C_Minister_Reactionary", context) and not conditions.CharacterHasAncillary("Anc_Master_of_the_Stables", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsTheatreGovernor(context) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_absolute_monarchy", context)) and conditions.FactionwideAncillaryTypeExists("Anc_Master_of_the_Hunt", context) == false and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Master_of_the_Hunt", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Master_of_the_Stables_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("rHorse3_equestrian_estate", context) and conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and conditions.CharacterHasTrait("C_Minister_Reactionary", context) and not conditions.CharacterHasAncillary("Anc_Master_of_the_Hunt", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsTheatreGovernor(context) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_absolute_monarchy", context)) and conditions.FactionwideAncillaryTypeExists("Anc_Master_of_the_Stables", context) == false and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Master_of_the_Stables", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Military_Engineer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("sRoads2_improved_roads", context) or conditions.CharacterBuildingConstructed("sRoads3_tarmac_roads", context) and conditions.CharacterType("General", context) and not conditions.CharacterHasTrait("C_General_Siege_Attack_Bad", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Military_Engineer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Military_Expert_NOT_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.OnAWarFooting(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Military_Expert_NOT", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Military_Secretary_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("sArmy", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Military_Secretary", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Corrupt_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Minion", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Corrupt", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Corrupt", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Court_1_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Minion", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Court_1", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Court_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Indiscreet_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Minion", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Indiscreet", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Indiscreet", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Minion_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInEnemyLands(context) and conditions.CharacterTurnsInEnemyLands(context) >= 15 and conditions.BattlesFought(context) >= 10 and not conditions.CharacterHasAncillary("Anc_Mistress_Officers_Wife", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Strumpet", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Minion", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Officers_Wife_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInEnemyLands(context) and conditions.CharacterTurnsInEnemyLands(context) >= 15 and conditions.BattlesFought(context) >= 10 and not conditions.CharacterHasAncillary("Anc_Mistress_Strumpet", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Minion", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Officers_Wife", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Strumpet_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInEnemyLands(context) and conditions.CharacterTurnsInEnemyLands(context) >= 15 and conditions.BattlesFought(context) >= 10 and not conditions.CharacterHasAncillary("Anc_Mistress_Minion", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Officers_Wife", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Strumpet", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mistress_Waif_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Feck_Vice", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mistress_Waif", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mohock_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.InSettlement(context) and conditions.NoActionThisTurn(context) and conditions.CharacterTrait("C_Feck_Vice", context) >= 2 and conditions.CharacterHasTrait("C_Rake_Assassin_Good", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mohock", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Moonstone_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFoughtCulture("european", context) or conditions.CharacterFoughtCulture("egy_european", context)) and conditions.WorldwideAncillaryTypeExists("Anc_Moonstone", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Moonstone", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Mother_Abbess_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and not conditions.CharacterHasAncillary("Anc_Nobleman_Louche", context) and not conditions.CharacterHasAncillary("Anc_Priest_Defrocked", context) and not conditions.CharacterHasAncillary("Anc_Priest_Disgraced", context) and not conditions.CharacterHasAncillary("Anc_Rakehell", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Mother_Abbess", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Natural_Philosopher_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.ResearchType("admin4_dialectics", context) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Natural_Philosopher", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Naval_Secretary_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterBuildingConstructed("pNavy2_dockyard", context) and not conditions.CharacterHasAncillary("Anc_Naval_Secretary", context) and not conditions.CharacterHasAncillary("Anc_Shipwright", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Naval_Secretary", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Naval_Surveyor_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterBuildingConstructed("pNavy2_dockyard", context) and not conditions.CharacterHasAncillary("Ancillary_Navy_Naval_Surveryor", context) and not conditions.CharacterHasAncillary("Anc_Shipwright", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Naval_Surveyor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Navigator_Trigger ]]--

events.MovementPointsExhausted[#events.MovementPointsExhausted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterTurnsAtSea(context) >= 15 and not conditions.CharacterHasAncillary("Anc_Pilot", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Navigator", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Navy_Seaman_Able_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionHasTechType("military2_top_gallants", context) and conditions.CharacterFactionHasTechType("military1_improved_coppering", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Navy_Sailing_Master", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Navy_Seaman_Able", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Nobleman_Debauched_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.InSettlement(context) or conditions.InPort(context)) and (conditions.CharacterInRegion("ita_alpes_maritimes", context) or conditions.CharacterInRegion("ita_ancona", context) or conditions.CharacterInRegion("eur_northern_italy", context) or conditions.CharacterInRegion("eur_papal_state", context) or conditions.CharacterInRegion("eur_piemont_liguria", context) or conditions.CharacterInRegion("eur_sicily", context) or conditions.CharacterInRegion("eur_venetia", context) or conditions.CharacterInRegion("eur_naples", context) or conditions.CharacterInRegion("eur_greece", context) or conditions.CharacterInRegion("eur_corsica", context)) and not conditions.CharacterHasAncillary("Anc_Nobleman_Exile", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Nobleman_Debauched", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Nobleman_Exile_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.InSettlement(context) or conditions.InPort(context)) and not conditions.CharacterHasAncillary("Anc_Nobleman_Debauched", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Nobleman_Exile", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Nobleman_Louche_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and not conditions.CharacterHasAncillary("Anc_Mother_Abbess", context) and not conditions.CharacterHasAncillary("Anc_Priest_Defrocked", context) and not conditions.CharacterHasAncillary("Anc_Priest_Disgraced", context) and not conditions.CharacterHasAncillary("Anc_Rakehell", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Nobleman_Louche", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Austria_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("austria", context) or conditions.CharacterFactionName("ita_austrian_alliance", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Austria", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Denmark_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("denmark", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Denmark", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_England_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("egy_britain", context) or conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) and not conditions.CharacterHasAncillary("Anc_Order_Scotland", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_England", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_France_1_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("france", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) then
		if conditions.DateInRange(1700, 1796, context) then 
			effect.ancillary("Anc_Order_France_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_France_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("spa_france", context) or conditions.CharacterFactionName("ita_french_republic", context) or conditions.CharacterFactionName("egy_french_republic", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) and (conditions.FactionGovernmentType("gov_empire", context) or conditions.FactionGovernmentType("gov_republic", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_France_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Holland_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("united_netherlands", context) or conditions.CharacterFactionName("netherlands", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Holland", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Ottoman_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("egy_ottomans", context) or conditions.CharacterFactionName("ottomans", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Ottoman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Poland_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("poland_lithuania", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Poland", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Prussia_1_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("prussia", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) and conditions.DateAndWeekInRange(0,1805,10,1813, context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Prussia_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Prussia_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("prussia", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) and conditions.DateAndWeekInRange(11,1813,47,1815, context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Prussia_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Russia_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("russia", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Russia", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Scotland_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("egy_britain", context) or conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("scotland", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) and not conditions.CharacterHasAncillary("Anc_Order_England", context) and not conditions.CharacterSurname("Wellesley", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Scotland", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Spain_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterFactionName("spain", context) or conditions.CharacterFactionName("spa_spain", context)) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Spain", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Sweden_1_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and conditions.CharacterFactionName("sweden", context) and conditions.BattlesFought(context) >= 20 and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Sweden_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Sweden_2_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("justice", context) or conditions.CharacterMinisterialPosition("head_of_government", context)) and conditions.CharacterFactionName("sweden", context) and conditions.CharacterBuildingConstructed("sAdmin5_court_supreme", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Sweden_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Order_Sweden_3_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterFactionName("sweden", context) and conditions.CharacterFactionHasTechType("admin5_passports", context) and conditions.CharacterFactionHasTechType("admin5_national_propaganda", context) and conditions.CharacterFactionHasTechType("military5_rockets", context) and conditions.CharacterFactionHasTechType("military5_percussion_cap", context) and conditions.CharacterFactionHasTechType("military5_rifled_cannons", context) and conditions.CharacterFactionHasTechType("military5_iron_plating", context) and conditions.CharacterFactionHasTechType("economy3_screw_propeller", context) and conditions.CharacterFactionHasTechType("economy3_interchangeable_parts", context) and conditions.CharacterFactionHasTechType("economy3_limited_liability_company", context) and conditions.CharacterFactionHasTechType("economy3_steam_locomotive", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Order_Sweden_3", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Ottoman_Interpreter ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Ottoman_Interpreter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Overseer_of_Works_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterFactionHasTechType("economy1_division_of_labour", context) and conditions.CharacterFactionHasTechType("economy5_mass_production", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Overseer_of_Works", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Pet_Dog_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterRallied(context) and not conditions.CharacterHasAncillary("Anc_Piper", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Pet_Dog", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Physician_Euro_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.CharacterTrait("C_Sausage_Vice", context) >= 4 or conditions.CharacterTrait("C_Feck_Vice", context) >= 5) and not conditions.CharacterHasTrait("C_Personal_Hale", context) and conditions.NoActionThisTurn(context) and not conditions.CharacterHasAncillary("Ancillary_Personal_Physician", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Physician_Euro", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Pilot_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterTurnsAtSea(context) >= 15 and not conditions.CharacterHasAncillary("Anc_Navigator", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Pilot", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Piper_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterRallied(context) and not conditions.CharacterHasAncillary("Anc_Pet_Dog", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Piper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Press_Gang_Captain_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterFactionHasTechType("military2_mass_mobilisation", context) and not conditions.CharacterFactionHasTechType("admin3_trade_unions", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("egy_britain", context) or conditions.CharacterFactionName("spa_britain", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Press_Gang_Captain", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Priest_Defrocked_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and not conditions.CharacterHasAncillary("Anc_Mother_Abbess", context) and not conditions.CharacterHasAncillary("Anc_Nobleman_Louche", context) and not conditions.CharacterHasAncillary("Anc_Priest_Disgraced", context) and not conditions.CharacterHasAncillary("Anc_Rakehell", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Priest_Defrocked", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Priest_Disgraced_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and not conditions.CharacterHasAncillary("Anc_Mother_Abbess", context) and not conditions.CharacterHasAncillary("Anc_Nobleman_Louche", context) and not conditions.CharacterHasAncillary("Anc_Priest_Defrocked", context) and not conditions.CharacterHasAncillary("Anc_Rakehell", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Priest_Disgraced", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Rakehell_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and not conditions.CharacterHasAncillary("Anc_Mother_Abbess", context) and not conditions.CharacterHasAncillary("Anc_Nobleman_Louche", context) and not conditions.CharacterHasAncillary("Anc_Priest_Disgraced", context) and not conditions.CharacterHasAncillary("Anc_Priest_Disgraced", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Rakehell", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Research_Cabinet_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.CharacterBuildingConstructed("sCulture4_great_museum", context) and conditions.CharacterAttribute("research", context) >= 5  and conditions.FactionwideAncillaryTypeExists("Anc_Research_Cabinet", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Research_Cabinet", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Research_Library_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.CharacterBuildingConstructed("sCulture4_great_museum", context) and conditions.CharacterAttribute("research", context) >= 5  and conditions.FactionwideAncillaryTypeExists("Anc_Research_Library", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Research_Library", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Royal_Favourite_Popular_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.CharacterHasTrait("C_Leader_Favourites", context) and not conditions.CharacterHasTrait("C_Leader_Agent_99", context) and not conditions.CharacterHasAncillary("Anc_Royal_Favourite_Unpopular", context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.FactionGovernmentType("gov_empire", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Royal_Favourite_Popular", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Royal_Favourite_Unpopular_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.CharacterHasTrait("C_Leader_Favourites", context) and not conditions.CharacterHasTrait("C_Leader_Agent_99", context) and not conditions.CharacterHasAncillary("Anc_Royal_Favourite_Popular", context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.FactionGovernmentType("gov_empire", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Royal_Favourite_Unpopular", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Seaman_Powder_Monkey_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.InPort(context) and (conditions.CharacterHasAncillary("Ancillary_Navy_Sailing_Master", context) or conditions.CharacterHasAncillary("Anc_Navy_Seaman_Able", context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Seaman_Powder_Monkey", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Servant_Mameluke_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("Eastern_Scholar", context) or conditions.CharacterType("assassin", context)) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and not conditions.CharacterHasAncillary("Anc_Turkish_Masseur", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Servant_Mameluke", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Sharpshooter_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterArmyUsedCoverWalls(context) or conditions.CharacterArmyUsedCoverBuildings(context)) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Sharpshooter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Shipwright_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterBuildingConstructed("pNavy1_shipyard", context) and not conditions.CharacterHasAncillary("Anc_Naval_Surveyor", context) and not conditions.CharacterHasAncillary("Anc_Naval_Secretary", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Shipwright", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Siege_Engineer_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterBattleWallsBreached(context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Siege_Engineer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Signals_Lieutenant_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterTrait("C_Admiral_Defender_Good", context) >= 1 or conditions.CharacterTrait("C_Admiral_Attacker_Good", context) >= 1) and conditions.CharacterFactionHasTechType("admin4_semaphore_lines", context) and not conditions.CharacterHasAncillary("Ancillary_Navy_Flag_Lieutenant", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Signals_Lieutenant", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Tailor_Euro_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.CharacterHasTrait("C_Minister_Miser", context) and (conditions.CharacterHasAncillary("Anc_Wife_Intelligent", context) or conditions.CharacterHasAncillary("Anc_Wife_Faithful", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Tailor_Euro", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turkish_Bey_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("egy_ottomans", context) or conditions.CharacterFactionName("ottomans", context)) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) and conditions.InsurrectionCrushed(context) and not conditions.CharacterHasAncillary("Anc_Turkish_Pasha", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Turkish_Bey", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turkish_Jani_Admin_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterFactionName("egy_ottomans", context) or conditions.CharacterFactionName("ottomans", context)) and conditions.CharacterMinisterialPosition("army", context) and conditions.CharacterBuildingConstructed("sArmy3_drill_school", context) and not conditions.CharacterHasAncillary("Anc_Turkish_Jani_Sec", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Turkish_Jani_Admin", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turkish_Jani_Com_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and (conditions.CharacterFactionName("egy_ottomans", context) or conditions.CharacterFactionName("ottomans", context)) and not conditions.CampaignBattleType("normal", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Anc_Turkish_Jani_Com", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turkish_Jani_Sec_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterFactionName("egy_ottomans", context) or conditions.CharacterFactionName("ottomans", context)) and conditions.CharacterMinisterialPosition("army", context) and conditions.CharacterBuildingConstructed("sArmy3_drill_school", context) and not conditions.CharacterHasAncillary("Anc_Turkish_Jani_Admin", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Turkish_Jani_Sec", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turkish_Masseur_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("Eastern_Scholar", context) or conditions.CharacterType("assassin", context)) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and not conditions.CharacterHasAncillary("Anc_Servant_Mameluke", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Turkish_Masseur", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turkish_Pasha_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("egy_ottomans", context) or conditions.CharacterFactionName("ottomans", context)) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) and conditions.InsurrectionCrushed(context) and not conditions.CharacterHasAncillary("Anc_Turkish_Bey", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Turkish_Pasha", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Turnip_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_General_Mad", context) and conditions.WorldwideAncillaryTypeExists("Anc_Turnip", context) == false then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Turnip", 50,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Voivode_1_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("russia", context) or conditions.CharacterFactionName("poland_lithuania", context)) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) and conditions.InsurrectionCrushed(context) and not conditions.CharacterHasAncillary("Anc_Voivode_2", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Voivode_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Voivode_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("russia", context) or conditions.CharacterFactionName("poland_lithuania", context)) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) and conditions.InsurrectionCrushed(context) and not conditions.CharacterHasAncillary("Anc_Voivode_1", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Voivode_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Voter_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Election_Agent", context) and not conditions.CharacterHasAncillary("Anc_Book_Keeper", context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Voter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Wife_Faithful_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CharacterHasAncillary("Anc_Wife_Intelligent", context) and not conditions.CharacterHasAncillary("Anc_Wife_Matchmaker_Euro", context) and not conditions.CharacterHasAncillary("Anc_Wife_Unfaithful", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Ambitious", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Unpleasant", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Wife_Faithful", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Wife_Intelligent_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CharacterHasAncillary("Anc_Wife_Faithful", context) and not conditions.CharacterHasAncillary("Anc_Wife_Matchmaker_Euro", context) and not conditions.CharacterHasAncillary("Anc_Wife_Unfaithful", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Ambitious", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Unpleasant", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Wife_Intelligent", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Wife_Malaprop_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWonBattle(context) and conditions.CharacterTrait("C_General_Bad_Field_Commander", context) >= 2 and conditions.CampaignPercentageOfOwnRouted(context) >= 50 then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Wife_Malaprop", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Wife_Matchmaker_Euro_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CharacterHasAncillary("Anc_Wife_Faithful", context) and not conditions.CharacterHasAncillary("Anc_Wife_Intelligent", context) and not conditions.CharacterHasAncillary("Anc_Wife_Unfaithful", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Ambitious", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Unpleasant", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Wife_Matchmaker_Euro", 1,  context)
		end
		return true
	end
	return false
end

--[[ Anc_Wife_Unfaithful_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CharacterHasAncillary("Anc_Wife_Faithful", context) and not conditions.CharacterHasAncillary("Anc_Wife_Intelligent", context) and not conditions.CharacterHasAncillary("Anc_Wife_Matchmaker_Euro", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Ambitious", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Unpleasant", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1796, 1900, context) then 
			effect.ancillary("Anc_Wife_Unfaithful", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_African_Servant_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterBuildingConstructed("pTrade3_trading_company", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_African_Servant", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Air_Loom_Operator_Trigger ]]--

events.CharacterFactionSuffersSuccessfulSpyAttempt[#events.CharacterFactionSuffersSuccessfulSpyAttempt+1] =
function (context)
	if conditions.CharacterType("rake", context) and (conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("spa_france", context) or conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.FactionwideAncillaryTypeExists("Ancillary_Air_Loom_Operator", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Air_Loom_Operator", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Amazing_Wine_Cellar_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.CharacterBuildingConstructed("rWine2_winery", context) or conditions.CharacterBuildingConstructed("pTrade2_commercial_port", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Amazing_Wine_Cellar", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Amusing_Cad_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterHasTrait("C_Minister_Upright", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Amusing_Cad", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_ADC_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterWonBattle(context) and conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and not conditions.CommanderFoughtInMelee(context) and conditions.CharacterRallied(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_ADC", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Aide_Nephew_Trigger ]]--

events.CharacterEmbarksNavy[#events.CharacterEmbarksNavy+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.FactionwideAncillaryTypeExists("Ancillary_Army_Aide_Nephew", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Aide_Nephew", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Cleric_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterWonBattle(context) and conditions.CharacterTurnsInEnemyLands(context) >= 10 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Cleric", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Drillmaster_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignPercentageOfUnitCategory("infantry", context) >= 40 and not conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_General_Martinet", context) then
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
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterFoughtCulture("european", context) or conditions.CharacterFoughtCulture("egy_european", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_European_Turncoat", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Exploring_Officer_Trigger ]]--

events.MultiTurnMove[#events.MultiTurnMove+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterTrait("C_General_Scout", context) >= 2 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Exploring_Officer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Galloper_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CharacterTrait("C_General_Scout", context) == 3 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Galloper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Hagiographer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsInEnemyLands(context) >= 30 and conditions.BattlesFought(context) <= 10 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Hagiographer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Merc_Artilleryman_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and conditions.CampaignPercentageOfUnitCategory("artillery", context) >= 15 and (conditions.CharacterFoughtCulture("european", context) or conditions.CharacterFoughtCulture("egy_european", context)) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Merc_Artilleryman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Merc_Cavalryman_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("britain", context) and not conditions.CharacterFactionName("egy_britain", context) and not conditions.CharacterFactionName("spa_britain", context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 15 and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Merc_Cavalryman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Merc_Infantryman_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("prussia", context) and conditions.CampaignPercentageOfUnitCategory("infantry", context) >= 15 and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Merc_Infantryman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Military_Artist_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTrait("C_General_Scout", context) >= 2 and conditions.CharacterTurnsInEnemyLands(context) >= 10 and conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Army_Military_Surveyor", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Military_Artist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Military_Surveyor_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTrait("C_General_Scout", context) >= 2 and conditions.CharacterTurnsInEnemyLands(context) >= 10 and conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Army_Military_Artist", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Military_Surveyor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Ottoman_Turncoat_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterFoughtCulture("middle_east", context) or conditions.CharacterFoughtCulture("egy_middle_east", context)) and not conditions.CharacterHasAncillary("Anc_Islamic_Turncoat", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Ottoman_Turncoat", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Pox_Doctor_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("gent", context)) and conditions.CharacterTrait("C_Feck_Vice", context) >= 4 and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Pox_Doctor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Quartermaster_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tSupply1_supply_post", context) and conditions.CharacterType("General", context) and not conditions.CharacterHasAncillary("Anc_Gen_Supply_Agent", context) and not conditions.CharacterHasAncillary("Ancillary_Army_Waggonmaster", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Quartermaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Surgeon_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and not conditions.CharacterHasTrait("C_General_Bloody", context) and not conditions.CharacterArmyCouldReplenishFromBattle(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Surgeon", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Army_Waggonmaster_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tSupply1_supply_post", context) and conditions.CharacterType("General", context) and not conditions.CharacterHasAncillary("Anc_Gen_Supply_Agent", context) and not conditions.CharacterHasAncillary("Ancillary_Army_Quartermaster", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Army_Waggonmaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Artillery_Expert_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignPercentageOfUnitCategory("artillery", context) >= 20 and conditions.CharacterAttribute("command_land", context) <= 5 and not conditions.CharacterHasTrait("C_General_of_Artillery", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Artillery_Expert", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Barber_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.CharacterHasTrait("C_General_Bloody", context) or conditions.CharacterHasTrait("C_General_Mad", context) or conditions.CharacterHasTrait("C_Sausage_Vice", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Barber", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Bodysnatcher_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation3_enlightened_university", context) and conditions.CharacterType("gentleman", context) and not conditions.CharacterHasAncillary("Ancillary_Inventive_Genius_Loony", context) and not conditions.CharacterHasAncillary("Ancillary_Inventive_Genius_Astronomer", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Bodysnatcher", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Boxer_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.InSettlement(context) or InPort) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Boxer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Hidalgo_Fop_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_sword", context) and (conditions.CharacterFactionName("spain", context) or conditions.CharacterFactionName("spa_spain", context) or conditions.CharacterFactionName("portugal", context) or conditions.CharacterFactionName("spa_portugal", context)) and conditions.CharacterHasTrait("C_Gent_Duelling_Sword", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Minx", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Hidalgo_Fop", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Minx_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Rake_Professional_Second", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Hidalgo_Fop", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Minx", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Pistols_Manton_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_pistols", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.CharacterHasTrait("C_Gent_Duelling_Pistol", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Pistols", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Pistols_Manton", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Duelling_Pistols_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and conditions.CharacterDuelWeapon("duelling_pistols", context) and conditions.CharacterHasTrait("C_Gent_Duelling_Pistol", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Pistols_Manton", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Duelling_Pistols", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Foodtaster_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and not conditions.CharacterHasAncillary("Ancillary_Government_Guardian", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Foodtaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Garden_Hermit_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.CharacterBuildingConstructed("rFarm3_great_estates", context) and not conditions.CharacterHasAncillary("Ancillary_Government_Architect", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Garden_Hermit", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Architect_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeaderFemale(context) and conditions.CharacterBuildingConstructed("rFarm3_great_estates", context) and not conditions.CharacterHasAncillary("Ancillary_Garden_Hermit", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Architect", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Comptroller_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterAttribute("management", context) <= 2 and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.CharacterAttribute("management", context) >= 4 and not conditions.CharacterHasAncillary("Ancillary_Government_Comptroller", context)and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Controller", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Crimper_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and conditions.CharacterFactionHasTechType("military2_mass_mobilisation", context) and not conditions.CharacterFactionHasTechType("admin3_trade_unions", context)and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Crimper", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Cypher_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CharacterHasAncillary("Anc_Gov_Cryptographer", context) and conditions.CharacterInOwnFactionLands(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Cypher", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Executioner_Nasty_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context) or conditions.CharacterFactionName("russia", context)) and not conditions.CharacterHasAncillary("Ancillary_Police_Torturer", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Executioner_Nasty", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Guardian_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and not conditions.CharacterHasAncillary("Ancillary_Foodtaster", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Guardian", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secret_Policeman_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secret_Policeman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secretary_Efficient_Trigger ]]--

events.CharacterCandidateBecomesMinister[#events.CharacterCandidateBecomesMinister+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.CharacterHasAncillary("Ancillary_Government_Secretary_Gobby", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secretary_Efficient", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Secretary_Gobby_Trigger ]]--

events.CharacterCandidateBecomesMinister[#events.CharacterCandidateBecomesMinister+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 and not conditions.CharacterHasAncillary("Ancillary_Government_Secretary_Efficient", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Secretary_Gobby", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Spying_Locksmith_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Government_Spying_Locksmith", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Spymaster_Trigger ]]--

events.CharacterFactionSpyAttemptSuccessful[#events.CharacterFactionSpyAttemptSuccessful+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context) or conditions.CharacterMinisterialPosition("head_of_government", context)) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Spymaster", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Thieftaker_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterFactionHasTechType("economy1_poverty_control_laws", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if (conditions.IsFactionLeader(context) or IsFactionLeaderFemale) and (conditions.CharacterFactionName("austria", context) or conditions.CharacterFactionName("ita_austrian_alliance", context)) and conditions.FactionLeadersTrait("C_Personal_Piety", context) >= 1 and conditions.FactionwideAncillaryTypeExists("Ancillary_Government_Vampire_Hunter", context) == false and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Vampire_Hunter", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Government_Wrestler_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if conditions.CharacterType("minister", context) and (conditions.IsFactionLeader(context) or conditions.CharacterMinisterialPosition("justice", context)) and not conditions.CharacterCultureType("european", context) and not conditions.CharacterCultureType("egy_european", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Government_Wrestler", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Great_Composer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterBuildingConstructed("sCulture3_grand_opera_house", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Great_Composer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Historian_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.FactionDestroyedByCharacterFaction(context) and conditions.IsFactionLeader(context) and (conditions.CharacterHasTrait("C_Leader_Enlightened_Despot", context) or conditions.CharacterHasTrait("C_Leader_Harsh_Ruler", context)) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Historian", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Astronomer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation3_enlightened_university", context) and conditions.CharacterType("gentleman", context) and not conditions.CharacterHasAncillary("Ancillary_Inventive_Genius_Loony", context) and not conditions.CharacterHasAncillary("Ancillary_Bodysnatcher", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Mill_Worker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Loony_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterBuildingConstructed("tEducation3_enlightened_university", context) and conditions.CharacterType("gentleman", context) and not conditions.CharacterHasAncillary("Ancillary_Inventive_Genius_Astronomer", context) and not conditions.CharacterHasAncillary("Ancillary_Bodysnatcher", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Loony", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Inventive_Genius_Mill_Worker_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("economy2_plateways", context) or conditions.ResearchType("economy2_steam_engine", context) or conditions.ResearchType("economy3_interchangeable_parts", context) or conditions.ResearchType("economy3_screw_propeller", context) or conditions.ResearchType("economy3_steam_locomotive", context) or conditions.ResearchType("economy3_steam_ship_propulsion", context)) and conditions.CharacterType("gentleman", context) and not conditions.CharacterHasAncillary("Anc_Instrument_Maker", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Inventive_Genius_Mill_Worker", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Justice_Witness_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.InsurrectionCrushed(context) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Justice_Witness", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Landscape_Gardener_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.CharacterHasTrait("C_Leader_Foreign_Tastes", context) or conditions.CharacterHasTrait("C_Leader_Intellectual_Pretensions", context)) and conditions.CharacterBuildingConstructed("rFarm2_clearances", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Landscape_Gardener", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Madman_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.CharacterInBuildingOfChain("tEducation", context) and conditions.CharacterTurnsAtHome(context) >= 12 and conditions.ResearchType("economy1_poverty_control_laws", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Madman", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Master_of_Lunacy_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterBuildingConstructed("sAdmin3_court_justice", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Minister_Trader", context) and conditions.FactionGovernmentType("gov_constitutional_monarchy", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Merchant_Corn_Factor", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Military_Riding_Master_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("austria", context) or conditions.CharacterFactionName("ita_austrian_alliance", context)) and conditions.CharacterHasTrait("C_General_of_Cavalry", context) then
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
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.InSettlement(context) or InPort) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterTrait("C_Feck_Vice", context) >= 3 then
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
	if (conditions.CharacterType("General", context) or conditions.CharacterType("admiral", context)) and (conditions.InSettlement(context) or InPort) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and conditions.NoActionThisTurn(context) and conditions.FactionwideAncillaryTypeExists("Ancillary_Mistress_Circassian", context) == false then
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
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Minister_Reactionary", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and conditions.WorldwideAncillaryTypeExists("Ancillary_Mistress_Common_Floozy", context) == false and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
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
	if conditions.CharacterType("minister", context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Gorgeous", context) == false and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
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
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeaderFemale(context) and not conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context) or conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("spa_france", context)) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Molly", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
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
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context))  and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Noble", context) == false and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Noble", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Spycatcher_Lady_Trigger ]]--

events.CharacterFactionSpyAttemptSuccessful[#events.CharacterFactionSpyAttemptSuccessful+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spymistress", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Spycatcher_Lady", context) == false and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Spycatcher_Lady", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mistress_Spymistress_Trigger ]]--

events.CharacterFactionSpyAttemptSuccessful[#events.CharacterFactionSpyAttemptSuccessful+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Molly", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Gorgeous", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Noble", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Spycatcher_Lady", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Corrupt", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Court_1", context) and not conditions.CharacterHasAncillary("Anc_Mistress_Indiscreet", context) and not conditions.CharacterHasAncillary("Ancillary_Mistress_Common_Floozy", context) and not conditions.IsTheatreGovernor(context) and conditions.WorldwideAncillaryTypeExists("Anc_Mistress_Spymistress", context) == false and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mistress_Spymistress", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mystic_Mysterious_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and (conditions.CharacterHasTrait("C_Leader_Mad", context) or conditions.CharacterHasTrait("C_Leader_Philistine", context) or conditions.CharacterHasTrait("C_Leader_Foreign_Tastes", context)) and not conditions.CharacterHasAncillary("Anc_Fake_Emir", context) and not conditions.CharacterHasAncillary("Anc_Fake_Native_Chief", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Mystic_Mysterious", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Mystic_Useful_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("egy_middle_east", context) or conditions.CharacterCultureType("egy_european", context)) then
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
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterWonBattle(context) and conditions.CharacterTurnsAtSea(context) >= 10 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Cleric", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Flag_Lieutenant_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and (conditions.CharacterTrait("C_Admiral_Defender_Good", context) >= 1 or conditions.CharacterTrait("C_Admiral_Attacker_Good", context) >= 1) and conditions.CharacterFactionHasTechType("admin4_semaphore_lines", context) and not conditions.CharacterHasAncillary("Anc_Signals_Lieutenant", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Flag_Lieutenant", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Merc_Sea_Captain_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("egy_middle_east", context) or conditions.CharacterCultureType("middle_east", context)) and (conditions.CharacterFoughtCulture("european", context) or conditions.CharacterFoughtCulture("egy_european", context)) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Merc_Sea_Captain", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Naval_Architect_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.FactionLeadersTrait("C_Leader_Navy_Buff", context) >= 2 and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Naval_Architect", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Naval_Surveryor_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and conditions.CharacterBuildingConstructed("pNavy2_dockyard", context) and not conditions.CharacterHasAncillary("Anc_Naval_Surveyor", context) and not conditions.CharacterHasAncillary("Anc_Shipwright", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and conditions.CharacterCapturedEnemyShip(context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Prize_Agent_Good", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Purser_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionHasTechType("economy1_bottling_canning", context) and conditions.CharacterFactionHasTechType("military2_mass_mobilisation", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) then
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
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionHasTechType("military2_top_gallants", context) and conditions.CharacterFactionHasTechType("military1_improved_coppering", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Navy_Seaman_Able", context) then
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
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("pyrrhic_victory", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Navy_Surgeon", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Navy_Watch_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterAttribute("command_sea", context) >= 5 and conditions.CharacterFactionHasTechType("military2_top_gallants", context) then
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
	if conditions.CharacterType("minister", context) and (conditions.CharacterMinisterialPosition("finance", context) or conditions.CharacterMinisterialPosition("justice", context)) and conditions.CharacterHasTrait("C_Minister_Corrupt", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.IsFactionLeader(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasTrait("C_Leader_Philistine", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and conditions.CharacterHasTrait("C_Minister_Reactionary", context) and not conditions.CharacterHasAncillary("Anc_Gov_Scandal_Writer", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and (conditions.FactionGovernmentType("gov_constitutional_monarchy", context) or conditions.FactionGovernmentType("gov_republic", context)) and conditions.CharacterHasTrait("C_Minister_Radical", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("gentleman", context) and conditions.CharacterTrait("C_Sausage_Vice", context) >= 4 and not conditions.CharacterHasTrait("C_Personal_Hale", context) and conditions.NoActionThisTurn(context) and not conditions.CharacterHasAncillary("Anc_Physician_Euro", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Personal_Physician", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Pet_Monkey_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if conditions.CharacterType("assassin", context) and conditions.CharacterHasTrait("C_Rake_Counter_Spy", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Pet_Monkey", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Poet_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Leader_Debauched", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Poet", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Police_Torturer_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context) or conditions.CharacterFactionName("russia", context)) and not conditions.CharacterHasAncillary("Ancillary_Government_Executioner_Nasty", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.CharacterType("General", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) and conditions.BattlesFought(context) >= 15 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Presentation_Sword_1", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Presentation_Sword_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) and conditions.BattlesFought(context) >= 15 then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Presentation_Sword_2", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Rake_Bawd_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterRunsSpyNetwork(context) and conditions.CharacterHasTrait("C_Feck_Vice", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Rake_Bawd", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Rake_Professional_Second_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("gentleman", context)) and conditions.CharacterWonDuel(context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Hidalgo_Fop", context) and conditions.CharacterHasTrait("C_Gent_Duelling_Sword", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Minx", context) then
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
	if conditions.IsFactionLeader(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Leader_Uncouth", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
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
	if conditions.IsFactionLeader(context) and (conditions.CharacterCultureType("middle_east", context) or conditions.CharacterCultureType("egy_middle_east", context)) and conditions.CharacterHasTrait("C_Personal_Piety", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Religion_Imam_Learned", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Religion_Imam_Rabblerouser_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("assassin", context) or conditions.CharacterType("Eastern_Scholar", context)) then
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
	if conditions.CharacterType("rake", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.CharacterRunsSpyNetwork(context) and not conditions.CharacterHasAncillary("Ancillary_Research_Lunatic_Jack", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Religion_Methodist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Librarian_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("tEducation", context) and conditions.NoActionThisTurn(context) and not conditions.CharacterHasAncillary("Ancillary_Research_Taxonomist", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Librarian", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Lunatic_Jack_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.CharacterRunsSpyNetwork(context) and not conditions.CharacterHasAncillary("Ancillary_Religion_Methodist", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Lunatic_Jack", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Research_Taxonomist_2_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterInBuildingOfChain("tEducation", context) and conditions.NoActionThisTurn(context) and not conditions.CharacterHasAncillary("Ancillary_Research_Librarian", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Research_Taxonomist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Tax_Farmer_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and (conditions.CharacterTrait("C_Minister_Miser", context) >= 1 or conditions.CharacterAttribute("management", context) >= 3) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Tax_Farmer", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Wife_Ambitious_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Wife_Faithful", context) and not conditions.CharacterHasAncillary("Anc_Wife_Intelligent", context) and not conditions.CharacterHasAncillary("Anc_Wife_Matchmaker_Euro", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Unpleasant", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Wife_Ambitious", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancillary_Wife_Unpleasant_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.FactionLeadersTrait("C_Leader_Merit", context) >= 1 and conditions.CharacterAttribute("management", context) < 2 and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Anc_Wife_Faithful", context) and not conditions.CharacterHasAncillary("Anc_Wife_Intelligent", context) and not conditions.CharacterHasAncillary("Anc_Wife_Matchmaker_Euro", context) and not conditions.CharacterHasAncillary("Ancillary_Wife_Ambitious", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancillary_Wife_Unpleasant", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancilllary_Dead_Parrot_Pirate_1_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Admiral_Mad", context) and not conditions.CharacterHasAncillary("Ancilllary_Pet_Parrot_Nasty", context) and not conditions.CharacterHasAncillary("Ancilllary_Pet_Parrot_Ordinary", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Dead_Parrot_Pirate", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancilllary_Dead_Parrot_Pirate_2_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWonBattle(context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancillary_Dead_Parrot_Pirate", context) and (conditions.CharacterHasAncillary("Ancilllary_Pet_Parrot_Nasty", context) or conditions.CharacterHasAncillary("Ancilllary_Pet_Parrot_Ordinary", context)) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Dead_Parrot_Pirate", 8,  context)
		end
		effect.remove_ancillary("Ancilllary_Pet_Parrot_Nasty", context)
		effect.remove_ancillary("Ancilllary_Pet_Parrot_Ordinary", context)
		return true
	end
	return false
end

--[[ Ancilllary_Pet_Parrot_Nasty_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and conditions.CharacterHasTrait("C_Admiral_Drunkard", context) and not conditions.CharacterHasAncillary("Ancilllary_Pet_Parrot_Ordinary", context) and not conditions.CharacterHasAncillary("Ancilllary_Dead_Parrot_Pirate", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Pet_Parrot_Nasty", 1,  context)
		end
		return true
	end
	return false
end

--[[ Ancilllary_Pet_Parrot_Ordinary_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterCultureType("european", context) or conditions.CharacterCultureType("egy_european", context)) and not conditions.CharacterHasAncillary("Ancilllary_Pet_Parrot_Nasty", context) and not conditions.CharacterHasAncillary("Ancilllary_Dead_Parrot_Pirate", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("Ancilllary_Pet_Parrot_Ordinary", 1,  context)
		end
		return true
	end
	return false
end

--[[ Spain_Anc_Guitarist_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsGuerrillaGeneral(context) and conditions.WorldwideAncillaryTypeExists("Spain_Anc_Guitarist", context) == false and conditions.CharacterHasTrait("Spain_C_General_Guerrilla_Leader", context) then
		if conditions.DateInRange(1809, 1814, context) then 
			effect.ancillary("Spain_Anc_Guitarist", 1,  context)
		end
		return true
	end
	return false
end

--[[ Spain_Anc_Guitarist_Son_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsGuerrillaGeneral(context) and not conditions.CharacterHasAncillary("Spain_Anc_Guitarist", context) and conditions.WorldwideAncillaryTypeExists("Spain_Anc_Guitarist", context) == true and conditions.CharacterHasTrait("Spain_C_General_Guerrilla_Leader", context) then
		if conditions.DateInRange(1809, 1814, context) then 
			effect.ancillary("Spain_Anc_Guitarist_Son", 1,  context)
		end
		return true
	end
	return false
end

--[[ Spain_Catalonian_Servant_Trigger ]]--

events.SettlementOccupied[#events.SettlementOccupied+1] =
function (context)
	if conditions.FactionwideAncillaryTypeExists("Spain_Catalonian_Servant", context) == false and conditions.SettlementIsLocal(context) and conditions.SettlementName("settlement:spa_cataluna:barcelona", context) then
		if conditions.DateInRange(1809, 1814, context) then 
			effect.ancillary("Spain_Catalonian_Servant", 1,  context)
		end
		return true
	end
	return false
end

