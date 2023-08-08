--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Trigger declarations

--[[ C_Admiral_Attacker_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Attacker_Bad", "agent", 1, 12, context)
		effect.trait("C_Admiral_Attacker_Bad", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Admiral_Attacker_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Attacker_Good", "agent", 2, 12, context)
		effect.trait("C_Admiral_Attacker_Good", "agent", 1, 25, context)
		return true
	end
	return false
end

--[[ C_Admiral_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Bad", "agent", 1, 6, context)
		effect.trait("C_Admiral_Bad", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Admiral_Blockade_Runner_Good_Trigger ]]--

events.CharacterBrokePortBlockade[#events.CharacterBrokePortBlockade+1] =
function (context)
	if conditions.CharacterType("admiral", context) then
		effect.trait("C_Admiral_Blockade_Runner_Good", "agent", 1, 17, context)
		effect.trait("C_Admiral_Blockade_Runner_Good", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Admiral_Blockader_Good_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.IsBlockading(context) then
		effect.trait("C_Admiral_Blockader_Good", "agent", 1, 8, context)
		effect.trait("C_Admiral_Blockader_Good", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Brave_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CommanderFoughtInBattle(context) and not conditions.CharacterRouted(context) then
		effect.trait("C_Admiral_Brave", "agent", 2, 8, context)
		effect.trait("C_Admiral_Brave", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_British_Drakes_Drum_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("egy_britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 17, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 2, 8, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_British_Drakes_Drum_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterFactionName("britain", context) or conditions.CharacterFactionName("egy_britain", context) or conditions.CharacterFactionName("spa_britain", context)) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 17, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 2, 8, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Coward_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CommanderFoughtInBattle(context) and conditions.CharacterRouted(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Coward", "agent", 1, 12, context)
		effect.trait("C_Admiral_Coward", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Admiral_Created_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Good", "agent", 1, 8, context)
		effect.trait("C_Admiral_Brave", "agent", 1, 8, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 3, 2, context)
		effect.trait("C_Admiral_Slacker", "agent", 3, 2, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 1, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 8, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 2, 4, context)
		effect.trait("C_Admiral_Martinet", "agent", 2, 4, context)
		effect.trait("C_Admiral_Mad", "agent", 10, 1, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 2, context)
		effect.trait("C_Admiral_Drunkard", "agent", 5, 2, context)
		effect.trait("C_Admiral_Slacker", "agent", 1, 8, context)
		effect.trait("C_Admiral_Brave", "agent", 2, 4, context)
		effect.trait("C_Admiral_Good", "agent", 2, 4, context)
		effect.trait("C_Admiral_Mathematician", "agent", 1, 4, context)
		effect.trait("C_Admiral_Cruisers", "agent", 2, 4, context)
		effect.trait("C_Admiral_Rated_Ships", "agent", 2, 4, context)
		effect.trait("C_Admiral_Good", "agent", 3, 2, context)
		effect.trait("C_Admiral_Rated_Ships", "agent", 1, 8, context)
		effect.trait("C_Admiral_Mathematician", "agent", 2, 2, context)
		effect.trait("C_Admiral_Sobriety", "agent", 2, 1, context)
		effect.trait("C_Admiral_Sobriety", "agent", 2, 1, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 1, context)
		effect.trait("C_Admiral_Martinet", "agent", 3, 2, context)
		effect.trait("C_Admiral_Slacker", "agent", 2, 4, context)
		effect.trait("C_Admiral_Cruisers", "agent", 1, 8, context)
		effect.trait("C_Admiral_Martinet", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Admiral_Created_Trigger_Spam ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionAdmiralCount(context) > 15 then
		effect.trait("C_Admiral_Drunkard", "agent", 5, 4, context)
		effect.trait("C_Admiral_Bad", "agent", 2, 4, context)
		effect.trait("C_Admiral_Slacker", "agent", 3, 2, context)
		effect.trait("C_Admiral_Slacker", "agent", 1, 8, context)
		effect.trait("C_Admiral_Mad", "agent", 5, 4, context)
		effect.trait("C_Admiral_Mad", "agent", 10, 8, context)
		effect.trait("C_Admiral_Bad", "agent", 1, 8, context)
		effect.trait("C_Admiral_Bad", "agent", 3, 2, context)
		effect.trait("C_Admiral_Slacker", "agent", 2, 4, context)
		effect.trait("C_Admiral_Drunkard", "agent", 5, 8, context)
		return true
	end
	return false
end

--[[ C_Admiral_Cruisers_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("naval_frigate", context) >= 50 then
		effect.trait("C_Admiral_Cruisers", "agent", 2, 6, context)
		effect.trait("C_Admiral_Cruisers", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Admiral_Defend_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Defender_Bad", "agent", 1, 12, context)
		effect.trait("C_Admiral_Defender_Bad", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Admiral_Defend_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Defender_Good", "agent", 1, 12, context)
		effect.trait("C_Admiral_Defender_Good", "agent", 1, 25, context)
		return true
	end
	return false
end

--[[ C_Admiral_Drunkard_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.NoActionThisTurn(context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterCultureType("egy_middle_east", context) then
		effect.trait("C_Admiral_Drunkard", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Admiral_Dutch_Seamanship_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("netherlands", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 17, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 2, 8, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Dutch_Seamanship_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("netherlands", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 17, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 2, 8, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_Admiral_Good", "agent", 1, 25, context)
		effect.trait("C_Admiral_Good", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Admiral_Lampooned_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWonBattle(context) and (conditions.BattleResult("crushing_defeat", context) or conditions.CampaignPercentageOfOwnRouted(context) >= 50 or conditions.CampaignPercentageOfOwnKilled(context) >= 50 or conditions.CampaignPercentageOfOwnCaptured(context) >= 30) then
		effect.trait("C_Admiral_Lampooned", "agent", 1, 6, context)
		effect.trait("C_Admiral_Lampooned", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Admiral_Mad_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterTurnsAtSea(context) > 5 and conditions.BattlesFought(context) <= 5 and conditions.NoActionThisTurn(context) then
		effect.trait("C_Admiral_Mad", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Admiral_Press_Hero_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and (conditions.BattleResult("heroic_victory", context) or conditions.CampaignPercentageOfThemRouted(context) >= 50 or conditions.CampaignPercentageOfThemKilled(context) >= 50 or conditions.CampaignPercentageOfThemCaptured(context) >= 30) then
		effect.trait("C_Admiral_Press_Hero", "agent", 1, 8, context)
		effect.trait("C_Admiral_Press_Hero", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Trigger ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Rated_Ships", "agent", 1, 8, context)
		effect.trait("C_Admiral_Good", "agent", 2, 4, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 1, context)
		effect.trait("C_Admiral_Slacker", "agent", 1, 8, context)
		effect.trait("C_Admiral_Good", "agent", 3, 2, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 3, 2, context)
		effect.trait("C_Admiral_Good", "agent", 1, 8, context)
		effect.trait("C_Admiral_Slacker", "agent", 3, 2, context)
		effect.trait("C_Admiral_Slacker", "agent", 2, 4, context)
		effect.trait("C_Admiral_Drunkard", "agent", 5, 1, context)
		effect.trait("C_Admiral_Mathematician", "agent", 2, 2, context)
		effect.trait("C_Admiral_Rated_Ships", "agent", 2, 4, context)
		effect.trait("C_Admiral_Martinet", "agent", 1, 8, context)
		effect.trait("C_Admiral_Mathematician", "agent", 1, 4, context)
		effect.trait("C_Admiral_Mad", "agent", 10, 1, context)
		effect.trait("C_Admiral_Martinet", "agent", 2, 4, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 8, context)
		effect.trait("C_Admiral_Martinet", "agent", 3, 2, context)
		effect.trait("C_Admiral_Cruisers", "agent", 2, 4, context)
		effect.trait("C_Admiral_Cruisers", "agent", 1, 8, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 2, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Trigger_Spam ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionAdmiralCount(context) > 15 then
		effect.trait("C_Admiral_Drunkard", "agent", 5, 8, context)
		effect.trait("C_Admiral_Bad", "agent", 2, 4, context)
		effect.trait("C_Admiral_Bad", "agent", 3, 2, context)
		effect.trait("C_Admiral_Drunkard", "agent", 5, 4, context)
		effect.trait("C_Admiral_Mad", "agent", 5, 4, context)
		effect.trait("C_Admiral_Slacker", "agent", 1, 8, context)
		effect.trait("C_Admiral_Slacker", "agent", 3, 2, context)
		effect.trait("C_Admiral_Bad", "agent", 1, 8, context)
		effect.trait("C_Admiral_Slacker", "agent", 2, 4, context)
		effect.trait("C_Admiral_Mad", "agent", 10, 8, context)
		return true
	end
	return false
end

--[[ C_Admiral_Rated_Ships_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("naval_line_of_battle", context) >= 50 then
		effect.trait("C_Admiral_Rated_Ships", "agent", 1, 12, context)
		effect.trait("C_Admiral_Rated_Ships", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Admiral_Spanish_National_Pride_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterFactionName("spain", context) or conditions.CharacterFactionName("spa_spain", context)) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 17, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 2, 8, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Spanish_National_Pride_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and (conditions.CharacterFactionName("spain", context) or conditions.CharacterFactionName("spa_spain", context)) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 17, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 2, 8, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Swashbuckling_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CommanderFoughtInMelee(context) and not conditions.CharacterRouted(context) then
		effect.trait("C_Admiral_Swashbuckling", "agent", 1, 17, context)
		effect.trait("C_Admiral_Swashbuckling", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Agent_Secret_Police_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and conditions.CharacterType("assassin", context) and conditions.CharacterTurnsAtHome(context) >= 5 and conditions.NoActionThisTurn(context) then
		effect.trait("C_Agent_Secret_Police", "agent", 1, 12, context)
		effect.trait("C_Agent_Secret_Police", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Agent_Spy_Network_Trigger_01 ]]--

events.CharacterBuildsSpyNetwork[#events.CharacterBuildsSpyNetwork+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		effect.trait("C_Agent_Spy_Network", "agent", 1, 24, context)
		effect.trait("C_Agent_Spy_Network", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Agent_Spy_Network_Trigger_02 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and conditions.CharacterRunsSpyNetwork(context) then
		effect.trait("C_Agent_Spy_Network", "agent", 1, 12, context)
		effect.trait("C_Agent_Spy_Network", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Feck_Vice_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if not conditions.CharacterFactionName("egy_ottomans", context) and not conditions.CharacterFactionName("ottomans", context) and (conditions.CharacterType("admiral", context) or conditions.CharacterType("General", context) or conditions.CharacterType("rake", context)) and conditions.NoActionThisTurn(context) and (conditions.InSettlement(context) or conditions.InPort(context)) and conditions.CharacterForename("names_name_names_frenchNapoléon", context) and conditions.CharacterSurname("names_name_names_frenchBonaparte", context) then
		effect.trait("C_Feck_Vice", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_General_Ambush_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("land_ambush", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		return true
	end
	return false
end

--[[ C_General_Ambush_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("land_ambush", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		return true
	end
	return false
end

--[[ C_General_Attacker_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Attacker_Bad", "agent", 1, 12, context)
		effect.trait("C_General_Attacker_Bad", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_General_Attacker_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Attacker_Good", "agent", 1, 25, context)
		effect.trait("C_General_Attacker_Good", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Austrian_Hates_Ottomans_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("austria", context) or conditions.CharacterFactionName("ita_austrian_alliance", context)) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 17, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 2, 8, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Austrian_Hates_Ottomans_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("austria", context) or conditions.CharacterFactionName("ita_austrian_alliance", context)) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 17, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 2, 8, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Bad_Field_Commander_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("normal", context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Bad_Field_Commander", "agent", 1, 6, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Bloody_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfOwnKilled(context) > 40 and conditions.CommanderFoughtInMelee(context) then
		effect.trait("C_General_Bloody", "agent", 1, 6, context)
		effect.trait("C_General_Bloody", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Brave_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CommanderFoughtInMelee(context) and not conditions.CharacterRouted(context) then
		effect.trait("C_General_Brave", "agent", 1, 17, context)
		effect.trait("C_General_Brave", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_General_Coward_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterRouted(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Coward", "agent", 1, 6, context)
		effect.trait("C_General_Coward", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_of_Artillery", "agent", 1, 8, context)
		effect.trait("C_General_of_Cavalry", "agent", 1, 8, context)
		effect.trait("C_General_Martinet", "agent", 1, 8, context)
		effect.trait("C_General_of_Cavalry", "agent", 2, 4, context)
		effect.trait("C_General_Slacker", "agent", 1, 8, context)
		effect.trait("C_General_Martinet", "agent", 3, 2, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 8, context)
		effect.trait("C_General_of_Infantry", "agent", 1, 8, context)
		effect.trait("C_General_Mad", "agent", 10, 1, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 3, 2, context)
		effect.trait("C_General_Born_Soldier", "agent", 3, 2, context)
		effect.trait("C_General_of_Artillery", "agent", 2, 4, context)
		effect.trait("C_General_Slacker", "agent", 2, 4, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 2, 4, context)
		effect.trait("C_General_of_Infantry", "agent", 2, 4, context)
		effect.trait("C_General_Martinet", "agent", 2, 4, context)
		effect.trait("C_General_Drunkard", "agent", 5, 1, context)
		effect.trait("C_General_Siege_Attack_Good", "agent", 1, 8, context)
		effect.trait("C_General_Slacker", "agent", 3, 2, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 8, context)
		effect.trait("C_General_Brave", "agent", 1, 8, context)
		effect.trait("C_General_Brave", "agent", 1, 4, context)
		effect.trait("C_General_Born_Soldier", "agent", 2, 4, context)
		effect.trait("C_General_Scout", "agent", 4, 8, context)
		effect.trait("C_General_Siege_Attack_Good", "agent", 2, 4, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger_Spam ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionGeneralCount(context) > 15 then
		effect.trait("C_General_Drunkard", "agent", 5, 2, context)
		effect.trait("C_General_Siege_Defend_Bad", "agent", 1, 8, context)
		effect.trait("C_General_Drunkard", "agent", 1, 2, context)
		effect.trait("C_General_Slacker", "agent", 3, 2, context)
		effect.trait("C_General_Siege_Defend_Bad", "agent", 1, 4, context)
		effect.trait("C_General_Mad", "agent", 5, 1, context)
		effect.trait("C_General_Siege_Attack_Bad", "agent", 1, 4, context)
		effect.trait("C_General_Slacker", "agent", 1, 8, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 1, 8, context)
		effect.trait("C_General_Siege_Attack_Bad", "agent", 1, 8, context)
		effect.trait("C_General_Mad", "agent", 10, 1, context)
		effect.trait("C_General_Slacker", "agent", 2, 4, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 3, 2, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 2, 4, context)
		return true
	end
	return false
end

--[[ C_General_Defender_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Defender_Bad", "agent", 1, 6, context)
		effect.trait("C_General_Defender_Bad", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Defender_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Defender_Good", "agent", 1, 12, context)
		effect.trait("C_General_Defender_Good", "agent", 1, 25, context)
		return true
	end
	return false
end

--[[ C_General_Drunkard_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.NoActionThisTurn(context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterCultureType("egy_middle_east", context) then
		effect.trait("C_General_Drunkard", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_General_French_Elan_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("ita_french_republic", context) or conditions.CharacterFactionName("egy_french_republic", context) or conditions.CharacterFactionName("spa_france", context)) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_French_Elan", "agent", 1, 17, context)
		effect.trait("C_General_French_Elan", "agent", 2, 8, context)
		effect.trait("C_General_French_Elan", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_French_Elan_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("france", context) or conditions.CharacterFactionName("ita_french_republic", context) or conditions.CharacterFactionName("egy_french_republic", context) or conditions.CharacterFactionName("spa_france", context)) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_French_Elan", "agent", 1, 17, context)
		effect.trait("C_General_French_Elan", "agent", 2, 8, context)
		effect.trait("C_General_French_Elan", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Good_Field_Commander_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("normal", context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 12, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 25, context)
		return true
	end
	return false
end

--[[ C_General_Lampooned_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWonBattle(context) and (conditions.BattleResult("crushing_defeat", context) or conditions.CampaignPercentageOfOwnRouted(context) >= 50 or conditions.CampaignPercentageOfOwnKilled(context) >= 50 or conditions.CampaignPercentageOfOwnCaptured(context) >= 30) then
		effect.trait("C_General_Lampooned", "agent", 1, 6, context)
		effect.trait("C_General_Lampooned", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Mad_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsInEnemyLands(context) > 5 and conditions.BattlesFought(context) <= 5 and conditions.NoActionThisTurn(context) then
		effect.trait("C_General_Mad", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_General_of_Artillery_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("artillery", context) >= 40 then
		effect.trait("C_General_of_Artillery", "agent", 1, 6, context)
		effect.trait("C_General_of_Artillery", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_of_Cavalry_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 then
		effect.trait("C_General_of_Cavalry", "agent", 1, 12, context)
		effect.trait("C_General_of_Cavalry", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_General_of_Infantry_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("infantry", context) >= 40 then
		effect.trait("C_General_of_Infantry", "agent", 1, 6, context)
		effect.trait("C_General_of_Infantry", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Polish_Stubborn_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("poland_lithuania", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 17, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 2, 8, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Polish_Stubborn_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("poland_lithuania", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 17, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 2, 8, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Press_Hero_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.BattleResult("heroic_victory", context) or conditions.CampaignPercentageOfThemRouted(context) >= 50 or conditions.CampaignPercentageOfThemKilled(context) >= 50 or conditions.CampaignPercentageOfThemCaptured(context) >= 30) then
		effect.trait("C_General_Press_Hero", "agent", 1, 12, context)
		effect.trait("C_General_Press_Hero", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Martinet", "agent", 3, 2, context)
		effect.trait("C_General_Brave", "agent", 2, 4, context)
		effect.trait("C_General_Martinet", "agent", 2, 4, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 8, context)
		effect.trait("C_General_Mad", "agent", 2, 1, context)
		effect.trait("C_General_Slacker", "agent", 3, 2, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 3, 2, context)
		effect.trait("C_General_of_Cavalry", "agent", 1, 4, context)
		effect.trait("C_General_of_Artillery", "agent", 1, 4, context)
		effect.trait("C_General_of_Infantry", "agent", 1, 4, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 2, 4, context)
		effect.trait("C_General_Slacker", "agent", 2, 4, context)
		effect.trait("C_General_Scout", "agent", 4, 8, context)
		effect.trait("C_General_Slacker", "agent", 1, 8, context)
		effect.trait("C_General_of_Infantry", "agent", 1, 8, context)
		effect.trait("C_General_Siege_Attack_Good", "agent", 1, 8, context)
		effect.trait("C_General_of_Artillery", "agent", 1, 8, context)
		effect.trait("C_General_Brave", "agent", 3, 2, context)
		effect.trait("C_General_Born_Soldier", "agent", 2, 4, context)
		effect.trait("C_General_Martinet", "agent", 1, 8, context)
		effect.trait("C_General_Drunkard", "agent", 2, 1, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 8, context)
		effect.trait("C_General_Siege_Attack_Good", "agent", 1, 4, context)
		effect.trait("C_General_Brave", "agent", 1, 8, context)
		effect.trait("C_General_of_Cavalry", "agent", 1, 8, context)
		effect.trait("C_General_Born_Soldier", "agent", 3, 2, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_Spam ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionGeneralCount(context) > 15 then
		effect.trait("C_General_Slacker", "agent", 3, 2, context)
		effect.trait("C_General_Siege_Attack_Bad", "agent", 2, 4, context)
		effect.trait("C_General_Siege_Defend_Bad", "agent", 2, 4, context)
		effect.trait("C_General_Drunkard", "agent", 1, 1, context)
		effect.trait("C_General_Drunkard", "agent", 5, 1, context)
		effect.trait("C_General_Mad", "agent", 1, 1, context)
		effect.trait("C_General_Mad", "agent", 10, 1, context)
		effect.trait("C_General_Slacker", "agent", 2, 4, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 3, 2, context)
		effect.trait("C_General_Slacker", "agent", 1, 8, context)
		effect.trait("C_General_Siege_Defend_Bad", "agent", 1, 8, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 1, 8, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 2, 4, context)
		effect.trait("C_General_Siege_Attack_Bad", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_General_Prussian_Blue_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("prussia", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Prussian_Blue", "agent", 1, 17, context)
		effect.trait("C_General_Prussian_Blue", "agent", 2, 8, context)
		effect.trait("C_General_Prussian_Blue", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Prussian_Blue_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("prussia", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Prussian_Blue", "agent", 1, 17, context)
		effect.trait("C_General_Prussian_Blue", "agent", 2, 8, context)
		effect.trait("C_General_Prussian_Blue", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Russian_Vodka_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("russia", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Russian_Vodka", "agent", 1, 17, context)
		effect.trait("C_General_Russian_Vodka", "agent", 2, 8, context)
		effect.trait("C_General_Russian_Vodka", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Russian_Vodka_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("russia", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Russian_Vodka", "agent", 1, 17, context)
		effect.trait("C_General_Russian_Vodka", "agent", 2, 8, context)
		effect.trait("C_General_Russian_Vodka", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Scout_Trigger_01 ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CharacterMPPercentageRemaining(context) <= 5 then
		effect.trait("C_General_Scout", "agent", 1, 12, context)
		effect.trait("C_General_Scout", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_General_Scout_Trigger_02 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasAncillary("Anc_Balloonist", context) then
		effect.trait("C_General_Scout", "agent", 1, 6, context)
		effect.trait("C_General_Scout", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Attack_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_sally", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_unfortified", context)) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Siege_Attack_Bad", "agent", 1, 6, context)
		effect.trait("C_General_Siege_Attack_Bad", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Attack_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_sally", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_unfortified", context)) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Siege_Attack_Good", "agent", 1, 25, context)
		effect.trait("C_General_Siege_Attack_Good", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Defend_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_sally", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_unfortified", context)) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Siege_Defend_Bad", "agent", 1, 6, context)
		effect.trait("C_General_Siege_Defend_Bad", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Defend_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_sally", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_unfortified", context)) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) then
		effect.trait("C_General_Siege_Defend_Good", "agent", 1, 12, context)
		effect.trait("C_General_Siege_Defend_Good", "agent", 1, 25, context)
		return true
	end
	return false
end

--[[ C_General_Swedish_Aggression_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("sweden", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 17, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 2, 8, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Swedish_Aggression_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("sweden", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 17, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 2, 8, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Turkish_Master_Gunner_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 17, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 2, 8, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_General_Turkish_Master_Gunner_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 17, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 2, 8, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 3, 4, context)
		return true
	end
	return false
end

--[[ C_Gent_Academic_Honours_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterAttribute("research", context) >= 8 then
		effect.trait("C_Gent_Academic_Honours", "agent", 1, 6, context)
		effect.trait("C_Gent_Academic_Honours", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("gentleman", context) then
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 2, context)
		effect.trait("C_Gent_Science_Club", "agent", 2, 1, context)
		effect.trait("C_Gent_Duelling_Sword", "agent", 2, 1, context)
		effect.trait("C_Rake_Naughty_Club", "agent", 5, 1, context)
		effect.trait("C_Gent_Duelling_Pistol", "agent", 2, 1, context)
		effect.trait("C_Gent_Academic_Honours", "agent", 2, 1, context)
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 2, context)
		effect.trait("C_Gent_Academic_Honours", "agent", 1, 2, context)
		effect.trait("C_Gent_Science_Club", "agent", 1, 1, context)
		effect.trait("C_Rake_Naughty_Club", "agent", 5, 1, context)
		effect.trait("C_Rake_Naughty_Club", "agent", 5, 1, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) then
		effect.trait("C_Personal_Piety", "agent", 1, 8, context)
		effect.trait("C_Personal_Sickly", "agent", 10, 1, context)
		effect.trait("C_NTW_Gent_Agitator", "agent", 1, 8, context)
		effect.trait("C_Personal_High_Personal_Security", "agent", 1, 8, context)
		effect.trait("C_Personal_Hale", "agent", 10, 2, context)
		effect.trait("C_Personal_High_Personal_Security", "agent", 2, 4, context)
		effect.trait("C_Personal_Piety", "agent", 2, 4, context)
		effect.trait("C_Sausage_Vice", "agent", 10, 2, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_02_Agriculture ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.FactionLeadersTrait("C_Leader_Huntin_Shootin_Fishin", context) >= 1 then
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 8, context)
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_03_Economics ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.FactionLeadersTrait("C_Leader_Clever_Stick", context) >= 1 then
		effect.trait("C_Gent_Research_Economics", "agent", 1, 8, context)
		effect.trait("C_Gent_Research_Economics", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_04_Industry ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.FactionLeadersTrait("C_Leader_Huntin_Shootin_Fishin", context) < 1 then
		effect.trait("C_Gent_Research_Industry", "agent", 1, 4, context)
		effect.trait("C_Gent_Research_Industry", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_05_Military ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.FactionLeadersTrait("C_Leader_Army_Buff", context) >= 1 then
		effect.trait("C_Gent_Research_Military", "agent", 1, 4, context)
		effect.trait("C_Gent_Research_Military", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_06_Navy ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.FactionLeadersTrait("C_Leader_Navy_Buff", context) >= 1 then
		effect.trait("C_Gent_Research_Navy", "agent", 1, 8, context)
		effect.trait("C_Gent_Research_Navy", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_07_Philosophy ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("Eastern_Scholar", context) and conditions.FactionLeadersTrait("C_Leader_Intellectual_Pretensions", context) >= 1 then
		effect.trait("C_Gent_Research_Philosophy", "agent", 1, 4, context)
		effect.trait("C_Gent_Research_Philosophy", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Duelling_Pistol_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterDuelWeapon("duelling_pistols", context) and conditions.CharacterWonDuel(context) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) then
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 12, context)
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Duelling_Sword_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterDuelWeapon("duelling_sword", context) and conditions.CharacterWonDuel(context) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) then
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 12, context)
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Agriculture_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.ResearchType("economy1_land_drainage", context) then
		effect.trait("C_Gent_Research_Agriculture", "agent", 3, 1, context)
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 2, context)
		effect.trait("C_Gent_Research_Agriculture", "agent", 2, 1, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Agriculture_Trigger_02 ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.IsBuildingInChain("rFarm", context) then
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Civil_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("admin3_abolition_of_slavery", context) or conditions.ResearchType("admin3_code_napoleon", context) or conditions.ResearchType("admin3_trade_unions", context) or conditions.ResearchType("economy1_poverty_control_laws", context) or conditions.ResearchType("admin5_passports", context)) then
		effect.trait("C_Gent_Research_Civil", "agent", 1, 6, context)
		effect.trait("C_Gent_Research_Civil", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Economics_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and (conditions.ResearchType("admin1_classical_economics", context) or conditions.ResearchType("admin1_national_debt", context) or conditions.ResearchType("economy2_joint_stock_company", context) or conditions.ResearchType("economy3_limited_liability_company", context)) then
		effect.trait("C_Gent_Research_Economics", "agent", 1, 12, context)
		effect.trait("C_Gent_Research_Economics", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Industry_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and (conditions.ResearchType("economy1_division_of_labour", context) or conditions.ResearchType("economy2_plateways", context) or conditions.ResearchType("economy3_steam_locomotive", context) or conditions.ResearchType("economy5_mass_production", context)) then
		effect.trait("C_Gent_Research_Industry", "agent", 1, 12, context)
		effect.trait("C_Gent_Research_Industry", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Industry_Trigger_Ottoman ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("Eastern_Scholar", context) and (conditions.ResearchType("economy1_division_of_labour", context) or conditions.ResearchType("economy2_plateways", context) or conditions.ResearchType("economy3_steam_locomotive", context) or conditions.ResearchType("economy5_mass_production", context)) then
		effect.trait("C_Gent_Research_Industry", "agent", 6, 8, context)
		effect.trait("C_Gent_Research_Industry", "agent", 1, 2, context)
		effect.trait("C_Gent_Research_Industry", "agent", 2, 4, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Military_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and (conditions.ResearchType("military1_conscription", context) or conditions.ResearchType("military1_diamond_formation", context) or conditions.ResearchType("military1_fire_and_advance", context) or conditions.ResearchType("military2_army_corps_organisation", context) or conditions.ResearchType("military2_grand_battery", context) or conditions.ResearchType("military2_logistics", context) or conditions.ResearchType("military2_mass_mobilisation", context) or conditions.ResearchType("military3_carcass_shot", context) or conditions.ResearchType("military3_conscript_infantry_tactics", context) or conditions.ResearchType("military3_field_ambulances", context) or conditions.ResearchType("military3_standardised_artillery", context) or conditions.ResearchType("military4_general_staff", context) or conditions.ResearchType("military4_modern_rifles", context) or conditions.ResearchType("military4_quicklime", context) or conditions.ResearchType("military5_percussion_cap", context) or conditions.ResearchType("military5_percussive_shells", context) or conditions.ResearchType("military5_rifled_cannons", context) or conditions.ResearchType("military5_rockets", context)) then
		effect.trait("C_Gent_Research_Military", "agent", 1, 12, context)
		effect.trait("C_Gent_Research_Military", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Navy_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and (conditions.ResearchType("military5_iron_plating", context) or conditions.ResearchType("military2_top_gallants", context) or conditions.ResearchType("military1_carronade", context) or conditions.ResearchType("economy3_steam_ship_propulsion", context) or conditions.ResearchType("economy3_screw_propeller", context)) then
		effect.trait("C_Gent_Research_Navy", "agent", 1, 12, context)
		effect.trait("C_Gent_Research_Navy", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Philosophy_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("Eastern_Scholar", context) and conditions.ResearchType("admin4_dialectics", context) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) then
		effect.trait("C_Gent_Research_Philosophy", "agent", 1, 12, context)
		effect.trait("C_Gent_Research_Philosophy", "agent", 3, 3, context)
		effect.trait("C_Gent_Research_Philosophy", "agent", 2, 6, context)
		return true
	end
	return false
end

--[[ C_Gent_Science_Club_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.CharacterAttribute("research", context) >= 6 then
		effect.trait("C_Gent_Science_Club", "agent", 1, 12, context)
		effect.trait("C_Gent_Science_Club", "agent", 1, 6, context)
		return true
	end
	return false
end

--[[ C_Leader_Agent_99_Trigger ]]--

events.CharacterFactionSuffersSuccessfulSpyAttempt[#events.CharacterFactionSuffersSuccessfulSpyAttempt+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Agent_99", "agent", 1, 4, context)
		effect.trait("C_Leader_Agent_99", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Leader_Army_Buff_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("sArmy", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Army_Buff", "agent", 1, 8, context)
		effect.trait("C_Leader_Army_Buff", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_01_King ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Clever_Stick", "agent", 2, 4, context)
		effect.trait("C_Leader_Army_Buff", "agent", 2, 1, context)
		effect.trait("C_Leader_Witty", "agent", 1, 8, context)
		effect.trait("C_Personal_Piety", "agent", 1, 8, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 8, context)
		effect.trait("C_Leader_Humanist", "agent", 2, 4, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 8, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 3, 2, context)
		effect.trait("C_Leader_Inbred", "agent", 3, 2, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 8, context)
		effect.trait("C_Leader_Inbred", "agent", 1, 8, context)
		effect.trait("C_Leader_Dullard", "agent", 1, 8, context)
		effect.trait("C_Leader_Natural_King", "agent", 2, 2, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 3, 2, context)
		effect.trait("C_Leader_Favourites", "agent", 6, 4, context)
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 2, context)
		effect.trait("C_Leader_Agent_99", "agent", 3, 2, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 3, 2, context)
		effect.trait("C_Leader_Dullard", "agent", 2, 4, context)
		effect.trait("C_Leader_Mad", "agent", 3, 2, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 8, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 4, context)
		effect.trait("C_Leader_Mad", "agent", 1, 8, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 8, context)
		effect.trait("C_Leader_Merit", "agent", 6, 4, context)
		effect.trait("C_Leader_Agent_99", "agent", 9, 4, context)
		effect.trait("C_Leader_Philistine", "agent", 2, 4, context)
		effect.trait("C_Leader_Debauched", "agent", 3, 2, context)
		effect.trait("C_Leader_Philistine", "agent", 1, 8, context)
		effect.trait("C_Leader_Army_Buff", "agent", 1, 2, context)
		effect.trait("C_Leader_Humanist", "agent", 3, 2, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 2, 4, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 8, context)
		effect.trait("C_Leader_Debauched", "agent", 2, 4, context)
		effect.trait("C_Leader_Mad", "agent", 2, 4, context)
		effect.trait("C_Personal_Piety", "agent", 3, 2, context)
		effect.trait("C_Personal_Piety", "agent", 2, 4, context)
		effect.trait("C_Leader_Uncouth", "agent", 1, 8, context)
		effect.trait("C_Leader_Uncouth", "agent", 3, 2, context)
		effect.trait("C_Leader_Inbred", "agent", 2, 4, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 2, 4, context)
		effect.trait("C_Leader_Uncouth", "agent", 2, 4, context)
		effect.trait("C_Leader_Witty", "agent", 3, 2, context)
		effect.trait("C_Leader_Witty", "agent", 2, 4, context)
		effect.trait("C_Leader_Navy_Buff", "agent", 2, 1, context)
		effect.trait("C_Leader_Favourites", "agent", 6, 2, context)
		effect.trait("C_Leader_Dullard", "agent", 3, 2, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 3, 2, context)
		effect.trait("C_Leader_Philistine", "agent", 3, 2, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 2, 4, context)
		effect.trait("C_Leader_Merit", "agent", 6, 2, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_02_Queen ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeaderFemale(context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Dullard", "agent", 3, 4, context)
		effect.trait("C_Leader_Inbred", "agent", 3, 1, context)
		effect.trait("C_Leader_Agent_99", "agent", 3, 2, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 6, 2, context)
		effect.trait("C_Leader_Dullard", "agent", 3, 2, context)
		effect.trait("C_Leader_Favourites", "agent", 6, 2, context)
		effect.trait("C_Leader_Merit", "agent", 6, 2, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 2, context)
		effect.trait("C_Leader_Agent_99", "agent", 9, 4, context)
		effect.trait("C_Leader_Philistine", "agent", 1, 4, context)
		effect.trait("C_Leader_Inbred", "agent", 3, 2, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 4, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 4, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 6, 2, context)
		effect.trait("C_Leader_Mad", "agent", 3, 1, context)
		effect.trait("C_Leader_Philistine", "agent", 2, 2, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_03_President ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeader(context) and conditions.FactionGovernmentType("gov_republic", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 4, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 3, 1, context)
		effect.trait("C_Leader_Humanist", "agent", 2, 2, context)
		effect.trait("C_Leader_Harsh_Ruler", "agent", 5, 2, context)
		effect.trait("C_Leader_Favourites", "agent", 6, 2, context)
		effect.trait("C_Leader_Natural_President", "agent", 1, 1, context)
		effect.trait("C_Leader_Natural_President", "agent", 2, 2, context)
		effect.trait("C_Leader_Uncouth", "agent", 3, 1, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 4, context)
		effect.trait("C_Leader_Debauched", "agent", 3, 1, context)
		effect.trait("C_Leader_Witty", "agent", 1, 2, context)
		effect.trait("C_Leader_Harsh_Ruler", "agent", 5, 4, context)
		effect.trait("C_Leader_Uncouth", "agent", 2, 2, context)
		effect.trait("C_Leader_Uncouth", "agent", 1, 4, context)
		effect.trait("C_Leader_Merit", "agent", 6, 2, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 2, 2, context)
		effect.trait("C_Leader_Witty", "agent", 1, 4, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 4, context)
		effect.trait("C_Leader_Debauched", "agent", 2, 2, context)
		effect.trait("C_Leader_Humanist", "agent", 3, 1, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 2, 2, context)
		effect.trait("C_Leader_Agent_99", "agent", 9, 2, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_04_Absolutist ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.FactionGovernmentType("gov_absolute_monarchy", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Enlightened_Despot", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_Heir_Inbred_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 1 and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Inbred", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_Heir_Inbred_02 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 2 and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Inbred", "agent", 2, 2, context)
		effect.trait("C_Leader_Inbred", "agent", 1, 100, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_Heir_Inbred_03 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 3 and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Inbred", "agent", 3, 50, context)
		effect.trait("C_Leader_Inbred", "agent", 4, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Enlightened_Despot_Trigger ]]--

events.CharacterFactionCompletesResearch[#events.CharacterFactionCompletesResearch+1] =
function (context)
	if conditions.FactionGovernmentType("gov_absolute_monarchy", context) and (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Enlightened_Despot", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Leader_Harsh_Ruler_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if (conditions.IsFactionLeader(context) or conditions.IsFactionLeaderFemale(context)) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Harsh_Ruler", "agent", 5, 2, context)
		return true
	end
	return false
end

--[[ C_Leader_Intellectual_Pretensions_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("research", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 1, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Intellectual_Pretensions_Trigger_Queen ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("research", context) and conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 1, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_M_Bernard_Lee_Trigger ]]--

events.CharacterFactionSpyAttemptSuccessful[#events.CharacterFactionSpyAttemptSuccessful+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_M", "agent", 1, 1, context)
		effect.trait("C_Leader_M", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_M_Judi_Dench_Trigger ]]--

events.CharacterFactionSpyAttemptSuccessful[#events.CharacterFactionSpyAttemptSuccessful+1] =
function (context)
	if conditions.IsFactionLeaderFemale(context) and (conditions.CharacterCultureType("egy_european", context) or conditions.CharacterCultureType("european", context)) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_M", "agent", 1, 1, context)
		effect.trait("C_Leader_M", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Mr_Waverley_Trigger ]]--

events.CharacterFactionSpyAttemptSuccessful[#events.CharacterFactionSpyAttemptSuccessful+1] =
function (context)
	if conditions.IsFactionLeader(context) and (conditions.CharacterFactionName("ottomans", context) or conditions.CharacterFactionName("egy_ottomans", context)) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Mr_Waverley", "agent", 1, 1, context)
		effect.trait("C_Leader_Mr_Waverley", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Navy_Buff_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("pNavy", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterHasTrait("C_Leader_Army_Buff", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 1, context)
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Philistine_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if not conditions.IsBuildingInChain("sCulture", context) and not conditions.IsBuildingInChain("tEducation", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterHasTrait("C_Leader_Intellectual_Pretensions", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Philistine", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Promoted_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Uncouth", "agent", 1, 2, context)
		effect.trait("C_Leader_Uncouth", "agent", 2, 1, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 2, 1, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 2, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 2, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 2, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 1, context)
		effect.trait("C_Leader_Debauched", "agent", 2, 1, context)
		return true
	end
	return false
end

--[[ C_Leader_Promoted_Trigger_Queen ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeaderFemale(context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CampaignName("tut_napoleon", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 1, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 2, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 2, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Army_Good_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.FactionLeadersTrait("C_Leader_Army_Buff", context) >= 1 and conditions.IsBuildingInChain("sArmy", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Minister_Army_Good", "agent", 1, 2, context)
		effect.trait("C_Minister_Army_Good", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Corrupt_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and conditions.CharacterHoldsPost(context) and conditions.FactionTreasuryWorldPercentage(context) > 5 and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Corrupt", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterMinisterialPosition("royal_heir", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Unjust", "agent", 1, 2, context)
		effect.trait("C_Minister_Corrupt", "agent", 1, 2, context)
		effect.trait("C_Minister_Radical", "agent", 1, 2, context)
		effect.trait("C_Minister_Physiocrat", "agent", 1, 2, context)
		effect.trait("C_Honourable_Service", "agent", 5, 1, context)
		effect.trait("C_Minister_Miser", "agent", 1, 2, context)
		effect.trait("C_Minister_Upright", "agent", 1, 2, context)
		effect.trait("C_Minister_Army_Good", "agent", 1, 2, context)
		effect.trait("C_Minister_Navy_Good", "agent", 1, 2, context)
		effect.trait("C_Minister_Reactionary", "agent", 1, 2, context)
		effect.trait("C_Minister_Fiscal_Genius", "agent", 1, 2, context)
		effect.trait("C_Minister_Entertainer", "agent", 1, 2, context)
		effect.trait("C_Minister_Trader", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Created_Trigger_02 ]]--

events.CharacterCandidateBecomesMinister[#events.CharacterCandidateBecomesMinister+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterMinisterialPosition("royal_heir", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Corrupt", "agent", 1, 2, context)
		effect.trait("C_Minister_Entertainer", "agent", 1, 2, context)
		effect.trait("C_Minister_Physiocrat", "agent", 1, 2, context)
		effect.trait("C_Minister_Navy_Good", "agent", 1, 2, context)
		effect.trait("C_Minister_Unjust", "agent", 1, 2, context)
		effect.trait("C_Minister_Miser", "agent", 1, 2, context)
		effect.trait("C_Minister_Reactionary", "agent", 1, 2, context)
		effect.trait("C_Minister_Fiscal_Genius", "agent", 1, 2, context)
		effect.trait("C_Minister_Army_Good", "agent", 1, 2, context)
		effect.trait("C_Minister_Trader", "agent", 1, 2, context)
		effect.trait("C_Minister_Upright", "agent", 1, 2, context)
		effect.trait("C_Honourable_Service", "agent", 5, 1, context)
		effect.trait("C_Minister_Radical", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Entertainer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("sCulture", context) and conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Entertainer", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Fiscal_Genius_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("admin1_classical_economics", context) or conditions.ResearchType("admin1_national_debt", context) or conditions.ResearchType("economy2_joint_stock_company", context) or conditions.ResearchType("economy3_limited_liability_company", context)) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Minister_Fiscal_Genius", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Industrialist_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("rIron", context) or conditions.IsBuildingInChain("tFactory", context)) and conditions.CharacterType("minister", context) and not conditions.CharacterCultureType("middle_east", context) and conditions.CharacterHoldsPost(context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Industrialist", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Miser_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.PercentageUnspentIncome(context) >= 50 and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Minister_Miser", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Navy_Good_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.FactionLeadersTrait("C_Leader_Navy_Buff", context) >= 1 and conditions.IsBuildingInChain("pNavy", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Minister_Navy_Good", "agent", 1, 1, context)
		effect.trait("C_Minister_Navy_Good", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Physiocrat_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("rFarm", context) or conditions.IsBuildingInChain("rWine", context)) and conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterHasTrait("C_Minister_Industrialist", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Physiocrat", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Trader_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("sRoads", context) or conditions.IsBuildingInChain("pTrade", context)) and conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterHasTrait("C_Minister_Physiocrat", context) and not conditions.IsTheatreGovernor(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) and not conditions.CharacterMinisterialPosition("accident", context) then
		effect.trait("C_Minister_Trader", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Minister_Unjust_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_Minister_Unjust", "agent", 1, 1, context)
		effect.trait("C_Minister_Unjust", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_NTW_General_Grand_Armee_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CampaignName("eur_napoleon", context) or conditions.CampaignName("mp_eur_napoleon", context)) and (conditions.CharacterType("General", context) or conditions.IsFactionLeader(context)) and conditions.CharacterFactionName("france", context) and not conditions.CampaignName("egy_napoleon", context) and not conditions.CampaignName("ita_napoleon", context) then
		effect.trait("C_NTW_General_Grand_Armee", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_NTW_General_Grand_Armee_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if (conditions.CampaignName("eur_napoleon", context) or conditions.CampaignName("mp_eur_napoleon", context)) and conditions.CharacterType("General", context) and conditions.CharacterFactionName("france", context) then
		effect.trait("C_NTW_General_Grand_Armee", "agent", 1, 100, context)
		return true
	end
	return false
end

--[[ C_NTW_General_Looter_Good_Trigger ]]--

events.CharacterLootedSettlement[#events.CharacterLootedSettlement+1] =
function (context)
	if conditions.CharacterType("General", context) then
		effect.trait("C_NTW_General_Looter_Good", "agent", 1, 12, context)
		effect.trait("C_NTW_General_Looter_Good", "agent", 1, 25, context)
		return true
	end
	return false
end

--[[ C_Personal_Hale_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and not conditions.CharacterType("assassin", context) and not conditions.CharacterType("rake", context) and not conditions.InSettlement(context) and not conditions.NoActionThisTurn(context) then
		effect.trait("C_Personal_Hale", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Personal_High_Personal_Security_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if not conditions.CharacterType("minister", context) and not conditions.CharacterType("rake", context) and not conditions.CharacterType("assassin", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) then
		effect.trait("C_Personal_High_Personal_Security", "agent", 1, 2, context)
		effect.trait("C_Personal_High_Personal_Security", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Personal_Sickly_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and not conditions.CharacterType("rake", context) and not conditions.CharacterType("assassin", context) and conditions.InSettlement(context) and conditions.NoActionThisTurn(context) and not conditions.CharacterHasTrait("C_Sausage_Vice", context) then
		effect.trait("C_Personal_Sickly", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Rake_Assassin_Created_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		effect.trait("C_Agent_Spy_Network", "agent", 1, 2, context)
		effect.trait("C_Rake_Assassin_Good", "agent", 1, 2, context)
		effect.trait("C_Rake_Assassin_Good", "agent", 2, 1, context)
		effect.trait("C_Rake_Sabot_Good", "agent", 2, 2, context)
		effect.trait("C_Rake_Spy_Good", "agent", 2, 1, context)
		effect.trait("C_Rake_Spy_Good", "agent", 2, 2, context)
		effect.trait("C_Agent_Spy_Network", "agent", 2, 1, context)
		effect.trait("C_Rake_Sabot_Good", "agent", 2, 1, context)
		return true
	end
	return false
end

--[[ C_Rake_Assassin_Good_Trigger ]]--

events.AssassinationAttemptSuccess[#events.AssassinationAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		effect.trait("C_Rake_Assassin_Good", "agent", 1, 40, context)
		effect.trait("C_Rake_Assassin_Good", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Rake_Counter_Spy_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		effect.trait("C_Rake_Counter_Spy", "agent", 1, 12, context)
		effect.trait("C_Rake_Counter_Spy", "agent", 1, 40, context)
		return true
	end
	return false
end

--[[ C_Rake_Created_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("rake", context) then
		effect.trait("C_Rake_Im_A_Laydee", "agent", 1, 1, context)
		effect.trait("C_Rake_Born_Bounder", "agent", 2, 1, context)
		effect.trait("C_Rake_Im_A_Laydee", "agent", 1, 1, context)
		effect.trait("C_Rake_Born_Bounder", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Rake_Sabot_Good_Trigger ]]--

events.SabotageAttemptSuccess[#events.SabotageAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		effect.trait("C_Rake_Sabot_Good", "agent", 1, 40, context)
		effect.trait("C_Rake_Sabot_Good", "agent", 1, 12, context)
		return true
	end
	return false
end

--[[ C_Rake_Spy_Good_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) then
		effect.trait("C_Rake_Spy_Good", "agent", 1, 12, context)
		effect.trait("C_Rake_Spy_Good", "agent", 1, 40, context)
		return true
	end
	return false
end

--[[ C_Sausage_Vice_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.InSettlement(context) and conditions.NoActionThisTurn(context) and not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and not conditions.CharacterHasTrait("C_Personal_Sickly", context) then
		effect.trait("C_Sausage_Vice", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Guerrillero_Bandit_Trigger ]]--

events.HarassmentAttemptSuccess[#events.HarassmentAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("guerilla", context) then
		effect.trait("Spain_C_Agent_Guerrillero_Bandit", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Guerrillero_Dead_Family_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsGuerrillaGeneral(context) and conditions.CharacterFactionName("spa_spain", context) and not conditions.CharacterWonBattle(context) then
		effect.trait("Spain_C_Agent_Guerrillero_Dead_Family", "agent", 1, 2, context)
		effect.trait("Spain_C_Agent_Guerrillero_Dead_Family", "agent", 2, 1, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Guerrillero_Former_Soldier_Trigger ]]--

events.SabotageAttemptSuccess[#events.SabotageAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("guerilla", context) then
		effect.trait("Spain_C_Agent_Guerrillero_Former_Soldier", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Guerrillero_Torturer_Trigger ]]--

events.AssassinationAttemptSuccess[#events.AssassinationAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("guerilla", context) then
		effect.trait("Spain_C_Agent_Guerrillero_Torturer", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Priest_Patriot_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if conditions.CharacterType("Catholic_Missionary", context) and (conditions.CharacterFactionName("spa_spain", context) or conditions.CharacterFactionName("spa_portugal", context)) then
		effect.trait("Spain_C_Agent_Priest_Patriot", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Priest_Politics_Trigger ]]--

events.FactionTurnEnd[#events.FactionTurnEnd+1] =
function (context)
	if (conditions.FactionTechExists("spa_france","admin5_complete_annexation", context) or conditions.FactionTechExists("spa_france","admin4_repressive_measures", context) or conditions.FactionTechExists("spa_france","military3_counter_guerrilla_initiatives", context)) then
		effect.trait("Spain_C_Agent_Priest_Politics", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Provocateur_Dirty_Fighter_Trigger ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterWonDuel(context) and (conditions.CharacterType("Protestant_Missionary", context) or conditions.CharacterType("orthodox_missionary", context)) then
		effect.trait("Spain_C_Agent_Provocateur_Dirty_Fighter", "agent", 1, 2, context)
		effect.trait("Spain_C_Agent_Provocateur_Dirty_Fighter", "agent", 2, 1, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Provocateur_Pure_Blood_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("Protestant_Missionary", context) and conditions.CharacterFactionName("spa_britain", context) and not conditions.CharacterHasAncillary("Ancillary_Duelling_Hidalgo_Fop", context) then
		effect.trait("Spain_C_Agent_Provocateur_Pure_Blood", "agent", 1, 2, context)
		effect.trait("Spain_C_Agent_Provocateur_Pure_Blood", "agent", 2, 1, context)
		return true
	end
	return false
end

--[[ Spain_C_Agent_Provocateur_Radical_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("orthodox_missionary", context) and conditions.CharacterFactionName("spa_france", context) then
		effect.trait("Spain_C_Agent_Provocateur_Radical", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ Spain_C_General_Guerrilla_Leader_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsGuerrillaGeneral(context) and conditions.CharacterFactionName("spa_spain", context) and conditions.CharacterWonBattle(context) then
		effect.trait("Spain_C_General_Guerrilla_Leader", "agent", 1, 8, context)
		return true
	end
	return false
end

