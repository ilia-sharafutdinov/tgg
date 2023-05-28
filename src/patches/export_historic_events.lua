--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Historical Events

--[[ 3_colour_printing ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("3_colour_printing", 1702, "season_summer", context) then
		effect.historical_event("3_colour_printing", context)
		return true
	end
	return false
end

--[[ air_loom ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("air_loom", 1793, "season_summer", context) then
		effect.historical_event("air_loom", context)
		return true
	end
	return false
end

--[[ alcoholic_apothecary ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("alcoholic_apothecary", 1794, "season_summer", context) then
		effect.historical_event("alcoholic_apothecary", context)
		return true
	end
	return false
end

--[[ alcoholic_apothecary_dies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("alcoholic_apothecary_dies", 1800, "season_winter", context) then
		effect.historical_event("alcoholic_apothecary_dies", context)
		return true
	end
	return false
end

--[[ american_blizzard ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("american_blizzard", 1717, "season_winter", context) then
		effect.historical_event("american_blizzard", context)
		return true
	end
	return false
end

--[[ amish_to_america ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("amish_to_america", 1727, "season_summer", context) then
		effect.historical_event("amish_to_america", context)
		return true
	end
	return false
end

--[[ ascending_mont_blanc ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("ascending_mont_blanc", 1786, "season_summer", context) then
		effect.historical_event("ascending_mont_blanc", context)
		return true
	end
	return false
end

--[[ ascending_triglav ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("ascending_triglav", 1778, "season_summer", context) then
		effect.historical_event("ascending_triglav", context)
		return true
	end
	return false
end

--[[ astronomical_aberration ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("astronomical_aberration", 1729, "season_summer", context) then
		effect.historical_event("astronomical_aberration", context)
		return true
	end
	return false
end

--[[ australia_day ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("australia_day", 1788, "season_summer", context) then
		effect.historical_event("australia_day", context)
		return true
	end
	return false
end

--[[ autobiography_colley_cibber ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("autobiography_colley_cibber", 1740, "season_winter", context) then
		effect.historical_event("autobiography_colley_cibber", context)
		return true
	end
	return false
end

--[[ bach_brandenburg_concertos ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bach_brandenburg_concertos", 1721, "season_summer", context) then
		effect.historical_event("bach_brandenburg_concertos", context)
		return true
	end
	return false
end

--[[ bach_dies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bach_dies", 1750, "season_summer", context) then
		effect.historical_event("bach_dies", context)
		return true
	end
	return false
end

--[[ bach_toccata_and_fugue_in_d_minor ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bach_toccata_and_fugue_in_d_minor", 1707, "season_summer", context) then
		effect.historical_event("bach_toccata_and_fugue_in_d_minor", context)
		return true
	end
	return false
end

--[[ bach_well_tempered_clavier_1 ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bach_well_tempered_clavier_1", 1722, "season_summer", context) then
		effect.historical_event("bach_well_tempered_clavier_1", context)
		return true
	end
	return false
end

--[[ bach_well_tempered_clavier_2 ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bach_well_tempered_clavier_2", 1744, "season_summer", context) then
		effect.historical_event("bach_well_tempered_clavier_2", context)
		return true
	end
	return false
end

--[[ ballistics_advanced ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("ballistics_advanced", 1742, "season_summer", context) then
		effect.historical_event("ballistics_advanced", context)
		return true
	end
	return false
end

--[[ bangorian_controversy ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bangorian_controversy", 1717, "season_summer", context) then
		effect.historical_event("bangorian_controversy", context)
		return true
	end
	return false
end

--[[ bavarian_illuminai ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bavarian_illuminai", 1784, "season_summer", context) then
		effect.historical_event("bavarian_illuminai", context)
		return true
	end
	return false
end

--[[ belfast_news_letter_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("belfast_news_letter_published", 1737, "season_summer", context) then
		effect.historical_event("belfast_news_letter_published", context)
		return true
	end
	return false
end

--[[ bellamy_killed ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bellamy_killed", 1717, "season_summer", context) then
		effect.historical_event("bellamy_killed", context)
		return true
	end
	return false
end

--[[ biathlon_norway ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("biathlon_norway", 1767, "season_winter", context) then
		effect.historical_event("biathlon_norway", context)
		return true
	end
	return false
end

--[[ big_bottom_massacre ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("big_bottom_massacre", 1791, "season_summer", context) then
		effect.historical_event("big_bottom_massacre", context)
		return true
	end
	return false
end

--[[ bioelectricity_discovered ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bioelectricity_discovered", 1768, "season_summer", context) then
		effect.historical_event("bioelectricity_discovered", context)
		return true
	end
	return false
end

--[[ blackbeard_killed ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("blackbeard_killed", 1718, "season_summer", context) then
		effect.historical_event("blackbeard_killed", context)
		return true
	end
	return false
end

--[[ blood_pressure ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("blood_pressure", 1726, "season_summer", context) then
		effect.historical_event("blood_pressure", context)
		return true
	end
	return false
end

--[[ bonnet_hanged ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bonnet_hanged", 1718, "season_winter", context) then
		effect.historical_event("bonnet_hanged", context)
		return true
	end
	return false
end

--[[ bow_street_runners ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("bow_street_runners", 1748, "season_summer", context) then
		effect.historical_event("bow_street_runners", context)
		return true
	end
	return false
end

--[[ british_museum ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("british_museum", 1753, "season_winter", context) then
		effect.historical_event("british_museum", context)
		return true
	end
	return false
end

--[[ brotherhood_of_the_wolf ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("brotherhood_of_the_wolf", 1767, "season_summer", context) then
		effect.historical_event("brotherhood_of_the_wolf", context)
		return true
	end
	return false
end

--[[ broughton_rules ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("broughton_rules", 1743, "season_summer", context) then
		effect.historical_event("broughton_rules", context)
		return true
	end
	return false
end

--[[ calendar_changes ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("calendar_changes", 1751, "season_summer", context) then
		effect.historical_event("calendar_changes", context)
		return true
	end
	return false
end

--[[ cast_steel ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("cast_steel", 1735, "season_summer", context) then
		effect.historical_event("cast_steel", context)
		return true
	end
	return false
end

--[[ celsius_scale ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("celsius_scale", 1741, "season_winter", context) then
		effect.historical_event("celsius_scale", context)
		return true
	end
	return false
end

--[[ cheese_revolution ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("cheese_revolution", 1758, "season_summer", context) then
		effect.historical_event("cheese_revolution", context)
		return true
	end
	return false
end

--[[ chlorine_disinfectant ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("chlorine_disinfectant", 1773, "season_summer", context) then
		effect.historical_event("chlorine_disinfectant", context)
		return true
	end
	return false
end

--[[ circular_saw ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("circular_saw", 1777, "season_summer", context) then
		effect.historical_event("circular_saw", context)
		return true
	end
	return false
end

--[[ circus_london ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("circus_london", 1768, "season_winter", context) then
		effect.historical_event("circus_london", context)
		return true
	end
	return false
end

--[[ clever_stick ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("clever_stick", 1736, "season_winter", context) then
		effect.historical_event("clever_stick", context)
		return true
	end
	return false
end

--[[ company_of_quenching_fire ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("company_of_quenching_fire", 1703, "season_winter", context) then
		effect.historical_event("company_of_quenching_fire", context)
		return true
	end
	return false
end

--[[ copyright_act ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("copyright_act", 1709, "season_winter", context) then
		effect.historical_event("copyright_act", context)
		return true
	end
	return false
end

--[[ cornish_cumudgeonly_ways ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("cornish_cumudgeonly_ways", 1777, "season_winter", context) then
		effect.historical_event("cornish_cumudgeonly_ways", context)
		return true
	end
	return false
end

--[[ critique_of_pure_reason ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("critique_of_pure_reason", 1781, "season_winter", context) then
		effect.historical_event("critique_of_pure_reason", context)
		return true
	end
	return false
end

--[[ cuckoo_clock ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("cuckoo_clock", 1738, "season_summer", context) then
		effect.historical_event("cuckoo_clock", context)
		return true
	end
	return false
end

--[[ daily_courant_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("daily_courant_published", 1702, "season_summer", context) then
		effect.historical_event("daily_courant_published", context)
		return true
	end
	return false
end

--[[ daily_universal_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("daily_universal_published", 1788, "season_summer", context) then
		effect.historical_event("daily_universal_published", context)
		return true
	end
	return false
end

--[[ dark_day_new_england ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("dark_day_new_england", 1780, "season_winter", context) then
		effect.historical_event("dark_day_new_england", context)
		return true
	end
	return false
end

--[[ death_penalty_rescinded ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("death_penalty_rescinded", 1786, "season_summer", context) then
		effect.historical_event("death_penalty_rescinded", context)
		return true
	end
	return false
end

--[[ decline_and_fall_roman_empire ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("decline_and_fall_roman_empire", 1776, "season_winter", context) then
		effect.historical_event("decline_and_fall_roman_empire", context)
		return true
	end
	return false
end

--[[ defoe_pillaried ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("defoe_pillaried", 1703, "season_summer", context) then
		effect.historical_event("defoe_pillaried", context)
		return true
	end
	return false
end

--[[ denmark_norway_germany_adopt_gregorian_calendar ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("denmark_norway_germany_adopt_gregorian_calendar", 1700, "season_summer", context) then
		effect.historical_event("denmark_norway_germany_adopt_gregorian_calendar", context)
		return true
	end
	return false
end

--[[ downing_street ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("downing_street", 1731, "season_summer", context) then
		effect.historical_event("downing_street", context)
		return true
	end
	return false
end

--[[ dublin_gazette_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("dublin_gazette_published", 1706, "season_summer", context) then
		effect.historical_event("dublin_gazette_published", context)
		return true
	end
	return false
end

--[[ earl_tyburn_jig ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("earl_tyburn_jig", 1760, "season_summer", context) then
		effect.historical_event("earl_tyburn_jig", context)
		return true
	end
	return false
end

--[[ electrical_condenser ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("electrical_condenser", 1745, "season_summer", context) then
		effect.historical_event("electrical_condenser", context)
		return true
	end
	return false
end

--[[ encyclopaedia_britannica ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("encyclopaedia_britannica", 1771, "season_summer", context) then
		effect.historical_event("encyclopaedia_britannica", context)
		return true
	end
	return false
end

--[[ encyclopedie_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("encyclopedie_published", 1751, "season_summer", context) then
		effect.historical_event("encyclopedie_published", context)
		return true
	end
	return false
end

--[[ enormous_bell ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("enormous_bell", 1737, "season_summer", context) then
		effect.historical_event("enormous_bell", context)
		return true
	end
	return false
end

--[[ euro_porcelain ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("euro_porcelain", 1708, "season_summer", context) then
		effect.historical_event("euro_porcelain", context)
		return true
	end
	return false
end

--[[ filth_and_naughtiness ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("filth_and_naughtiness", 1747, "season_summer", context) then
		effect.historical_event("filth_and_naughtiness", context)
		return true
	end
	return false
end

--[[ first_lord_of_lunch ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("first_lord_of_lunch", 1762, "season_summer", context) then
		effect.historical_event("first_lord_of_lunch", context)
		return true
	end
	return false
end

--[[ first_piano ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("first_piano", 1709, "season_winter", context) then
		effect.historical_event("first_piano", context)
		return true
	end
	return false
end

--[[ first_pow_camp ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("first_pow_camp", 1796, "season_summer", context) then
		effect.historical_event("first_pow_camp", context)
		return true
	end
	return false
end

--[[ first_public_zoological_gardens ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("first_public_zoological_gardens", 1794, "season_summer", context) then
		effect.historical_event("first_public_zoological_gardens", context)
		return true
	end
	return false
end

--[[ first_restaurant_paris ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("first_restaurant_paris", 1765, "season_summer", context) then
		effect.historical_event("first_restaurant_paris", context)
		return true
	end
	return false
end

--[[ flushing_toiletoscope ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("flushing_toiletoscope", 1775, "season_summer", context) then
		effect.historical_event("flushing_toiletoscope", context)
		return true
	end
	return false
end

--[[ flute_player_mechanical_duck ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("flute_player_mechanical_duck", 1738, "season_winter", context) then
		effect.historical_event("flute_player_mechanical_duck", context)
		return true
	end
	return false
end

--[[ freemasons_america ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("freemasons_america", 1733, "season_summer", context) then
		effect.historical_event("freemasons_america", context)
		return true
	end
	return false
end

--[[ freemasons_founded ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("freemasons_founded", 1717, "season_winter", context) then
		effect.historical_event("freemasons_founded", context)
		return true
	end
	return false
end

--[[ fruit_kills_scurvy ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("fruit_kills_scurvy", 1747, "season_winter", context) then
		effect.historical_event("fruit_kills_scurvy", context)
		return true
	end
	return false
end

--[[ gas_lighting ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("gas_lighting", 1798, "season_summer", context) then
		effect.historical_event("gas_lighting", context)
		return true
	end
	return false
end

--[[ gentleman_highwayman ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("gentleman_highwayman", 1750, "season_winter", context) then
		effect.historical_event("gentleman_highwayman", context)
		return true
	end
	return false
end

--[[ global_circulation ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("global_circulation", 1735, "season_winter", context) then
		effect.historical_event("global_circulation", context)
		return true
	end
	return false
end

--[[ guillotine_invented ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("guillotine_invented", 1789, "season_summer", context) then
		effect.historical_event("guillotine_invented", context)
		return true
	end
	return false
end

--[[ guiness_brewery_founded ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("guiness_brewery_founded", 1759, "season_winter", context) then
		effect.historical_event("guiness_brewery_founded", context)
		return true
	end
	return false
end

--[[ gullivers_travels ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("gullivers_travels", 1726, "season_winter", context) then
		effect.historical_event("gullivers_travels", context)
		return true
	end
	return false
end

--[[ halleys_comet_again ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("halleys_comet_again", 1758, "season_winter", context) then
		effect.historical_event("halleys_comet_again", context)
		return true
	end
	return false
end

--[[ handel_dies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("handel_dies", 1759, "season_summer", context) then
		effect.historical_event("handel_dies", context)
		return true
	end
	return false
end

--[[ harris_list_ladies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("harris_list_ladies", 1757, "season_summer", context) then
		effect.historical_event("harris_list_ladies", context)
		return true
	end
	return false
end

--[[ haydn_the_creation ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("haydn_the_creation", 1798, "season_summer", context) then
		effect.historical_event("haydn_the_creation", context)
		return true
	end
	return false
end

--[[ hellfire_club_english ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("hellfire_club_english", 1755, "season_summer", context) then
		effect.historical_event("hellfire_club_english", context)
		return true
	end
	return false
end

--[[ hellfire_club_irish ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("hellfire_club_irish", 1796, "season_winter", context) then
		effect.historical_event("hellfire_club_irish", context)
		return true
	end
	return false
end

--[[ herculaneum_excavation ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("herculaneum_excavation", 1738, "season_summer", context) then
		effect.historical_event("herculaneum_excavation", context)
		return true
	end
	return false
end

--[[ herschel_discovers_infrared_radiation ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("herschel_discovers_infrared_radiation", 1800, "season_summer", context) then
		effect.historical_event("herschel_discovers_infrared_radiation", context)
		return true
	end
	return false
end

--[[ herschel_discovers_uranus ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("herschel_discovers_uranus", 1781, "season_summer", context) then
		effect.historical_event("herschel_discovers_uranus", context)
		return true
	end
	return false
end

--[[ hydraulic_press ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("hydraulic_press", 1795, "season_summer", context) then
		effect.historical_event("hydraulic_press", context)
		return true
	end
	return false
end

--[[ hydrogen_discovered ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("hydrogen_discovered", 1766, "season_summer", context) then
		effect.historical_event("hydrogen_discovered", context)
		return true
	end
	return false
end

--[[ irish_code_duello ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("irish_code_duello", 1777, "season_summer", context) then
		effect.historical_event("irish_code_duello", context)
		return true
	end
	return false
end

--[[ isle_of_man ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("isle_of_man", 1765, "season_summer", context) then
		effect.historical_event("isle_of_man", context)
		return true
	end
	return false
end

--[[ jack_sheppard_hanged ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("jack_sheppard_hanged", 1724, "season_winter", context) then
		effect.historical_event("jack_sheppard_hanged", context)
		return true
	end
	return false
end

--[[ jamesons_distillery ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("jamesons_distillery", 1780, "season_summer", context) then
		effect.historical_event("jamesons_distillery", context)
		return true
	end
	return false
end

--[[ jonathan_wild_swings ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("jonathan_wild_swings", 1725, "season_summer", context) then
		effect.historical_event("jonathan_wild_swings", context)
		return true
	end
	return false
end

--[[ kidd_hanged ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("kidd_hanged", 1701, "season_summer", context) then
		effect.historical_event("kidd_hanged", context)
		return true
	end
	return false
end

--[[ kinetic_gas_theory ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("kinetic_gas_theory", 1738, "season_winter", context) then
		effect.historical_event("kinetic_gas_theory", context)
		return true
	end
	return false
end

--[[ last_jig_at_the_tyburn_tree ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("last_jig_at_the_tyburn_tree", 1783, "season_winter", context) then
		effect.historical_event("last_jig_at_the_tyburn_tree", context)
		return true
	end
	return false
end

--[[ lavoisier_discovers_oxygen ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("lavoisier_discovers_oxygen", 1774, "season_summer", context) then
		effect.historical_event("lavoisier_discovers_oxygen", context)
		return true
	end
	return false
end

--[[ lightning_rod_lesson ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("lightning_rod_lesson", 1769, "season_winter", context) then
		effect.historical_event("lightning_rod_lesson", context)
		return true
	end
	return false
end

--[[ lions_extinct_libya ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("lions_extinct_libya", 1700, "season_summer", context) then
		effect.historical_event("lions_extinct_libya", context)
		return true
	end
	return false
end

--[[ london_monster ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("london_monster", 1790, "season_summer", context) then
		effect.historical_event("london_monster", context)
		return true
	end
	return false
end

--[[ longman_founded ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("longman_founded", 1724, "season_winter", context) then
		effect.historical_event("longman_founded", context)
		return true
	end
	return false
end

--[[ loves_of_mars_and_venus ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("loves_of_mars_and_venus", 1717, "season_winter", context) then
		effect.historical_event("loves_of_mars_and_venus", context)
		return true
	end
	return false
end

--[[ lucky_lucky_fellow ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("lucky_lucky_fellow", 1798, "season_summer", context) then
		effect.historical_event("lucky_lucky_fellow", context)
		return true
	end
	return false
end

--[[ lunar_society ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("lunar_society", 1775, "season_winter", context) then
		effect.historical_event("lunar_society", context)
		return true
	end
	return false
end

--[[ marriage_act ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("marriage_act", 1754, "season_summer", context) then
		effect.historical_event("marriage_act", context)
		return true
	end
	return false
end

--[[ masked_man_dies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("masked_man_dies", 1703, "season_summer", context) then
		effect.historical_event("masked_man_dies", context)
		return true
	end
	return false
end

--[[ maudsleys_precision_lathe ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("maudsleys_precision_lathe", 1797, "season_summer", context) then
		effect.historical_event("maudsleys_precision_lathe", context)
		return true
	end
	return false
end

--[[ mercury_thermometer ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("mercury_thermometer", 1724, "season_summer", context) then
		effect.historical_event("mercury_thermometer", context)
		return true
	end
	return false
end

--[[ messiers_objects ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("messiers_objects", 1781, "season_winter", context) then
		effect.historical_event("messiers_objects", context)
		return true
	end
	return false
end

--[[ meteorite_wold_newton ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("meteorite_wold_newton", 1795, "season_summer", context) then
		effect.historical_event("meteorite_wold_newton", context)
		return true
	end
	return false
end

--[[ michell_blackholes ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("michell_blackholes", 1784, "season_summer", context) then
		effect.historical_event("michell_blackholes", context)
		return true
	end
	return false
end

--[[ mohocks_abound ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("mohocks_abound", 1712, "season_summer", context) then
		effect.historical_event("mohocks_abound", context)
		return true
	end
	return false
end

--[[ montgolfier_balloon ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("montgolfier_balloon", 1783, "season_summer", context) then
		effect.historical_event("montgolfier_balloon", context)
		return true
	end
	return false
end

--[[ moscow_news ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("moscow_news", 1756, "season_summer", context) then
		effect.historical_event("moscow_news", context)
		return true
	end
	return false
end

--[[ mozart_dies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("mozart_dies", 1791, "season_summer", context) then
		effect.historical_event("mozart_dies", context)
		return true
	end
	return false
end

--[[ mozart_eine_kleine_nachtmusik ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("mozart_eine_kleine_nachtmusik", 1787, "season_summer", context) then
		effect.historical_event("mozart_eine_kleine_nachtmusik", context)
		return true
	end
	return false
end

--[[ mungo_park_segu ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("mungo_park_segu", 1796, "season_summer", context) then
		effect.historical_event("mungo_park_segu", context)
		return true
	end
	return false
end

--[[ murder_most_horrid ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("murder_most_horrid", 1725, "season_winter", context) then
		effect.historical_event("murder_most_horrid", context)
		return true
	end
	return false
end

--[[ new_atomic_theory ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("new_atomic_theory", 1758, "season_summer", context) then
		effect.historical_event("new_atomic_theory", context)
		return true
	end
	return false
end

--[[ new_britain_discovered ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("new_britain_discovered", 1700, "season_winter", context) then
		effect.historical_event("new_britain_discovered", context)
		return true
	end
	return false
end

--[[ orrery_invented ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("orrery_invented", 1704, "season_summer", context) then
		effect.historical_event("orrery_invented", context)
		return true
	end
	return false
end

--[[ ottoman_press ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("ottoman_press", 1729, "season_summer", context) then
		effect.historical_event("ottoman_press", context)
		return true
	end
	return false
end

--[[ pants_on_fire ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("pants_on_fire", 1726, "season_summer", context) then
		effect.historical_event("pants_on_fire", context)
		return true
	end
	return false
end

--[[ petticoat_duel ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("petticoat_duel", 1792, "season_summer", context) then
		effect.historical_event("petticoat_duel", context)
		return true
	end
	return false
end

--[[ piratey_bishop ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("piratey_bishop", 1743, "season_winter", context) then
		effect.historical_event("piratey_bishop", context)
		return true
	end
	return false
end

--[[ potato_mandate ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("potato_mandate", 1757, "season_summer", context) then
		effect.historical_event("potato_mandate", context)
		return true
	end
	return false
end

--[[ preserved_in_vitriol ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("preserved_in_vitriol", 1719, "season_summer", context) then
		effect.historical_event("preserved_in_vitriol", context)
		return true
	end
	return false
end

--[[ princeton_founded ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("princeton_founded", 1746, "season_summer", context) then
		effect.historical_event("princeton_founded", context)
		return true
	end
	return false
end

--[[ prussian_census ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("prussian_census", 1719, "season_winter", context) then
		effect.historical_event("prussian_census", context)
		return true
	end
	return false
end

--[[ radical_suggestion ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("radical_suggestion", 1770, "season_summer", context) then
		effect.historical_event("radical_suggestion", context)
		return true
	end
	return false
end

--[[ rakes_progress ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("rakes_progress", 1735, "season_summer", context) then
		effect.historical_event("rakes_progress", context)
		return true
	end
	return false
end

--[[ reflexions_critiques ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("reflexions_critiques", 1735, "season_winter", context) then
		effect.historical_event("reflexions_critiques", context)
		return true
	end
	return false
end

--[[ robbie_burns ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("robbie_burns", 1786, "season_summer", context) then
		effect.historical_event("robbie_burns", context)
		return true
	end
	return false
end

--[[ robinson_crusoe_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("robinson_crusoe_published", 1717, "season_winter", context) then
		effect.historical_event("robinson_crusoe_published", context)
		return true
	end
	return false
end

--[[ rosetta_stone ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("rosetta_stone", 1799, "season_summer", context) then
		effect.historical_event("rosetta_stone", context)
		return true
	end
	return false
end

--[[ rule_britannia ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("rule_britannia", 1740, "season_summer", context) then
		effect.historical_event("rule_britannia", context)
		return true
	end
	return false
end

--[[ russia_julian ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("russia_julian", 1700, "season_winter", context) then
		effect.historical_event("russia_julian", context)
		return true
	end
	return false
end

--[[ saint_patrick_of_noo_yawk ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("saint_patrick_of_noo_yawk", 1756, "season_summer", context) then
		effect.historical_event("saint_patrick_of_noo_yawk", context)
		return true
	end
	return false
end

--[[ sausage_dictionary ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("sausage_dictionary", 1755, "season_winter", context) then
		effect.historical_event("sausage_dictionary", context)
		return true
	end
	return false
end

--[[ selkirk_rescued ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("selkirk_rescued", 1709, "season_summer", context) then
		effect.historical_event("selkirk_rescued", context)
		return true
	end
	return false
end

--[[ senefelder_lithography ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("senefelder_lithography", 1798, "season_summer", context) then
		effect.historical_event("senefelder_lithography", context)
		return true
	end
	return false
end

--[[ shakespeare_festival ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("shakespeare_festival", 1769, "season_summer", context) then
		effect.historical_event("shakespeare_festival", context)
		return true
	end
	return false
end

--[[ smallpox_euro_inoculation ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("smallpox_euro_inoculation", 1701, "season_winter", context) then
		effect.historical_event("smallpox_euro_inoculation", context)
		return true
	end
	return false
end

--[[ smallpox_jenner_vaccination ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("smallpox_jenner_vaccination", 1796, "season_summer", context) then
		effect.historical_event("smallpox_jenner_vaccination", context)
		return true
	end
	return false
end

--[[ smarty_pants_bifocal_glasses ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("smarty_pants_bifocal_glasses", 1784, "season_summer", context) then
		effect.historical_event("smarty_pants_bifocal_glasses", context)
		return true
	end
	return false
end

--[[ smarty_pants_cheats_electric_death ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("smarty_pants_cheats_electric_death", 1752, "season_summer", context) then
		effect.historical_event("smarty_pants_cheats_electric_death", context)
		return true
	end
	return false
end

--[[ society_of_jesus ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("society_of_jesus", 1773, "season_winter", context) then
		effect.historical_event("society_of_jesus", context)
		return true
	end
	return false
end

--[[ south_sea_bubble ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("south_sea_bubble", 1720, "season_summer", context) then
		effect.historical_event("south_sea_bubble", context)
		return true
	end
	return false
end

--[[ species_planetarum ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("species_planetarum", 1753, "season_summer", context) then
		effect.historical_event("species_planetarum", context)
		return true
	end
	return false
end

--[[ systema_naturae ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("systema_naturae", 1735, "season_winter", context) then
		effect.historical_event("systema_naturae", context)
		return true
	end
	return false
end

--[[ terribly_good_egg ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("terribly_good_egg", 1740, "season_summer", context) then
		effect.historical_event("terribly_good_egg", context)
		return true
	end
	return false
end

--[[ the_female_warrior ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("the_female_warrior", 1750, "season_summer", context) then
		effect.historical_event("the_female_warrior", context)
		return true
	end
	return false
end

--[[ the_necklace_affair ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("the_necklace_affair", 1785, "season_summer", context) then
		effect.historical_event("the_necklace_affair", context)
		return true
	end
	return false
end

--[[ the_observer_published ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("the_observer_published", 1791, "season_summer", context) then
		effect.historical_event("the_observer_published", context)
		return true
	end
	return false
end

--[[ theatre_royal ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("theatre_royal", 1732, "season_summer", context) then
		effect.historical_event("theatre_royal", context)
		return true
	end
	return false
end

--[[ theatrical_censorship ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("theatrical_censorship", 1737, "season_winter", context) then
		effect.historical_event("theatrical_censorship", context)
		return true
	end
	return false
end

--[[ titania_and_oberon ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("titania_and_oberon", 1787, "season_summer", context) then
		effect.historical_event("titania_and_oberon", context)
		return true
	end
	return false
end

--[[ to_the_people_of_the_netherlands ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("to_the_people_of_the_netherlands", 1781, "season_summer", context) then
		effect.historical_event("to_the_people_of_the_netherlands", context)
		return true
	end
	return false
end

--[[ top_hat_nuisance ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("top_hat_nuisance", 1797, "season_summer", context) then
		effect.historical_event("top_hat_nuisance", context)
		return true
	end
	return false
end

--[[ transit_of_venus ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("transit_of_venus", 1761, "season_summer", context) then
		effect.historical_event("transit_of_venus", context)
		return true
	end
	return false
end

--[[ trippy_dreams ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("trippy_dreams", 1732, "season_winter", context) then
		effect.historical_event("trippy_dreams", context)
		return true
	end
	return false
end

--[[ vampire_attack_serbia ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("vampire_attack_serbia", 1725, "season_winter", context) then
		effect.historical_event("vampire_attack_serbia", context)
		return true
	end
	return false
end

--[[ venus_mercury_occultation ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("venus_mercury_occultation", 1737, "season_winter", context) then
		effect.historical_event("venus_mercury_occultation", context)
		return true
	end
	return false
end

--[[ very_unpopular_book ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("very_unpopular_book", 1758, "season_winter", context) then
		effect.historical_event("very_unpopular_book", context)
		return true
	end
	return false
end

--[[ vivaldi_dies ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("vivaldi_dies", 1741, "season_summer", context) then
		effect.historical_event("vivaldi_dies", context)
		return true
	end
	return false
end

--[[ vivaldi_four_seasons ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("vivaldi_four_seasons", 1725, "season_summer", context) then
		effect.historical_event("vivaldi_four_seasons", context)
		return true
	end
	return false
end

--[[ volta_electric_pistol ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("volta_electric_pistol", 1786, "season_summer", context) then
		effect.historical_event("volta_electric_pistol", context)
		return true
	end
	return false
end

--[[ voltaic_pile ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("voltaic_pile", 1800, "season_summer", context) then
		effect.historical_event("voltaic_pile", context)
		return true
	end
	return false
end

--[[ voltaires_candide ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("voltaires_candide", 1759, "season_winter", context) then
		effect.historical_event("voltaires_candide", context)
		return true
	end
	return false
end

--[[ wall_street_opens ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("wall_street_opens", 1792, "season_summer", context) then
		effect.historical_event("wall_street_opens", context)
		return true
	end
	return false
end

--[[ waterford_crystal ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("waterford_crystal", 1783, "season_summer", context) then
		effect.historical_event("waterford_crystal", context)
		return true
	end
	return false
end

--[[ wesley_converted ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("wesley_converted", 1737, "season_summer", context) then
		effect.historical_event("wesley_converted", context)
		return true
	end
	return false
end

--[[ wesley_methodism_chartered ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("wesley_methodism_chartered", 1784, "season_summer", context) then
		effect.historical_event("wesley_methodism_chartered", context)
		return true
	end
	return false
end

--[[ whitneys_cotton_gin ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("whitneys_cotton_gin", 1793, "season_summer", context) then
		effect.historical_event("whitneys_cotton_gin", context)
		return true
	end
	return false
end

--[[ wild_peter_hanover ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("wild_peter_hanover", 1724, "season_summer", context) then
		effect.historical_event("wild_peter_hanover", context)
		return true
	end
	return false
end

--[[ witchcraft_austria ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("witchcraft_austria", 1776, "season_summer", context) then
		effect.historical_event("witchcraft_austria", context)
		return true
	end
	return false
end

--[[ witchcraft_britain ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("witchcraft_britain", 1736, "season_winter", context) then
		effect.historical_event("witchcraft_britain", context)
		return true
	end
	return false
end

--[[ yale_founded ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent("yale_founded", 1701, "season_summer", context) then
		effect.historical_event("yale_founded", context)
		return true
	end
	return false
end

