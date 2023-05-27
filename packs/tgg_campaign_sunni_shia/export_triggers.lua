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
	if conditions.CharacterType("admiral", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Attacker_Bad", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Attacker_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Attacker_Good", "agent", 1, 50, context)
		effect.trait("C_Admiral_Attacker_Good", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Bad", "agent", 1, 17, context)
		effect.trait("C_Admiral_Boring_Speaker", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Blockade_Runner_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CampaignBattleType("naval_breakout", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Blockade_Runner_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Blockader_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CampaignBattleType("naval_blockade", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Blockader_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Brave_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CommanderFoughtInBattle(context) and not conditions.CharacterRouted(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Brave", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_British_Drakes_Drum_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("britain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 33, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 33, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_British_Drakes_Drum_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("britain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context)  and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 33, context)
		effect.trait("C_Admiral_Attacker_Bad", "agent", 1, 33, context)
		effect.trait("C_Admiral_British_Drakes_Drum", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Coward_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterRouted(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Coward", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 33, context)
		effect.trait("C_Admiral_Brave", "agent", 1, 17, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 17, context)
		effect.trait("C_Admiral_Mathematician", "agent", 1, 17, context)
		effect.trait("C_Admiral_Mathematician", "agent", 1, 17, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 33, context)
		effect.trait("C_Admiral_Rated_Ships", "agent", 2, 17, context)
		effect.trait("C_Admiral_Drunkard", "agent", 2, 17, context)
		effect.trait("C_Admiral_Coward", "agent", 1, 17, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 33, context)
		effect.trait("C_Admiral_Cruisers", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Created_Trigger_01A_spam ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) > 15 then
		effect.trait("C_Admiral_Drunkard", "agent", 2, 17, context)
		effect.trait("C_Admiral_Brave", "agent", 1, 17, context)
		effect.trait("C_Admiral_Coward", "agent", 1, 17, context)
		effect.trait("C_Admiral_Drunkard", "agent", 2, 17, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Created_Trigger_01B_spam_Favs ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) > 15 and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 then
		effect.trait("C_Admiral_Bad", "agent", 4, 33, context)
		effect.trait("C_Admiral_Bad", "agent", 4, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Cruisers_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("naval_frigate", context) >= 50 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Cruisers", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Defend_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Defender_Bad", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Defend_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Defender_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Drunkard_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterFactionName("mughal", context) then
		effect.trait("C_Admiral_Drunkard", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Dutch_Seamanship_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("netherlands", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 33, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 33, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Dutch_Seamanship_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("netherlands", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 33, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 33, context)
		effect.trait("C_Admiral_Dutch_Seamanship", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Lampooned_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterWonBattle(context) and (conditions.BattleResult("crushing_defeat", context) or conditions.CampaignPercentageOfOwnRouted(context) >= 50 or conditions.CampaignPercentageOfOwnKilled(context) >= 50 or conditions.CampaignPercentageOfOwnCaptured(context) >= 30) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Lampooned", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Mad_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterTurnsAtSea(context) > 15 and conditions.BattlesFought(context) == 5 and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Mad", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Admiral_Press_Hero_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and (conditions.BattleResult("heroic_victory", context) or conditions.CampaignPercentageOfThemRouted(context) >= 50 or conditions.CampaignPercentageOfThemKilled(context) >= 50 or conditions.CampaignPercentageOfThemCaptured(context) >= 30) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Press_Hero", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Leader_Benefits_01 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Leader_Merit", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Leader_Penalty_01 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) > 15 then
		effect.trait("C_Leader_Favourites", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Rated_Ships", "agent", 3, 17, context)
		effect.trait("C_Admiral_Martinet", "agent", 1, 17, context)
		effect.trait("C_Admiral_Mad", "agent", 1, 17, context)
		effect.trait("C_Admiral_Brave", "agent", 1, 17, context)
		effect.trait("C_Admiral_Good", "agent", 1, 33, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 33, context)
		effect.trait("C_Admiral_Slacker", "agent", 2, 17, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 17, context)
		effect.trait("C_Admiral_Drunkard", "agent", 2, 17, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 33, context)
		effect.trait("C_Admiral_Good", "agent", 1, 33, context)
		effect.trait("C_Admiral_Good", "agent", 1, 33, context)
		effect.trait("C_Admiral_Cruisers", "agent", 3, 17, context)
		effect.trait("C_Admiral_Martinet", "agent", 2, 17, context)
		effect.trait("C_Admiral_Rated_Ships", "agent", 2, 17, context)
		effect.trait("C_Admiral_Cruisers", "agent", 2, 17, context)
		effect.trait("C_Admiral_Drunkard", "agent", 2, 17, context)
		effect.trait("C_Admiral_Sobriety", "agent", 1, 17, context)
		effect.trait("C_Admiral_Martinet", "agent", 4, 17, context)
		effect.trait("C_Admiral_Boring_Speaker", "agent", 1, 17, context)
		effect.trait("C_Admiral_Born_Sailor", "agent", 1, 33, context)
		effect.trait("C_Admiral_Slacker", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Trigger_02a_Merit ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 and conditions.FactionLeadersTrait("C_Leader_Merit", context) then
		effect.trait("C_Admiral_Good", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Trigger_02A_spam ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) > 15 then
		effect.trait("C_Admiral_Good", "agent", 1, 17, context)
		effect.trait("C_Admiral_Drunkard", "agent", 2, 8, context)
		effect.trait("C_Admiral_Bad", "agent", 1, 17, context)
		effect.trait("C_Admiral_Brave", "agent", 1, 17, context)
		effect.trait("C_Admiral_Drunkard", "agent", 2, 8, context)
		effect.trait("C_Admiral_Martinet", "agent", 2, 33, context)
		effect.trait("C_Admiral_Martinet", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Promoted_Trigger_02B_spam_Favs ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) > 15 and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 then
		effect.trait("C_Admiral_Bad", "agent", 4, 50, context)
		effect.trait("C_Admiral_Bad", "agent", 4, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Rated_Ships_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("naval_line_of_battle", context) >= 50 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Rated_Ships", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Admiral_Spanish_National_Pride_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("spain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context)and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 33, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 33, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Spanish_National_Pride_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CharacterFactionName("spain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionAdmiralCount(context) <= 15 then
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 33, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 33, context)
		effect.trait("C_Admiral_Spanish_National_Pride", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Admiral_Swashbuckling_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("admiral", context) and conditions.CommanderFoughtInMelee(context) and not conditions.CharacterRouted(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Admiral_Swashbuckling", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Agent_Secret_Police_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterTurnsAtHome(context) > 1 and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Agent_Secret_Police", "agent", 1, 8, context)
		effect.trait("C_Agent_Secret_Police", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Agent_Spy_Network_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterTurnsInEnemyLands(context) > 2 and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Agent_Spy_Network", "agent", 1, 8, context)
		effect.trait("C_Agent_Spy_Network", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Agent_Spy_Network_Trigger_02_removal ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("rake", context) and conditions.CharacterTurnsInEnemyLands(context) > 2 and not conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.RandomPercentCampaign(50, context) then
		effect.remove_trait("C_Agent_Spy_Network", "agent", context)
		return true
	end
	return false
end

--[[ C_Feck_Vice_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.NoActionThisTurn(context) and conditions.InSettlement(context) and not conditions.CharacterType("catholic_missionary", context) and not conditions.CharacterType("indian_missionary", context) and not conditions.CharacterType("middle_east_missionary", context) and not conditions.CharacterType("shaman", context) and not conditions.CharacterType("orthodox_missionary", context) and not conditions.CharacterType("Protestant_Missionary", context) and not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Feck_Vice", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Feck_Vice_Trigger_Minister ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.NoActionThisTurn(context) and conditions.InSettlement(context) and conditions.CharacterType("minister", context) and conditions.CharacterTrait("C_Personal_Piety", context) <= 1 and conditions.CharacterHoldsPost(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Feck_Vice", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_General_Ambush_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("land_ambush", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Ambusher_Bad", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Ambush_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("land_ambush", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Ambush_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_Americas_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInTheatre(1, context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Americas_Bad", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Americas_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInTheatre(1, context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Americas_Good", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Attacker_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Attacker_Bad", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Attacker_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Attacker_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_Austrian_Hates_Ottomans_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("austria", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 33, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 33, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Austrian_Hates_Ottomans_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("austria", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 33, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 33, context)
		effect.trait("C_General_Austrian_Hates_Ottomans", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Bad_Field_Commander_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("normal", context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Bad_Field_Commander", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Bloody_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfOwnKilled(context) > 40 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Bloody", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Brave_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CommanderFoughtInBattle(context) and not conditions.CharacterRouted(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Brave", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Coward_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterRouted(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Coward", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Slacker", "agent", 2, 17, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 2, 17, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_General_Drunkard", "agent", 2, 17, context)
		effect.trait("C_General_Ambush_Good", "agent", 1, 3, context)
		effect.trait("C_General_Brave", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger_01A_spam ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Drunkard", "agent", 2, 33, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 17, context)
		effect.trait("C_General_Martinet", "agent", 2, 17, context)
		effect.trait("C_General_Martinet", "agent", 1, 33, context)
		effect.trait("C_General_Drunkard", "agent", 2, 17, context)
		effect.trait("C_General_Mad", "agent", 1, 17, context)
		effect.trait("C_General_Slacker", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger_01B_spam_Favs ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Bad_Field_Commander", "agent", 3, 50, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 4, 50, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger_02_Warlords ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Created_Trigger_02A_Warlords_spam ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 then
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Defender_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Defender_Bad", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Defender_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Defender_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_Drunkard_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterFactionName("mughal", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Drunkard", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_General_French_Elan_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("france", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_French_Elan", "agent", 1, 33, context)
		effect.trait("C_General_French_Elan", "agent", 1, 33, context)
		effect.trait("C_General_French_Elan", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_French_Elan_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("france", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_French_Elan", "agent", 1, 33, context)
		effect.trait("C_General_French_Elan", "agent", 1, 33, context)
		effect.trait("C_General_French_Elan", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Good_Field_Commander_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignBattleType("normal", context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_India_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInTheatre(3, context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_India_Bad", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_India_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInTheatre(3, context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_India_Good", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Lampooned_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWonBattle(context) and (conditions.BattleResult("crushing_defeat", context) or conditions.CampaignPercentageOfOwnRouted(context) >= 50 or conditions.CampaignPercentageOfOwnKilled(context) >= 50 or conditions.CampaignPercentageOfOwnCaptured(context) >= 30) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Lampooned", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Mad_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterTurnsInEnemyLands(context) > 15 and conditions.BattlesFought(5, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Mad", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_General_Mughal_Anti_European_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("mughal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Mughal_Anti_European", "agent", 1, 33, context)
		effect.trait("C_General_Mughal_Anti_European", "agent", 1, 33, context)
		effect.trait("C_General_Mughal_Anti_European", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Mughal_Anti_European_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("mughal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Mughal_Anti_European", "agent", 1, 33, context)
		effect.trait("C_General_Mughal_Anti_European", "agent", 1, 33, context)
		effect.trait("C_General_Mughal_Anti_European", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_of_Artillery_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("artillery", context) >= 40 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_of_Artillery", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_of_Cavalry_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_of_Cavalry", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_of_Infantry_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("infantry", context) >= 40 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_of_Infantry", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_Polish_Stubborn_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("poland_lithuania", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 33, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 33, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Polish_Stubborn_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("poland_lithuania", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 33, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 33, context)
		effect.trait("C_General_Polish_Stubborn", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Press_Hero_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and (conditions.BattleResult("heroic_victory", context) or conditions.CampaignPercentageOfThemRouted(context) >= 50 or conditions.CampaignPercentageOfThemKilled(context) >= 50 or conditions.CampaignPercentageOfThemCaptured(context) >= 30) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Press_Hero", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Leader_Benefits_01 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Merit", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Leader_Penalty_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Favourites", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_03 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Coward", "agent", 1, 17, context)
		effect.trait("C_General_Brave", "agent", 1, 17, context)
		effect.trait("C_General_Ambush_Good", "agent", 1, 3, context)
		effect.trait("C_General_Drunkard", "agent", 2, 17, context)
		effect.trait("C_General_Mad", "agent", 1, 17, context)
		effect.trait("C_General_Brave", "agent", 1, 17, context)
		effect.trait("C_General_Drunkard", "agent", 2, 17, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 2, 17, context)
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 33, context)
		effect.trait("C_General_Martinet", "agent", 1, 17, context)
		effect.trait("C_General_Martinet", "agent", 1, 17, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_General_Slacker", "agent", 1, 17, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_03a_Merit ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 and conditions.FactionLeadersTrait("C_Leader_Merit", context) >= 1 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Good_Field_Commander", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_03A_spam ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Martinet", "agent", 4, 17, context)
		effect.trait("C_General_Mad", "agent", 1, 17, context)
		effect.trait("C_General_Martinet", "agent", 1, 33, context)
		effect.trait("C_General_Mad", "agent", 1, 17, context)
		effect.trait("C_General_Drunkard", "agent", 2, 17, context)
		effect.trait("C_General_Drunkard", "agent", 2, 33, context)
		effect.trait("C_General_Born_Soldier", "agent", 1, 17, context)
		effect.trait("C_General_Martinet", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_03B_spam_Favs ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 and conditions.FactionLeadersTrait("C_Leader_Favourites", context) >= 1 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Bad_Field_Commander", "agent", 3, 33, context)
		effect.trait("C_General_Bad_Field_Commander", "agent", 4, 33, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_04_Warlord ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		effect.trait("C_General_Warlord", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_Promoted_Trigger_04A_Warlord_spam ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) > 15 then
		effect.trait("C_General_Warlord", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Prussian_Blue_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("prussia", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Prussian_Blue", "agent", 1, 33, context)
		effect.trait("C_General_Prussian_Blue", "agent", 1, 33, context)
		effect.trait("C_General_Prussian_Blue", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Prussian_Blue_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("prussia", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Prussian_Blue", "agent", 1, 33, context)
		effect.trait("C_General_Prussian_Blue", "agent", 1, 33, context)
		effect.trait("C_General_Prussian_Blue", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Russian_Vodka_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("russia", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Russian_Vodka", "agent", 1, 33, context)
		effect.trait("C_General_Russian_Vodka", "agent", 1, 33, context)
		effect.trait("C_General_Russian_Vodka", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Russian_Vodka_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("russia", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Russian_Vodka", "agent", 1, 33, context)
		effect.trait("C_General_Russian_Vodka", "agent", 1, 33, context)
		effect.trait("C_General_Russian_Vodka", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Scout_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterWonBattle(context) and conditions.CharacterMPPercentageRemaining(context) <= 5 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Scout", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Attack_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Siege_Attack_Bad", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Attack_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Siege_Attack_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Defend_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Siege_Defend_Bad", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Siege_Defend_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_General_Siege_Defend_Good", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Swedish_Aggression_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("sweden", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 33, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 33, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Swedish_Aggression_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("sweden", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 33, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 33, context)
		effect.trait("C_General_Swedish_Aggression", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Turkish_Master_Gunner_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("ottomans", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 33, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 33, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Turkish_Master_Gunner_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("ottomans", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 33, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 33, context)
		effect.trait("C_General_Turkish_Master_Gunner", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_US_Backwoodsman_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("united_states", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_US_Backwoodsman", "agent", 1, 33, context)
		effect.trait("C_General_US_Backwoodsman", "agent", 1, 33, context)
		effect.trait("C_General_US_Backwoodsman", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_US_Backwoodsman_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("united_states", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_General_US_Backwoodsman", "agent", 1, 33, context)
		effect.trait("C_General_US_Backwoodsman", "agent", 1, 33, context)
		effect.trait("C_General_US_Backwoodsman", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_General_Warlord_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal", context) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_General_Warlord", "agent", 2, 20, context)
		effect.trait("C_General_Warlord", "agent", 2, 10, context)
		effect.trait("C_General_Warlord", "agent", 2, 10, context)
		return true
	end
	return false
end

--[[ C_Gent_Academic_Honours_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.CharacterAttribute("research", context) >= 3 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Academic_Honours", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Academic_Honours", "agent", 1, 17, context)
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 33, context)
		effect.trait("C_Gent_Science_Club", "agent", 1, 17, context)
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 33, context)
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 17, context)
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_02_Agriculture ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionLeadersTrait("C_Leader_Huntin_Shootin_Fishin", context) >= 1 then
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 8, context)
		effect.trait("C_Gent_Research_Agriculture", "agent", 2, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_03_economics ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionLeadersTrait("C_Leader_Clever_Stick", context) >= 1 then
		effect.trait("C_Gent_Research_Economics", "agent", 1, 8, context)
		effect.trait("C_Gent_Research_Economics", "agent", 2, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_04_industry ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionLeadersTrait("C_Leader_Huntin_Shootin_Fishin", context) < 1 then
		effect.trait("C_Gent_Research_Industry", "agent", 2, 8, context)
		effect.trait("C_Gent_Research_Industry", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_05_military ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionLeadersTrait("C_Leader_Army_Buff", context) >= 1 then
		effect.trait("C_Gent_Research_Military", "agent", 2, 8, context)
		effect.trait("C_Gent_Research_Military", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_06_navy ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionLeadersTrait("C_Leader_Navy_Buff", context) >= 1 then
		effect.trait("C_Gent_Research_Navy", "agent", 1, 8, context)
		effect.trait("C_Gent_Research_Navy", "agent", 2, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Created_Trigger_07_philosophy ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionLeadersTrait("C_Leader_Intellectual_Pretensions", context) >= 1 then
		effect.trait("C_Gent_Research_Philosophy", "agent", 2, 8, context)
		effect.trait("C_Gent_Research_Philosophy", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Gent_Duelling_Pistol_Trigger_01 ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterDuelWeapon("duelling_pistols", context) and conditions.CharacterWonDuel(context) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 33, context)
		effect.trait("C_Gent_Duelling_Pistol", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Duelling_Sword_Trigger_01 ]]--

events.DuelFought[#events.DuelFought+1] =
function (context)
	if conditions.CharacterDuelWeapon("duelling_sword", context) and conditions.CharacterWonDuel(context) and (conditions.CharacterType("gentleman", context) or conditions.CharacterType("rake", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 33, context)
		effect.trait("C_Gent_Duelling_Sword", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Agriculture_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and (conditions.ResearchType("industry_agriculture_advanced_irrigation", context) or conditions.ResearchType("industry_agriculture_common_land_enclosures", context) or conditions.ResearchType("industry_agriculture_four_field_crop_rotation", context) or conditions.ResearchType("industry_agriculture_improved_animal_husbandry", context) or conditions.ResearchType("industry_agriculture_seed_planting_drill", context) or conditions.ResearchType("industry_agriculture_selective_breeding", context) or conditions.ResearchType("industry_agriculture_steam-pumped_land_drainage", context) or conditions.ResearchType("industry_agriculture_threshing_machine", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 17, context)
		effect.trait("C_Gent_Research_Agriculture", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Economics_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and (conditions.ResearchType("enlightenment_joint_stock_companies", context) or conditions.ResearchType("enlightenment_free_trade_doctrine", context) or conditions.ResearchType("enlightenment_abolition_of_slavery", context) or conditions.ResearchType("enlightenment_national_debt", context) or conditions.ResearchType("enlightenment_division_of_labour", context) or conditions.ResearchType("enlightenment_wealth_of_nations", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Research_Economics", "agent", 1, 17, context)
		effect.trait("C_Gent_Research_Economics", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Industry_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.ResearchCategory("industry", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Research_Industry", "agent", 1, 17, context)
		effect.trait("C_Gent_Research_Industry", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Military_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.ResearchCategory("military", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Research_Military", "agent", 1, 17, context)
		effect.trait("C_Gent_Research_Military", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Navy_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.ResearchCategory("navy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Research_Navy", "agent", 1, 17, context)
		effect.trait("C_Gent_Research_Navy", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Research_Philosophy_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.CharacterType("gentleman", context) or conditions.CharacterType("Eastern_Scholar", context)) and conditions.ResearchCategory("enlightenment", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Research_Philosophy", "agent", 1, 17, context)
		effect.trait("C_Gent_Research_Philosophy", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Gent_Science_Club_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("gentleman", context) and conditions.ResearchCategory("industry", context) and conditions.FactionLeadersTrait("C_Leader_Clever_Stick", context) >= 1 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Gent_Science_Club", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_George_Washington_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterForename("names_name_names_englishGeorge", context) and conditions.CharacterSurname("names_name_names_englishWashington", context) and conditions.CharacterWonBattle(context) and conditions.CommanderFoughtInBattle(context) and conditions.CampaignName("episode_5", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CampaignName("main", context) and not conditions.CampaignName("main_2", context) then
		effect.trait("C_General_Americas_Good", "agent", 4, 100, context)
		effect.trait("C_General_Brave", "agent", 3, 100, context)
		return true
	end
	return false
end

--[[ C_Leader_Agent_99_Trigger ]]--

events.SufferSpyingAttempt[#events.SufferSpyingAttempt+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Agent_99", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Army_Buff_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("army-admin", context) or conditions.IsBuildingInChain("ordnance", context)) and conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("indian", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Army_Buff", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_01_King ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 17, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 17, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 8, context)
		effect.trait("C_Leader_Army_Buff", "agent", 1, 17, context)
		effect.trait("C_Leader_Uncouth", "agent", 1, 17, context)
		effect.trait("C_Leader_Witty", "agent", 1, 17, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 17, context)
		effect.trait("C_Leader_Dullard", "agent", 1, 17, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Uncouth", "agent", 2, 17, context)
		effect.trait("C_Leader_Uncouth", "agent", 3, 17, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 8, context)
		effect.trait("C_Leader_Dullard", "agent", 1, 17, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 8, context)
		effect.trait("C_Leader_Philistine", "agent", 2, 17, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 33, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 8, context)
		effect.trait("C_Leader_Witty", "agent", 1, 17, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 17, context)
		effect.trait("C_Leader_Mad", "agent", 2, 10, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 8, context)
		effect.trait("C_Leader_Mad", "agent", 4, 10, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 17, context)
		effect.trait("C_Leader_Inbred", "agent", 1, 5, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 8, context)
		effect.trait("C_Leader_Mad", "agent", 1, 10, context)
		effect.trait("C_Leader_Dullard", "agent", 1, 17, context)
		effect.trait("C_Leader_Philistine", "agent", 1, 17, context)
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_02_Queen ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Natural_King", "agent", 1, 33, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 17, context)
		effect.trait("C_Leader_Mad", "agent", 2, 8, context)
		effect.trait("C_Leader_Mad", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_03_President ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionGovernmentType("gov_republic", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 8, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Uncouth", "agent", 1, 17, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 8, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 17, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 17, context)
		effect.trait("C_Leader_Natural_President", "agent", 1, 33, context)
		effect.trait("C_Leader_Witty", "agent", 1, 33, context)
		effect.trait("C_Leader_Witty", "agent", 1, 17, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Army_Buff", "agent", 1, 17, context)
		effect.trait("C_Leader_Dullard", "agent", 1, 8, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Natural_President", "agent", 1, 17, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 17, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 17, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 17, context)
		effect.trait("C_Leader_Philistine", "agent", 1, 17, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 17, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 17, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Dullard", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_04_Heir_not_inbred_yet ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 1 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Inbred", "agent", 1, 5, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_04a_Heir_inbred_1 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 1 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Inbred", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_04b_Heir_inbred_2 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 2 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Inbred", "agent", 2, 17, context)
		effect.trait("C_Leader_Inbred", "agent", 1, 100, context)
		return true
	end
	return false
end

--[[ C_Leader_Created_Trigger_04c_Heir_inbred_3 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("royal_heir", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and conditions.FactionLeadersTrait("C_Leader_Inbred", context) == 3 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Inbred", "agent", 3, 100, context)
		effect.trait("C_Leader_Inbred", "agent", 4, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Enlightened_Despot_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchCategory("enlightenment", context) or conditions.ResearchCategory("industry", context)) and conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Enlightened_Despot", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Harsh_Ruler_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Harsh_Ruler", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Leader_Intellectual_Pretensions_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("education", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Leader_M_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_M", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Navy_Buff_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("navy-admin", context) or conditions.IsBuildingInChain("ordnance", context)) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Philistine_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("education", context) and conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CharacterTrait("C_Leader_Intellectual_Pretensions", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Philistine", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Promoted_Trigger_01_King ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.IsFactionLeader(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 8, context)
		effect.trait("C_Leader_Witty", "agent", 1, 17, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 8, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 17, context)
		effect.trait("C_Leader_Army_Buff", "agent", 1, 17, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Debauched", "agent", 1, 17, context)
		effect.trait("C_Leader_Witty", "agent", 1, 17, context)
		effect.trait("C_Leader_Navy_Buff", "agent", 1, 17, context)
		effect.trait("C_Leader_Humanist", "agent", 1, 8, context)
		effect.trait("C_Leader_Philistine", "agent", 1, 17, context)
		effect.trait("C_Leader_Mad", "agent", 1, 10, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 17, context)
		effect.trait("C_Leader_Intellectual_Pretensions", "agent", 1, 8, context)
		effect.trait("C_Leader_Uncouth", "agent", 1, 17, context)
		effect.trait("C_Leader_Clever_Stick", "agent", 1, 17, context)
		effect.trait("C_Leader_Huntin_Shootin_Fishin", "agent", 1, 17, context)
		effect.trait("C_Leader_Foreign_Tastes", "agent", 1, 17, context)
		effect.trait("C_Leader_Uncouth", "agent", 2, 17, context)
		effect.trait("C_Leader_Philistine", "agent", 2, 17, context)
		effect.trait("C_Leader_Philistine", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Leader_Promoted_Trigger_02_Queen ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.FactionGovernmentType("gov_republic", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Leader_Natural_King", "agent", 1, 17, context)
		effect.trait("C_Leader_Natural_King", "agent", 1, 33, context)
		effect.trait("C_Leader_Mad", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Army_Good_Trigger_01 ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.FactionLeadersTrait("C_Leader_Army_Buff", context) >= 1 and conditions.IsBuildingInChain("army-admin", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Army_Good", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Army_job_Trigger_02_Army ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("army", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Army_Good", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Corrupt_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.FactionTreasuryWorldPercentage(context) > 5 and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Corrupt", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Created_Trigger_01_Basic ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("minister", context) and not conditions.IsFactionLeader(context) and not conditions.IsFactionLeaderFemale(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Industrialist", "agent", 2, 17, context)
		effect.trait("C_Minister_Upright", "agent", 2, 17, context)
		effect.trait("C_Minister_Navy_Good", "agent", 2, 17, context)
		effect.trait("C_Minister_Reactionary", "agent", 1, 17, context)
		effect.trait("C_Feck_Vice", "agent", 1, 2, context)
		effect.trait("C_Minister_Unjust", "agent", 2, 17, context)
		effect.trait("C_Minister_Entertainer", "agent", 2, 17, context)
		effect.trait("C_Minister_Trader", "agent", 2, 17, context)
		effect.trait("C_Personal_Piety", "agent", 1, 17, context)
		effect.trait("C_Minister_Miser", "agent", 2, 8, context)
		effect.trait("C_Minister_Corrupt", "agent", 1, 4, context)
		effect.trait("C_Minister_Radical", "agent", 1, 17, context)
		effect.trait("C_Minister_Entertainer", "agent", 2, 17, context)
		effect.trait("C_Minister_Fiscal_Genius", "agent", 2, 17, context)
		effect.trait("C_Minister_Physiocrat", "agent", 2, 17, context)
		effect.trait("C_Minister_Army_Good", "agent", 2, 17, context)
		effect.trait("C_Sausage_Vice", "agent", 2, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Entertainer_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("happiness", context) or conditions.IsBuildingInChain("culture", context)) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("head_of_government", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Entertainer", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Minister_Finance_Job_Trigger_03_Finance ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Trader", "agent", 1, 1, context)
		effect.trait("C_Minister_Fiscal_Genius", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Fiscal_Genius_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("enlightenment_joint_stock_companies", context) or conditions.ResearchType("enlightenment_free_trade_doctrine", context) or conditions.ResearchType("enlightenment_abolition_of_slavery", context) or conditions.ResearchType("enlightenment_national_debt", context) or conditions.ResearchType("enlightenment_division_of_labour", context) or conditions.ResearchType("enlightenment_wealth_of_nations", context)) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Fiscal_Genius", "agent", 1, 5, context)
		return true
	end
	return false
end

--[[ C_Minister_Head_Job_Trigger_04_Head ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("head_of_government", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Corrupt", "agent", 1, 1, context)
		effect.trait("C_Minister_Unjust", "agent", 1, 1, context)
		effect.trait("C_Minister_Reactionary", "agent", 1, 1, context)
		effect.trait("C_Minister_Radical", "agent", 1, 1, context)
		effect.trait("C_Minister_Upright", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Industrialist_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("industry-metal", context) or conditions.IsBuildingInChain("industry-pottery", context) or conditions.IsBuildingInChain("industry-textile", context)) and conditions.CharacterType("minister", context) and not conditions.CharacterCultureType("middle_east", context) and not conditions.CharacterCultureType("indian", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Industrialist", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Justice_Job_Trigger_05_Justice ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Upright", "agent", 1, 1, context)
		effect.trait("C_Minister_Unjust", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Miser_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("finance", context) and conditions.PercentageUnspentIncome(context) >= 50 and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Miser", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Navy_Good_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("navy-admin", context) and conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Navy_Good", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Navy_Job_Trigger_06_Navy ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("navy", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Navy_Good", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Minister_Physiocrat_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("industry_agriculture_advanced_irrigation", context) or conditions.ResearchType("industry_agriculture_common_land_enclosures", context) or conditions.ResearchType("industry_agriculture_four_field_crop_rotation", context) or conditions.ResearchType("industry_agriculture_improved_animal_husbandry", context) or conditions.ResearchType("industry_agriculture_seed_planting_drill", context) or conditions.ResearchType("industry_agriculture_selective_breeding", context) or conditions.ResearchType("industry_agriculture_steam-pumped_land_drainage", context) or conditions.ResearchType("industry_agriculture_threshing_machine", context)) and conditions.CharacterType("minister", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterHoldsPost(context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Physiocrat", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Trader_Trigger_01 ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if (conditions.ResearchType("enlightenment_joint_stock_companies", context) or conditions.ResearchType("enlightenment_free_trade_doctrine", context) or conditions.ResearchType("enlightenment_abolition_of_slavery", context) or conditions.ResearchType("enlightenment_national_debt", context) or conditions.ResearchType("enlightenment_division_of_labour", context) or conditions.ResearchType("enlightenment_wealth_of_nations", context)) and conditions.CharacterType("minister", context) and conditions.CharacterHoldsPost(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Trader", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Minister_Unjust_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.CharacterMinisterialPosition("justice", context) and conditions.InsurrectionCrushed(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and conditions.CharacterIsLocalCampaign(context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Minister_Unjust", "agent", 1, 1, context)
		effect.trait("C_Minister_Unjust", "agent", 1, 1, context)
		return true
	end
	return false
end

--[[ C_Missionary_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("indian_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("Protestant_Missionary", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Touched_By_God", "agent", 1, 17, context)
		effect.trait("C_Personal_Piety", "agent", 1, 17, context)
		effect.trait("C_Personal_Piety", "agent", 1, 33, context)
		effect.trait("C_Personal_Piety", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Missionary_Gone_Native_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(1, context) and (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("indian_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("Protestant_Missionary", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Gone_Native", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Missionary_Hate_America_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(1, context) and (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("indian_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("Protestant_Missionary", context)) and conditions.RandomPercentCampaign(15, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Hate_America", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Missionary_Hate_Europe_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(2, context) and (conditions.CharacterType("indian_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Hate_Europe", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Missionary_Hate_India_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(3, context) and (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("Protestant_Missionary", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Hate_India", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Missionary_Like_America_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(1, context) and (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("indian_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("Protestant_Missionary", context)) and conditions.RandomPercentCampaign(50, context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Like_America", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Missionary_Like_Europe_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(2, context) and (conditions.CharacterType("indian_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Like_Europe", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Missionary_Like_India_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterInTheatre(3, context) and (conditions.CharacterType("catholic_missionary", context) or conditions.CharacterType("middle_east_missionary", context) or conditions.CharacterType("shaman", context) or conditions.CharacterType("orthodox_missionary", context) or conditions.CharacterType("Protestant_Missionary", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Missionary_Like_India", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Personal_Hale_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and not conditions.InSettlement(context) and not conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Personal_Hale", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Personal_High_Personal_Security_Trigger ]]--

events.SufferAssassinationAttempt[#events.SufferAssassinationAttempt+1] =
function (context)
	if not conditions.CharacterType("minister", context) and not conditions.CharacterType("rake", context) and not conditions.CharacterType("assassin", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Personal_High_Personal_Security", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Personal_Sickly_Trigger_01 ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and conditions.InSettlement(context) and conditions.NoActionThisTurn(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Personal_Sickly", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Rake_Assassin_Created_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Rake_Assassin_Good", "agent", 1, 8, context)
		effect.trait("C_Rake_Born_Bounder", "agent", 1, 8, context)
		effect.trait("C_Rake_Born_Bounder", "agent", 1, 8, context)
		effect.trait("C_Rake_Im_A_Laydee", "agent", 1, 4, context)
		effect.trait("C_Rake_Born_Bounder", "agent", 1, 8, context)
		effect.trait("C_Rake_Im_A_Laydee", "agent", 1, 4, context)
		return true
	end
	return false
end

--[[ C_Rake_Assassin_Good_Trigger ]]--

events.AssassinationAttemptSuccess[#events.AssassinationAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Rake_Assassin_Good", "agent", 1, 67, context)
		effect.trait("C_Rake_Assassin_Good", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Rake_Counter_Spy_Trigger ]]--

events.EspionageAgentApprehended[#events.EspionageAgentApprehended+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Rake_Counter_Spy", "agent", 1, 90, context)
		effect.trait("C_Rake_Naughty_Club", "agent", 1, 8, context)
		return true
	end
	return false
end

--[[ C_Rake_Naughty_Club_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Rake_Naughty_Club", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Rake_Sabot_Good_Trigger ]]--

events.SabotageAttemptSuccess[#events.SabotageAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Rake_Sabot_Good", "agent", 1, 67, context)
		return true
	end
	return false
end

--[[ C_Rake_Spy_Good_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if (conditions.CharacterType("rake", context) or conditions.CharacterType("assassin", context)) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) then
		effect.trait("C_Rake_Spy_Good", "agent", 1, 50, context)
		return true
	end
	return false
end

--[[ C_Sausage_Vice_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.InSettlement(context) and conditions.NoActionThisTurn(context) and not conditions.CharacterType("minister", context) and not conditions.CharacterType("colonel", context) and not conditions.CharacterType("captain", context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Sausage_Vice", "agent", 1, 2, context)
		return true
	end
	return false
end

--[[ C_Siege_Engineering_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and conditions.CharacterWonBattle(context) and not conditions.CampaignName("episodic_1", context) and not conditions.CampaignName("episodic_3", context) and not conditions.CharacterCultureType("tribal_playable", context) then
		effect.trait("C_Siege_Engineering", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Attacker_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Attacker_Bad", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Attacker_Bad", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Attacker_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Attacker_Good", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Attacker_Good", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Attacker_Good", "agent", 8, 3, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Bad_Field_Commander_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignBattleType("normal", context) and not conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Bad_Field_Commander", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Bad_Field_Commander", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Bloody_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfOwnKilled(context) > 40 and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Bloody", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Bloody", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Bloody", "agent", 3, 8, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Brave_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CommanderFoughtInBattle(context) and not conditions.CharacterRouted(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Brave", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Brave", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Brave", "agent", 3, 8, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Cherokee_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("cherokee_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Cherokee", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Cherokee_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("cherokee_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Cherokee", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Cherokee", "agent", 1, 24, context)
		effect.trait("C_Tribal_General_Cherokee", "agent", 2, 16, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Coward_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterRouted(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Coward", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Created_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Good_Field_Commander", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Mad", "agent", 1, 17, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 2, 33, context)
		effect.trait("C_General_Warlord", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 3, 33, context)
		effect.trait("C_Tribal_General_Brave", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Created_Trigger_Spam ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) > 15 then
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 3, 33, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Mad", "agent", 1, 17, context)
		effect.trait("C_Tribal_General_Bad_Field_Commander", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 2, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Defender_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Defender_Bad", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Defender_Bad", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Defender_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Defender_Good", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Defender_Good", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Defender_Good", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Good_Field_Commander_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignBattleType("normal", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Good_Field_Commander", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Good_Field_Commander", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Good_Field_Commander", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Hates_Europeans_Reset_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.WarEndedCharacterFaction(context) and conditions.CharacterTrait("C_Tribal_General_Hates_Europeans", context) >= 1 and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Hates_Europeans_Reset", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Hates_Europeans_Reset", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Hates_Europeans_Reset", "agent", 1, 33, context)
		effect.remove_trait("C_Tribal_General_Hates_Europeans", "agent", context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Hates_Europeans_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Hates_Europeans", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Hates_Europeans", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Hates_Europeans", "agent", 1, 24, context)
		effect.remove_trait("C_Tribal_General_Hates_Europeans_Reset", "agent", context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Hates_Europeans_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Hates_Europeans", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Hates_Europeans", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Hates_Europeans", "agent", 1, 24, context)
		effect.remove_trait("C_Tribal_General_Hates_Europeans_Reset", "agent", context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Huron_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("huron_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Huron", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Huron", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Huron", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Huron_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("huron_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Huron", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Huron", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Huron", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Iroquois_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("iroquois_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Iroquois", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Iroquois", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Iroquois", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Iroquois_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("iroquois_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Iroquois", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Iroquois", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Iroquois", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Lampooned_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterWonBattle(context) and conditions.BattleResult("crushing_defeat", context) and (conditions.CampaignPercentageOfOwnRouted(context) >= 50 or conditions.CampaignPercentageOfOwnKilled(context) >= 50 or conditions.CampaignPercentageOfOwnCaptured(context) >= 30) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Lampooned", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Lampooned", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Lampooned", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Mad_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterTurnsInEnemyLands(context) > 15 and conditions.BattlesFought(5, context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Mad", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Mad", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Mad", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_of_Cavalry_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignPercentageOfUnitCategory("cavalry", context) >= 40 and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_of_Cavalry", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_of_Cavalry", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_of_Cavalry", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Plains_Coup_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("plains_playable", context) and conditions.CommanderFoughtInMelee(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Plains_Coup", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Plains_Coup", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Plains_Coup", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Plains_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("plains_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Plains", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Plains", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Plains", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Plains_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("plains_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Plains", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Plains", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Plains", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Press_Hero_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.BattleResult("heroic_victory", context) and (conditions.CampaignPercentageOfThemRouted(context) >= 50 or conditions.CampaignPercentageOfThemKilled(context) >= 50 or conditions.CampaignPercentageOfThemCaptured(context) >= 30) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Press_Hero", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Press_Hero", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Press_Hero", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Promoted_Trigger ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Brave", "agent", 1, 17, context)
		effect.trait("C_Tribal_General_Good_Field_Commander", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Good_Field_Commander", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Brave", "agent", 2, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Promoted_Trigger_Spam ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) > 15 then
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 2, 17, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Born_Soldier", "agent", 1, 17, context)
		effect.trait("C_Tribal_General_Bad_Field_Commander", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Mad", "agent", 1, 33, context)
		effect.trait("C_Tribal_General_Bloody", "agent", 1, 33, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Pueblo_Trigger_01 ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("pueblo_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Pueblo", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Pueblo", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Pueblo", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Pueblo_Trigger_02 ]]--

events.CharacterPromoted[#events.CharacterPromoted+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("pueblo_playable", context) and conditions.CampaignName("natives", context) and conditions.CharacterFactionGeneralCount(context) <= 15 then
		effect.trait("C_Tribal_General_Pueblo", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Pueblo", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Pueblo", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Siege_Attack_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Siege_Attack_Bad", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Siege_Attack_Bad", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Siege_Attack_Bad", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Siege_Attack_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Siege_Attack_Good", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Siege_Attack_Good", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Siege_Attack_Good", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Siege_Defend_Bad_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and not conditions.CharacterWasAttacker(context) and not conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Siege_Defend_Bad", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Siege_Defend_Bad", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Siege_Defend_Bad", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Siege_Defend_Good_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and (conditions.CampaignBattleType("fort_standard", context) or conditions.CampaignBattleType("fort_relief", context) or conditions.CampaignBattleType("fort_sally", context) or conditions.CampaignBattleType("settlement_standard", context) or conditions.CampaignBattleType("settlement_relief", context) or conditions.CampaignBattleType("settlement_sally", context)) and not conditions.CharacterWasAttacker(context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_General_Siege_Defend_Good", "agent", 2, 16, context)
		effect.trait("C_Tribal_General_Siege_Defend_Good", "agent", 3, 8, context)
		effect.trait("C_Tribal_General_Siege_Defend_Good", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_General_Warlord_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CharacterWonBattle(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_General_Warlord", "agent", 2, 16, context)
		effect.trait("C_General_Warlord", "agent", 3, 8, context)
		effect.trait("C_General_Warlord", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Leader_Cursed_Iroquois_Flying_Head_Trigge ]]--

events.CharacterAttacksAlly[#events.CharacterAttacksAlly+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterFactionName("iroquois_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Leader_Cursed_Iroquois_Flying_Head", "agent", 2, 5, context)
		effect.trait("C_Tribal_Leader_Cursed_Iroquois_Flying_Head", "agent", 3, 2, context)
		effect.trait("C_Tribal_Leader_Cursed_Iroquois_Flying_Head", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ C_Tribal_Leader_Harsh_Ruler_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.InsurrectionCrushed(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Leader_Harsh_Ruler", "agent", 2, 5, context)
		effect.trait("C_Tribal_Leader_Harsh_Ruler", "agent", 3, 2, context)
		effect.trait("C_Tribal_Leader_Harsh_Ruler", "agent", 1, 10, context)
		return true
	end
	return false
end

--[[ C_Tribal_Leader_Peacemaker_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.WarEndedCharacterFaction(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Leader_Peacemaker", "agent", 2, 16, context)
		effect.trait("C_Tribal_Leader_Peacemaker", "agent", 3, 8, context)
		effect.trait("C_Tribal_Leader_Peacemaker", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Leader_Plains_Cursed_Trigger ]]--

events.CharacterAttacksAlly[#events.CharacterAttacksAlly+1] =
function (context)
	if conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterFactionName("plains_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Leader_Plains_Cursed", "agent", 2, 16, context)
		effect.trait("C_Tribal_Leader_Plains_Cursed", "agent", 3, 8, context)
		effect.trait("C_Tribal_Leader_Plains_Cursed", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Minister_Agriculturalist_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("tribal_playable_corn", context) or conditions.IsBuildingInChain("tribal_playable_sheep", context) or conditions.IsBuildingInChain("tribal_playable_wheat", context)) and conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Minister_Agriculturalist", "agent", 2, 16, context)
		effect.trait("C_Tribal_Minister_Agriculturalist", "agent", 3, 8, context)
		effect.trait("C_Tribal_Minister_Agriculturalist", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Minister_Army_Good_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if conditions.IsBuildingInChain("tribal_playable_barracks", context) and conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Minister_Army_Good", "agent", 2, 16, context)
		effect.trait("C_Tribal_Minister_Army_Good", "agent", 3, 8, context)
		effect.trait("C_Tribal_Minister_Army_Good", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Minister_Industrialist_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("tribal_playable_industry-metal", context) or conditions.IsBuildingInChain("tribal_playable_industry-pottery", context) or conditions.IsBuildingInChain("tribal_playable_industry-textile", context)) and conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Minister_Industrialist", "agent", 2, 16, context)
		effect.trait("C_Tribal_Minister_Industrialist", "agent", 3, 8, context)
		effect.trait("C_Tribal_Minister_Industrialist", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Minister_Trader_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingInChain("tribal_playable_pioneer", context) or conditions.IsBuildingInChain("tribal_playable_prospector", context)) and conditions.CharacterType("minister", context) and conditions.IsFactionLeader(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Minister_Trader", "agent", 2, 16, context)
		effect.trait("C_Tribal_Minister_Trader", "agent", 3, 8, context)
		effect.trait("C_Tribal_Minister_Trader", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Scout_Good_Army_Sabotage_Trigger ]]--

events.SabotageAttemptSuccess[#events.SabotageAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("scout", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Scout_Good_Army_Sabotage", "agent", 2, 16, context)
		effect.trait("C_Tribal_Scout_Good_Army_Sabotage", "agent", 3, 8, context)
		effect.trait("C_Tribal_Scout_Good_Army_Sabotage", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Scout_Good_Assassin_Trigger ]]--

events.AssassinationAttemptSuccess[#events.AssassinationAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("scout", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Scout_Good_Assassin", "agent", 2, 16, context)
		effect.trait("C_Tribal_Scout_Good_Assassin", "agent", 3, 8, context)
		effect.trait("C_Tribal_Scout_Good_Assassin", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Scout_Good_Saboteur_Trigger ]]--

events.SabotageAttemptSuccess[#events.SabotageAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("scout", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Scout_Sabot_Good", "agent", 2, 16, context)
		effect.trait("C_Tribal_Scout_Sabot_Good", "agent", 3, 8, context)
		effect.trait("C_Tribal_Scout_Sabot_Good", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Scout_Good_Spy_Trigger ]]--

events.SpyingAttemptSuccess[#events.SpyingAttemptSuccess+1] =
function (context)
	if conditions.CharacterType("scout", context) and conditions.CharacterCultureType("tribal_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Scout_Good_Spy", "agent", 2, 16, context)
		effect.trait("C_Tribal_Scout_Good_Spy", "agent", 3, 8, context)
		effect.trait("C_Tribal_Scout_Good_Spy", "agent", 1, 24, context)
		return true
	end
	return false
end

--[[ C_Tribal_Shaman_Likes_Mushrooms_Trigger ]]--

events.ResearchCompleted[#events.ResearchCompleted+1] =
function (context)
	if conditions.CharacterType("medicine_man", context) and (conditions.ResearchType("industry_agriculture_natives_culture_dreamwalking", context) or conditions.ResearchType("industry_agriculture_natives_culture_riding_the_winds", context) or conditions.ResearchType("industry_agriculture_natives_culture_spirit_medicine", context) or conditions.ResearchType("industry_agriculture_natives_culture_spirit_of_the_forest", context)) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Shaman_Likes_Mushrooms", "agent", 2, 8, context)
		effect.trait("C_Tribal_Shaman_Likes_Mushrooms", "agent", 3, 4, context)
		effect.trait("C_Tribal_Shaman_Likes_Mushrooms", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_Shaman_Plains_Buffalo_Dancer_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("medicine_man", context) and conditions.CharacterFactionName("plains_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Shaman_Plains_Buffalo_Dancer", "agent", 2, 8, context)
		effect.trait("C_Tribal_Shaman_Plains_Buffalo_Dancer", "agent", 3, 4, context)
		effect.trait("C_Tribal_Shaman_Plains_Buffalo_Dancer", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_Shaman_Powwow_Trigger ]]--

events.CharacterTurnEnd[#events.CharacterTurnEnd+1] =
function (context)
	if conditions.CharacterType("medicine_man", context) and conditions.WarEndedCharacterFaction(context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Shaman_Powwow", "agent", 2, 8, context)
		effect.trait("C_Tribal_Shaman_Powwow", "agent", 3, 4, context)
		effect.trait("C_Tribal_Shaman_Powwow", "agent", 1, 17, context)
		return true
	end
	return false
end

--[[ C_Tribal_Shaman_Pueblo_Sun_Dancer_Trigger ]]--

events.CharacterCreated[#events.CharacterCreated+1] =
function (context)
	if conditions.CharacterType("medicine_man", context) and conditions.CharacterFactionName("pueblo_playable", context) and conditions.CampaignName("natives", context) then
		effect.trait("C_Tribal_Shaman_Pueblo_Sun_Dancer", "agent", 2, 8, context)
		effect.trait("C_Tribal_Shaman_Pueblo_Sun_Dancer", "agent", 3, 4, context)
		effect.trait("C_Tribal_Shaman_Pueblo_Sun_Dancer", "agent", 1, 17, context)
		return true
	end
	return false
end

