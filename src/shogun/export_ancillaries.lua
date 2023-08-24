--[[
Automatically generated via export from C:/Users/chris_g\branches/shogun2/boshin/shogun2/raw_data/db
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Ancillary Declarations

--[[ s2_anc_bosh_hovercraft_eels_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2_anc_bosh_hovercraft_eels", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2_anc_bosh_hovercraft_eels", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_civil_judge_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and (conditions.CharacterFactionName("gem_minamoto_kamakura", context) or conditions.CharacterFactionName("gem_minamoto_kiso", context)) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_civil_judge", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_civil_secretary_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and (conditions.CharacterFactionName("gem_minamoto_kamakura", context) or conditions.CharacterFactionName("gem_minamoto_kiso", context)) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_civil_secretary", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_civil_servant_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and (conditions.CharacterFactionName("gem_taira_fukuhara", context) or conditions.CharacterFactionName("gem_taira_yashima", context)) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_civil_servant", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_governor_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and not conditions.CharacterFactionName("gem_minamoto_kamakura", context) and not conditions.CharacterFactionName("gem_minamoto_kiso", context) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_governor", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_little_tea_pot_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_daimyo_little_tea_pot_2", context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_daimyo_little_tea_pot_3", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_little_tea_pot_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_little_tea_pot_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_daimyo_little_tea_pot_1", context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_daimyo_little_tea_pot_3", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_little_tea_pot_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_little_tea_pot_3_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_daimyo_little_tea_pot_2", context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_daimyo_little_tea_pot_1", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_little_tea_pot_3", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_pet_tiger_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2_anc_pdlc_daimyo_pet_tiger", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_pet_tiger", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_samurai_senior_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and (conditions.CharacterFactionName("gem_minamoto_kamakura", context) or conditions.CharacterFactionName("gem_minamoto_kiso", context)) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_samurai_senior", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_daimyo_vassal_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and (conditions.CharacterFactionName("gem_minamoto_kamakura", context) or conditions.CharacterFactionName("gem_minamoto_kiso", context)) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_daimyo_vassal", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_bow_practice_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_bow_practice", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_bow_target_long_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasAncillary("s2_anc_pdlc_general_bow_practice", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_bow_target_long", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_bow_target_medium_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasAncillary("s2_anc_pdlc_general_bow_practice", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_bow_target_medium", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_bow_target_short_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasAncillary("s2_anc_pdlc_general_bow_practice", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_bow_target_short", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_governor_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("gem_minamoto_kamakura", context) and not conditions.CharacterFactionName("gem_minamoto_kiso", context) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_general_governor", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_governor_zuryo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("gem_minamoto_kamakura", context) and not conditions.CharacterFactionName("gem_minamoto_kiso", context) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_general_governor_zuryo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_mii_dera_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("gem_minamoto_kamakura", context) or conditions.CharacterFactionName("gem_minamoto_kiso", context)) and not conditions.CharacterHasAncillary("s2_anc_pdlc_general_monk_enryaky_ji", context) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_mii_dera", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_monk_enryaky_ji_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_general_mii_dera", context) and conditions.CampaignName("jap_gempei", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_general_monk_enryaky_ji", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_moon_carp_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_moon_carp", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_poet_chinese_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_general_poet_nihon", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_poet_chinese", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_poet_nihon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CharacterHasAncillary("s2_anc_pdlc_general_poet_chinese", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_poet_nihon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_general_weapon_yoroi_toshi_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_general_weapon_yoroi_toshi", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_itako_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_itako", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_komuso_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_komuso", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_miko_spirit_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CharacterHasAncillary("s2_anc_pdlc_monk_follower_miko_tea", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_miko_spirit", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_miko_tea_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CharacterHasAncillary("s2_anc_pdlc_monk_follower_miko_spirit", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_miko_tea", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_ninja_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_ninja", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_noble_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_noble", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_ronin_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_ronin", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_follower_yamahoshi_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_follower_yamahoshi", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_item_beads_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_item_beads", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_item_bowl_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_item_bowl", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_item_cup_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_item_cup", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_item_flute_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_item_flute", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_item_lotus_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_item_lotus", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_item_rice_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_item_rice", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_origami_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and conditions.FactionwideAncillaryTypeExists("s2_anc_pdlc_monk_origami", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_origami", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_pet_cat_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_pet_cat", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_pet_cricket_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_pet_cricket", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_buddha_gold_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and conditions.WorldwideAncillaryTypeExists("s2_anc_pdlc_monk_relic_buddha_gold", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_buddha_gold", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_dragon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and conditions.WorldwideAncillaryTypeExists("s2_anc_pdlc_monk_relic_dragon", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_dragon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_fuji_rock_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and conditions.FactionwideAncillaryTypeExists("s2_anc_pdlc_monk_relic_fuji_rock", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_fuji_rock", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_heart_sutra_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and conditions.FactionwideAncillaryTypeExists("s2_anc_pdlc_monk_relic_heart_sutra", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_heart_sutra", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_nembutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("ikko_monk", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_nembutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_painting_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_painting", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_relic_shugendo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_relic_shugendo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_weapon_bisento_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_weapon_bisento", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_weapon_bo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_weapon_bo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_weapon_dagger_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_weapon_dagger", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_monk_zasu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("monk", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_monk_zasu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_ninja_disguise_monk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("ninja", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_ninja_disguise_monk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_shirabyoshi_ceremonial_drum_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("gempei_dancer", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_shirabyoshi_ceremonial_drum", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_shirabyoshi_ceremonial_flute_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("gempei_dancer", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_shirabyoshi_ceremonial_flute", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_shirabyoshi_hand_fan_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("gempei_dancer", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_shirabyoshi_hand_fan", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_shirabyoshi_kimono_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("gempei_dancer", context) or conditions.CharacterType("geisha", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2_anc_pdlc_shirabyoshi_kimono", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2_anc_pdlc_shirabyoshi_tachi_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("gempei_dancer", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1300, context) then 
			effect.ancillary("s2_anc_pdlc_shirabyoshi_tachi", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_ainu_servant_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("geisha", context) or conditions.CharacterType("gempei_dancer", context)) and not conditions.CharacterInHomeRegion(context) and conditions.FactionwideAncillaryTypeExists("s2anc_ainu_servant", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_ainu_servant", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_armoured_war_dog_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_armoured_war_dog", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_army_drummer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_army_drummer", context) == false and not conditions.CharacterHasAncillary("s2anc_general_taiko_drummer", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_army_drummer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_army_hero_ashigaru_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterHasAncillary("s2anc_army_hero_samurai", context) and not conditions.CharacterHasAncillary("s2anc_army_hero_horse", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_army_hero_ashigaru", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_army_hero_horse_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CharacterHasAncillary("s2anc_army_hero_samurai", context) and not conditions.CharacterHasAncillary("s2anc_army_hero_ashigaru", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_army_hero_horse", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_army_hero_samurai_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_army_hero_horse", context) and not false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_army_hero_samurai", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_armour_helmet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_armour_helmet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_armour_spanish_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_armour_spanish", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_banner_christian_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_banner_christian", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_banner_warlord_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_banner_warlord", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_buddhist_beads_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.OnAWarFooting(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_buddhist_beads", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_cards_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("metsuke", context) or conditions.CharacterType("gempei_inspector", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_cards", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_chess_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("metsuke", context) or conditions.CharacterType("gempei_inspector", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_chess", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_christian_gun_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.OnAWarFooting(context) and conditions.CharacterFactionHasTechType("shogun_military_musket_teppo_mastery", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_christian_gun_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_christian_holy_water_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.FactionwideAncillaryTypeExists("s2anc_artefact_christian_holy_water", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_christian_holy_water", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_christian_psalter_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_christian_psalter", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_christian_reliquary_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.FactionwideAncillaryTypeExists("s2anc_artefact_christian_reliquary", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_christian_reliquary", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_christian_sword_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.OnAWarFooting(context) and  conditions.FactionwideAncillaryTypeExists("s2anc_artefact_christian_sword_1", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_christian_sword_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_geisha_fan_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and conditions.OnAWarFooting(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_geisha_fan", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_geisha_poison_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and conditions.OnAWarFooting(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_geisha_poison", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_go_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_go", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_gun_dutch_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionHasTechType("shogun_military_musket_teppo_mastery", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_gun_dutch", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_armour_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterInHomeRegion(context) and  conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_armour", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_armour", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_bokken_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_bokken_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_bokken_3_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_bokken_3", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_bokken_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_bokken", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_cuirass_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_cuirass", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_cuirass", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_greaves_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_greaves", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_greaves", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_helmet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_helmet", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_helmet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_katana_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_katana", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_katana", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_kote_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_kote", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_kote", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_mask_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_mask", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_mask", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_naginata_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_legend_naginata", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_naginata", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_ninjato_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_spy", context)) and conditions.FactionwideAncillaryTypeExists("s2anc_artefact_legend_ninjato_1", context) == false and not conditions.CharacterHasAncillary("s2anc_artefact_legend_ninjato_2", context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_ninjato_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_ninjato_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_spy", context)) and conditions.FactionwideAncillaryTypeExists("s2anc_artefact_legend_ninjato_2", context) == false and not conditions.CharacterHasAncillary("s2anc_artefact_legend_ninjato_1", context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_ninjato_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_legend_short_sword_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("metsuke", context) and conditions.FactionwideAncillaryTypeExists("s2anc_artefact_legend_short_sword", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_legend_short_sword", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_mirror_moon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_mirror_moon", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_mirror_moon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_myth_sword_amateratsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_myth_sword_amateratsu", context) == false and not conditions.CharacterHasAncillary("s2anc_artefact_myth_sword_moon", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_myth_sword_amateratsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_myth_sword_moon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CharacterInHomeRegion(context) and conditions.WorldwideAncillaryTypeExists("s2anc_artefact_myth_sword_moon", context) == false and not conditions.CharacterHasAncillary("s2anc_artefact_myth_sword_amateratsu", context) and conditions.CharacterHasTrait("S2_trait_general_mad", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_myth_sword_moon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_myth_sword_spanish_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_myth_sword_spanish", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_ninja_blowpipe_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("ninja", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_bombs", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_shuriken", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_tanto", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_blowpipe", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_ninja_bombs_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("ninja", context) and  not conditions.CharacterHasAncillary("s2anc_artefact_ninja_blowpipe", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_shuriken", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_tanto", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_bombs", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_ninja_disguise_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_spy", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_disguise_6", 50,  context)
		end
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_disguise_5", 50,  context)
		end
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_disguise_3", 50,  context)
		end
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_disguise_1", 50,  context)
		end
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_disguise_4", 50,  context)
		end
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_disguise_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_ninja_shuriken_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_spy", context)) and  not conditions.CharacterHasAncillary("s2anc_artefact_ninja_blowpipe", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_bombs", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_tanto", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_shuriken", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_ninja_tanto_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_spy", context)) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_bombs", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_shuriken", context) and not conditions.CharacterHasAncillary("s2anc_artefact_ninja_blowpipe", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_tanto", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_artefact_ninja_tiger_claws_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_spy", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_artefact_ninja_tiger_claws", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_chamberlain_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CharacterInHomeRegion(context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_chamberlain", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_chess_champion_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_chess_champion", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_chess_champion", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_crime_gambler_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and  conditions.FactionwideAncillaryTypeExists("s2anc_crime_gambler", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_crime_gambler", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_crime_ronin_kabukimono_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("metsuke", context) or conditions.CharacterType("gempei_inspector", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_crime_ronin_kabukimono", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_crime_yakuza_boss_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("metsuke", context) and conditions.FactionwideAncillaryTypeExists("s2anc_crime_yakuza_boss", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_crime_yakuza_boss", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_crime_yakuza_disgraced_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("metsuke", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_crime_yakuza_disgraced", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_crime_yakuza_thug_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("metsuke", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_crime_yakuza_thug", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_espionage_assassin_chef_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("geisha", context) or conditions.CharacterType("gempei_spy", context)) and conditions.FactionwideAncillaryTypeExists("s2anc_espionage_assassin_chef_1", context) == false and not conditions.CharacterHasAncillary("s2anc_espionage_assassin_chef_2", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_espionage_assassin_chef_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_espionage_assassin_chef_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("geisha", context) or conditions.CharacterType("gempei_spy", context)) and conditions.FactionwideAncillaryTypeExists("s2anc_espionage_assassin_chef_2", context) == false and not conditions.CharacterHasAncillary("s2anc_espionage_assassin_chef_1", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_espionage_assassin_chef_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_espionage_chonin_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("metsuke", context) or conditions.CharacterType("gempei_inspector", context) or conditions.CharacterType("gempei_spy", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_espionage_chonin", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_espionage_samurai_rude_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_inspector", context)) and conditions.OnAWarFooting(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_espionage_samurai_rude_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_espionage_samurai_rude_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("ninja", context) or conditions.CharacterType("gempei_inspector", context)) and conditions.OnAWarFooting(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_espionage_samurai_rude", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_espionage_samurai_show_off_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("ninja", context) and conditions.OnAWarFooting(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_espionage_samurai_show_off", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_friend_boyhood_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("gempei_inspector", context)) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_friend_boyhood", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_friend_drinker_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_friend_drinker", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_friend_mentor_figure_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_friend_mentor_figure", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_friend_mentor_figure", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_geisha_dancer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and not conditions.CharacterHasAncillary("s2anc_geisha_half_pay", context) and not conditions.CharacterHasAncillary("s2anc_geisha_hot_springs", context) and not conditions.CharacterHasAncillary("s2anc_geisha_waitress", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_geisha_dancer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_geisha_half_pay_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and not conditions.CharacterHasAncillary("s2anc_geisha_dancer", context) and not conditions.CharacterHasAncillary("s2anc_geisha_hot_springs", context) and not conditions.CharacterHasAncillary("s2anc_geisha_waitress", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_geisha_half_pay", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_geisha_hot_springs_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and not conditions.CharacterHasAncillary("s2anc_geisha_dancer", context) and not conditions.CharacterHasAncillary("s2anc_geisha_half_pay", context) and not conditions.CharacterHasAncillary("s2anc_geisha_waitress", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_geisha_hot_springs", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_geisha_waitress_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and not conditions.CharacterHasAncillary("s2anc_geisha_half_pay", context) and not conditions.CharacterHasAncillary("s2anc_geisha_hot_springs", context) and not conditions.CharacterHasAncillary("s2anc_geisha_dancer", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_geisha_waitress", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_general_galloper_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_general_galloper", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_general_surgeon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.FactionwideAncillaryTypeExists("s2anc_general_surgeon", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_general_surgeon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_general_taiko_drummer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_taiko_drummer", context) == false and not conditions.CharacterHasAncillary("s2anc_army_drummer", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_general_taiko_drummer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_government_merchant_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and not conditions.CharacterHasAncillary("s2anc_government_merchant", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_government_merchant_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_government_merchant_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and not conditions.CharacterHasAncillary("s2anc_government_merchant_2", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_government_merchant", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_government_rabblerouser_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_government_rabblerouser", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_hero_boy_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.FactionwideAncillaryTypeExists("s2anc_hero_boy", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_hero_boy", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_biwa_hoshi_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_household_biwa_hoshi_1", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_biwa_hoshi_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_biwa_hoshi_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_household_biwa_hoshi_2", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_biwa_hoshi_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_chef_noodle_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_household_chef_noodle", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_chef_noodle", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_chinese_courtier_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and conditions.CharacterInHomeRegion(context) and conditions.WorldwideAncillaryTypeExists("s2anc_household_chinese_courtier", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_chinese_courtier", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_chinese_false_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if not conditions.IsAdmiral(context) and conditions.IsDaimyo(context) and conditions.CharacterInHomeRegion(context) and conditions.WorldwideAncillaryTypeExists("s2anc_household_chinese_false", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_chinese_false", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_doctor_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_doctor", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_groom_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_groom", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_guard_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_guard", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_jesuit_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_jesuit", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_koto_hoshi_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.FactionwideAncillaryTypeExists("s2anc_household_koto_hoshi_1", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_koto_hoshi_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_koto_hoshi_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_household_biwa_hoshi_2", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_koto_hoshi_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_mystic_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_mystic", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_household_treasurer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_household_treasurer", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_household_treasurer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_architect_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_architect", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_armourer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_armourer", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_armourer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_bowyer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_bowyer", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_bowyer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_castle_mason_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_castle_mason", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_castle_mason", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_gunmaker_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_gunmaker", context) == false and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_gunmaker", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_iaijutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_iaijutsu", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_iaijutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_jujutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_jujutsu", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_jujutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_kenjutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_kenjutsu", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_kenjutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_kobudo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_kobudo", context) == false and (conditions.CharacterFactionName("shimazu", context) or conditions.CharacterFactionName("ito", context) or conditions.CharacterFactionName("sagara", context)) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_kobudo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_kyudo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_kyudo", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_kyudo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_naginata_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_naginata", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_naginata", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_smith_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_smith", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_smith", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_sojutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_sojutsu", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_sojutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_army_yabusame_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_army_yabusame", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_army_yabusame", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_arts_bunraku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_arts_bunraku", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_bunraku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_arts_calligrapher_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_arts_calligrapher", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_calligrapher", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_arts_go_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_arts_go", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_go", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_arts_haiku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_arts_haiku", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_haiku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_arts_kabuki_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_arts_kabuki", context) == false and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_kabuki", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_arts_tea_ceremony_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_arts_tea_ceremony", context) == false and conditions.CharacterHasAncillary("s2anc_master_arts_ceramics", context) and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_tea_ceremony", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_espionage_ninja_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_espionage_ninja", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_espionage_ninja", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_legend_espionage_spy_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_legend_espionage_spy", context) == false and not conditions.IsAdmiral(context) and conditions.CharacterRank(context) >= 5 and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_espionage_spy", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_madman_christian_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasTrait("S2_trait_general_mad", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_madman_christian", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_madman_kappa_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasTrait("S2_trait_general_mad", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_madman_kappa", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_madman_kodama_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasTrait("S2_trait_general_mad", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_madman_kodama", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_madman_moon_rabbit_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterHasTrait("S2_trait_general_mad", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_madman_moon_rabbit", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_madman_tengu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_madman_tengu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_architect_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_architect", context) == false and not conditions.CharacterHasAncillary("s2anc_master_army_castle_mason", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_architect", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_armourer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_armourer", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_armourer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_bowyer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_bowyer", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_bowyer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_castle_mason_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_architect", context) == false and not conditions.CharacterHasAncillary("s2anc_master_army_architect", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_castle_mason", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_gunmaker_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_gunmaker", context) == false and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_gunmaker", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_iaijutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_iaijutsu", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_iaijutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_jujutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_jujutsu", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_jujutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_kenjutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_kenjutsu", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_kenjutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_kobudo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_kobudo", context) == false and (conditions.CharacterFactionName("shimazu", context) or conditions.CharacterFactionName("ito", context) or conditions.CharacterFactionName("sagara", context)) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_kobudo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_kyudo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_kyudo", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_kyudo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_naginata_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_naginata", context) == false and not conditions.CharacterFactionName("ikko_ikki", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_naginata", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_netsuke_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_netsuke", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_netsuke", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_smith_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_smith", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_smith", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_sojutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_sojutsu", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_sojutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_army_yabusame_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_army_yabusame", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_army_yabusame", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_bunraku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_bunraku", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_bunraku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_calligrapher_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_calligrapher", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_calligrapher", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_ceramics_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_ceramics", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_ceramics", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_go_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_go_1", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_go_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_go_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_master_arts_go_2", context) == false and conditions.CharacterHasAncillary("s2anc_master_arts_go_1", context) and conditions.CharacterInHomeRegion(context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_go_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_haiku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_haiku", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_haiku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_kabuki_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("geisha", context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_kabuki", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_arts_kabuki", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_arts_tea_ceremony_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and  conditions.FactionwideAncillaryTypeExists("s2anc_master_arts_tea_ceremony", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_legend_arts_tea_ceremony", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_master_espionage_ninja_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_master_espionage_ninja", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_master_espionage_ninja", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_bodyguard_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_bodyguard", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_christian", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_bodyguard", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_christian_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_christian", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_dangerous_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_dangerous", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_dangerous", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_fox_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_fox", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_fox", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_gorgeous_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_gorgeous", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_gorgeous", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_peasant_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_peasant", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_peasant", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_political_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("General", context) or conditions.CharacterType("gempei_inspector", context)) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_political", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_political", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_shrew_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_shrew", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_tart", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_christian", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_shrew", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_mistress_tart_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_mistress_tart", context) == false and not conditions.CharacterHasAncillary("s2anc_mistress_shrew", context) and not conditions.CharacterHasAncillary("s2anc_mistress_bodyguard", context) and not conditions.CharacterHasAncillary("s2anc_mistress_christian", context) and not conditions.CharacterHasAncillary("s2anc_mistress_dangerous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_fox", context) and not conditions.CharacterHasAncillary("s2anc_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_mistress_peasant", context) and not conditions.CharacterHasAncillary("s2anc_mistress_political", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_mistress_tart", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_musician_flute_lady_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_musician_flute_lady", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_gaijin_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_gaijin_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_gaijin_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and false then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_gaijin_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_pearl_fisherman_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_navy_pearl_fisherman", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_pearl_fisherman", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_pilot_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_navy_pilot", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_pilot", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_pirate_chinese_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_navy_pirate_chinese", context) == false and not conditions.CharacterHasAncillary("s2anc_navy_pirate_nihon", context) and not conditions.CharacterHasAncillary("s2anc_navy_pirate_okinawa", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_pirate_chinese", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_pirate_nihon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_navy_pirate_nihon", context) == false and not conditions.CharacterHasAncillary("s2anc_navy_pirate_chinese", context) and not conditions.CharacterHasAncillary("s2anc_navy_pirate_okinawa", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_pirate_nihon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_pirate_okinawa_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and conditions.FactionwideAncillaryTypeExists("s2anc_navy_pirate_okinawa", context) == false and not conditions.CharacterHasAncillary("s2anc_navy_pirate_chinese", context) and not conditions.CharacterHasAncillary("s2anc_navy_pirate_nihon", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_pirate_okinawa", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_navy_shipwreck_dutch_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.IsAdmiral(context) and conditions.WorldwideAncillaryTypeExists("s2anc_navy_shipwreck_dutch", context) == false and not conditions.CharacterHasAncillary("s2anc_navy_gaijin_1", context) and not conditions.CharacterHasAncillary("s2anc_navy_gaijin_2", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_navy_shipwreck_dutch", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_pet_carp_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_pet_carp_1", context) == false and not conditions.CharacterHasAncillary("s2anc_pet_carp_2", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_pet_carp_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_pet_carp_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_pet_carp_2", context) == false and not conditions.CharacterHasAncillary("s2anc_pet_carp_1", context) and conditions.CharacterHasTrait("S2_trait_daimyo_cruel", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_pet_carp_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_pet_hunting_dog_gempei_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("gempei_inspector", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_pet_hunting_dog_gempei", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_pet_hunting_dog_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("metsuke", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_pet_hunting_dog", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_pet_monkey_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context) or conditions.CharacterType("gempei_monk", context)) and conditions.FactionwideAncillaryTypeExists("s2anc_pet_monkey", context) == false and not conditions.CharacterHasAncillary("s2anc_pet_monkey_2", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_pet_monkey", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_pet_monkey_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and conditions.FactionwideAncillaryTypeExists("s2anc_pet_monkey_2", context) == false and not conditions.CharacterHasAncillary("s2anc_pet_monkey", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_pet_monkey_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_buddhist_monk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CharacterHasAncillary("s2anc_religion_buddhist_nun", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_buddhist_monk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_buddhist_nun_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("monk", context) or conditions.CharacterType("ikko_monk", context)) and not conditions.CharacterHasAncillary("s2anc_religion_buddhist_monk", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_buddhist_nun", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_agent_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.FactionLeadersTrait("S2_trait_daimyo_cruel", context) > 1 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_agent_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_agent_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.FactionLeadersTrait("S2_trait_daimyo_cruel", context) >= 1 and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_agent", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_confessor_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_confessor", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_convert_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CharacterInBuildingOfChain("SHO_Christian", context) and conditions.FactionwideAncillaryTypeExists("s2anc_religion_christian_convert_1", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_convert_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_convert_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and conditions.FactionwideAncillaryTypeExists("s2anc_religion_christian_convert_2", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_convert_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_convert_3_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_convert_3", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_convert_4_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_convert_4", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_firebrand_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_firebrand", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_religion_christian_notary_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("missionary", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_religion_christian_notary", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_2_swords_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_2_swords", context) == false and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_2_swords", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_1", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_2", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_3_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_3", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_3", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_4_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_4", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_4", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_5_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_5", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_5", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_6_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_6", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_6", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_7_7_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and not conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_samurai_7_7", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_7_7", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_samurai_killer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("metsuke", context) or conditions.CharacterType("gempei_inspector", context)) and conditions.OnAWarFooting(context) and conditions.FactionwideAncillaryTypeExists("s2anc_samurai_killer", context) == false and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_samurai_killer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_silly_time_tunnel_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_silly_time_tunnel_1", context) == false and conditions.RandomPercentCampaign(1, context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_silly_time_tunnel_1", 5,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_silly_time_tunnel_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_silly_time_tunnel_2", context) == false and conditions.RandomPercentCampaign(1, context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_silly_time_tunnel_2", 5,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_animal_dog_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_animal_dog", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_animal_horse_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_animal_horse", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_binoculars_military_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_binoculars_military", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_binoculars_opera_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_binoculars_opera", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_20k_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_20k", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_almanac_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_almanac", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_artillery_handbook_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_artillery_handbook", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_dickens_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_dickens", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_king_james_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_king_james", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_on_war_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_on_war", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_pulp_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_pulp", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_rights_of_man_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_rights_of_man", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_book_uncle_tom_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_book_uncle_tom", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_burakumin_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_burakumin", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_clock_marine_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_clock_marine", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_clock_myriad_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_clock_myriad", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_clock_watch_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_clock_watch", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_doctor_euro_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_doctor_euro", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_doctor_jp_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_doctor_jp", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_doctor_surgeon_euro_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_doctor_surgeon_euro", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_doctor_surgeon_jp_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_doctor_surgeon_jp", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ed_the_cat_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_ed_the_cat", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ed_the_cat", 1,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_botanist_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_botanist", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_botanist", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_journo_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_journo_2", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_journo_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_journo_3_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_journo_3", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_journo_3", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_journo_4_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_journo_4", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_journo_4", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_journo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_journo", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_journo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_servant_uk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_servant_uk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_tourist_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_tourist_2", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_tourist_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_foreign_tourist_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CharacterIsOfBritishOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_foreign_tourist", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_foreign_tourist", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_game_cards_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context) or conditions.CharacterType("boshin_shinobi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_game_cards", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_game_shogi_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_game_shogi", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_game_shogi", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_geisha_danna_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_geisha_danna", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_geisha_hangyoku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_geisha_hangyoku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_geisha_maiko_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_geisha_maiko", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_geisha_o_shoku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_geisha_o_shoku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_geisha_onsen_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_geisha_onsen", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_geisha_shamisen_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_geisha_shamisen", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_adams_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CharacterIsOfBritishOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_adams", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_adams", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_colt_navy_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_colt_navy", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_colt_navy", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_deringer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_veteran", context) or conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_ishinshishi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_geisha", context) or conditions.CharacterType("General", context)) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_deringer", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_deringer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_dreyse_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_dreyse", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_dreyse", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_elephant_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfBritishOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_elephant", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_elephant", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_gewehr_muzzleloader_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_gewehr_muzzleloader", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_gewehr_muzzleloader", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_lancaster_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_lancaster", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_lancaster", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_martini_henry_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_martini_henry", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_martini_henry", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_matchlock_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_matchlock", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_matchlock", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_mauser_71_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_mauser_71", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_mauser_71", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_minie_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfFrenchOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_minie", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_minie", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_model_1866_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_model_1866", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_model_1866", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_musketoon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_musketoon", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_musketoon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_sandw_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_sandw_2", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_sandw_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_snider_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_snider", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_snider", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_spencer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfAmericanOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_spencer", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_spencer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_springfield_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfAmericanOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_springfield", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_springfield", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_gun_volcanic_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_gun_volcanic", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_gun_volcanic", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_iem_cigarillo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_iem_cigarillo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_absinthe_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_absinthe", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_balloon_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_balloon", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_bike_early_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_bike_early", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_binocs_artillery_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_binocs_artillery", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_camera_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_camera", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_champagne_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_champagne", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_chloroform_killer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_chloroform_killer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_condom_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) and false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_condom", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_fan_killer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_fan_killer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_fintry_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfBritishOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_item_fintry", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_fintry", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_flag_semaphore_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_flag_semaphore", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_flag_wig_wag_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_flag_wig_wag", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_food_bovril_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_food_bovril", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_game_bat_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_game_bat", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_game_chess_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_game_chess", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_game_cricket_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_game_cricket", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_game_go_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_game_go", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_game_golf_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and not conditions.CharacterIsOfAmericanOrigin(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_game_golf", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_game_tennis_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_item_game_tennis", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_game_tennis", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_glasses_smoked_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_glasses_smoked", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_globe_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_item_globe", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_globe", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_hand_warmer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_hand_warmer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_mech_puppet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_item_mech_puppet", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_mech_puppet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_medical_chloroform_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_medical_chloroform", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_medical_stethoscope_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_medical_stethoscope", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_microscope_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_microscope", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_music_accordian_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_music_accordian", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_music_euphonium_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_music_euphonium", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_music_piano_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_music_piano", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_navy_diving_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_navy_diving", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_navy_sextant_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_navy_sextant", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_optic_telescope_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context) or conditions.CharacterType("boshin_geisha", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_optic_telescope", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_pen_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_pen", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_phonograph_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_phonograph", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_pipe_opium_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_pipe_opium", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_poisons_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_poisons", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_pong_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfFrenchOrigin(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_pong", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_prussian_spikey_hat_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_prussian_spikey_hat", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_razor_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_razor", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_sabre_cav_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_sabre_cav", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_scotch_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_scotch", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_skate_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_skate", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_slide_rule_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_slide_rule", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_snuff_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_snuff", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_soap_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_soap", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_sword_bokken_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_sword_bokken", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_theodolite_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_theodolite", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_umbrella_sword_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and conditions.CharacterIsOfBritishOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_item_umbrella_sword", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_umbrella_sword", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_vicky_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_vicky", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_weapon_bayonet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_weapon_bayonet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_wig_black_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_satsuma", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_wig_black", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_wig_red_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_tosa", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_wig_red", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_item_wig_white_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_choshu", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_item_wig_white", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_armour_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_armour", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_armour", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_biwa_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_biwa", context) == false and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_biwa", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_biwa", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_do_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_do", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_do", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_flag_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_flag", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_flag", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_go_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_go", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_go", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_haiku_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_haiku", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_haiku", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_kabuto_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_kabuto", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_kabuto", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_katana_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_legend_sword", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_katana", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_katana", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_kote_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_ninjato", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_kote", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_koto_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_koto", context) == false and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_kote", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_koto", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_menpo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_menpo", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_menpo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_ninja_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_ninja", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_ninja", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_ninjato_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_ninja_tanto", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_ninjato", context) == false and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_ninjato", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_ninjato", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_spy_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_spy", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_spy", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_suneate_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_suneate", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_suneate", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_sword_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_legend_katana", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_sword", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_sword", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_legend_tea_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_legend_tea", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_legend_tea", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_lone_arranger_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CharacterIsOfAmericanOrigin(context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_lone_arranger", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_lone_arranger", 1,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_blade_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_blade", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_blade", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_go_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_master_go", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_master_go_2", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_go_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_go_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_master_go_2", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_master_go", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_go", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_iaijutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_iaijutsu", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_iaijutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_jujutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_jujutsu", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_jujutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_kenjutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_kenjutsu", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_kenjutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_kyudo_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_kyudo", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_kyudo", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_ninjutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_ninjutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_sojutsu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_sojutsu", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_sojutsu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_master_tea_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_master_tea", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_master_tea", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mercenary_csa_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mercenary_csa", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_ambitious_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_ambitious_2", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_ambitious_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_common_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_common", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_common", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_discreet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_discreet", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_discreet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_europe_strict_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinsengumi", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_europe_strict", context) == false and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_ambitious_2", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_europe_strict", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_europe_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_europe", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_europe", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_foxy_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_foxy", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_foxy", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_gorgeous_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_gorgeous", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_gorgeous", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_joro_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_soldier", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_joro", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_joro", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mistress_soldier_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_europe", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_foxy", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_gorgeous", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_joro", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_ambitious_2", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_common", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_mistress_discreet", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_mistress_soldier", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mistress_soldier", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_modernist_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_modernist", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_mummified_mermaid_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_mummified_mermaid", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_mummified_mermaid", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_music_drums_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_music_drums", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_music_drums", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_music_flute_player_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_music_flute_player", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_naval_builder_fr_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_naval_builder_fr", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_naval_builder_uk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_naval_builder_uk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_blowpipe_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_blowpipe", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_chef_fugu_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_chef_fugu", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_chef_sushi_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_chef_sushi", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_claws_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_claws", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_fish_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_fish", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_gaijin_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_gaijin", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_geisha_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_geisha", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_madman_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_madman", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_monk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_monk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_ronin_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_ronin", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_disguise_town_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinobi", context) or conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_disguise_town", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_flashbomb_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_flashbomb", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_gambler_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_gambler", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_shuriken_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_shuriken", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ninja_tanto_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_legend_ninjato", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ninja_tanto", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_rail_builder_uk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_rail_builder_us", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_rail_builder_uk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_rail_builder_us_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_rail_builder_uk", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_rail_builder_us", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_rail_guide_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_rail_guide", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_rail_telegraph_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_rail_telegraph", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ronin_unrepentent_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ronin_unrepentent", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_ronin_xenophobe_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_ronin_xenophobe", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_samurai_boast_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_samurai_boast", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_samurai_rude_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_samurai_rude", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_samurai_unlettered_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_samurai_unlettered", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_biwa_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_biwa", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_bodyguard_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_bodyguard", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_chef_french_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_chef_french", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_chef_noodle_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_chef_noodle", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_euro_chef_pastry_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_euro_chef_pastry", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_euro_waiter_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_euro_waiter", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_groom_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_groom", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_shogi_player_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) and conditions.FactionwideAncillaryTypeExists("s2anc_sp_bosh_servant_shogi_player", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_shogi_player", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_servant_treasurers_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_servant_treasurers", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_shinsengumi_yakuza_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_shinsengumi_yakuza", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_shinsengumi_yakuza_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_shinsengumi_yakuza_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if (conditions.CharacterType("boshin_shinsengumi", context) or conditions.CharacterType("boshin_ishinshishi", context)) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_shinsengumi_yakuza_2", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_shinsengumi_yakuza", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_brunet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1867,1869, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_brunet", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_brunet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_brunton_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1868,1876, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_brunton", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_brunton", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_byakkotai_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_aizu", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_genbutai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_suzakutai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_seiryutai", context)  then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_byakkotai", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_chanoine_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1867,1868, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_chanoine", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_chanoine", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_descharmes_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1867,1868, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_descharmes", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_descharmes", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_duousequet_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1867,1868, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_duousequet", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_duousequet", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_genbutai_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_aizu", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_byakkotai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_suzakutai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_seiryutai", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_genbutai", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_glover_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1859,1881, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_glover", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_glover", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_messelot_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1867,1868, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_messelot", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_messelot", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_roches_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1864,1868, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_roches", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_roches", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_satow_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1862,1883, context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_satow", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_schnell_edward_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and not conditions.CharacterIsOfFrenchOrigin(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_schnell_henry", context) and conditions.DateInRange(1862,1873, context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_schnell_edward", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_schnell_henry_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("bos_veteran", context) and not conditions.CharacterIsOfBritishOrigin(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_schnell_edward", context) and conditions.DateInRange(1862,1873, context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_schnell_henry", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_seiryutai_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_aizu", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_byakkotai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_genbutai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_suzakutai", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_seiryutai", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_smith_parkes_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1865,1883, context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_smith_parkes", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_suzakutai_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CharacterFactionName("bos_aizu", context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_byakkotai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_genbutai", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_spec_seiryutai", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_suzakutai", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_thouars_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1867,1868, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_thouars", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_thouars", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_valkenburg_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1866,1870, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_valkenburg", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_valkenburg", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_spec_verny_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) and conditions.DateInRange(1865,1876, context) and conditions.WorldwideAncillaryTypeExists("s2anc_sp_bosh_spec_verny", context) == false then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_spec_verny", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_sumo_champion_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_sumo_champion", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_sumo_wrestler_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_sumo_wrestler_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_sumo_wrestler_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_sumo_wrestler_2", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_arms_fr_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_arms_fr", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_arms_ger_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_arms_ger", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_arms_uk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_arms_uk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_arms_us_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_arms_us", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_banker_jr_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_banker_jr", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_french_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_french", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_japan_industry_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and (conditions.CharacterFactionName("bos_tosa", context) or conditions.CharacterFactionName("bos_choshu", context) or conditions.CharacterFactionName("bos_satsuma", context) or conditions.CharacterFactionName("bos_ueno", context) or conditions.CharacterFactionName("bos_saga", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_japan_industry", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_rich_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_rich", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_tax_farmer_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and (conditions.CharacterFactionName("bos_nagaoka", context) or conditions.CharacterFactionName("bos_aizu", context) or conditions.CharacterFactionName("bos_jozai", context) or conditions.CharacterFactionName("bos_sendai", context) or conditions.CharacterFactionName("bos_obama", context)) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_tax_farmer", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_trader_us_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_trader_us", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_uniform_admiral_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_uniform_naval_uk", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_uniform_sailor_cap", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_uniform_admiral", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_uniform_general_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_uniform_general", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_uniform_naval_uk_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_uniform_admiral", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_uniform_sailor_cap", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_uniform_naval_uk", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_uniform_sailor_cap_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_uniform_admiral", context) and not conditions.CharacterHasAncillary("s2anc_sp_bosh_uniform_naval_uk", context)  then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_uniform_sailor_cap", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_uniform_snow_shoes_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_uniform_snow_shoes", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sp_bosh_uniform_top_hat_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1700, 1900, context) then 
			effect.ancillary("s2anc_sp_bosh_uniform_top_hat", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sumo_champion_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_sumo_champion", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_sumo_champion", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sumo_wrestler_1_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_sumo_wrestler_1", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_sumo_wrestler_1", 50,  context)
		end
		return true
	end
	return false
end

--[[ s2anc_sumo_wrestler_2_trigger ]]--

events.CharacterRankUpNeedsAncillary[#events.CharacterRankUpNeedsAncillary+1] =
function (context)
	if conditions.IsDaimyo(context) and conditions.FactionwideAncillaryTypeExists("s2anc_sumo_wrestler_2", context) == false and not conditions.IsAdmiral(context) and not conditions.CampaignName("jap_boshin", context) then
		if conditions.DateInRange(1100, 1900, context) then 
			effect.ancillary("s2anc_sumo_wrestler_2", 50,  context)
		end
		return true
	end
	return false
end

