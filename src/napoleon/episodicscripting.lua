-- Set up the "include" paths
package.path = ";?.lua;data/ui/templates/?.lua;data/ui/?.lua"

-- Declare this file as an "exportable" module
module(..., package.seeall)

-- Import the events table so we can add callbacks for each game event
local core = require "CoreUtils"
local events = core.Require "data.events"
local message_handler = core.Require "message_handler"

out.ting("loading episodic scripting")

--------------------------------------------------------------------------------------------------------------------
-- Local variables - these are essentially private data

-- Declare the interface to the AI module specified in EpisodicScriptingEnv.cpp
game_interface = nil
local m_hidden_components = {}
local m_root = nil
local m_campaign = nil
local m_saved_state = nil
local m_user_defined_event_callbacks = {}
local m_in_campaign = false

-- A list of components which should currently be highlighted.
local m_highlighted_components			= {}
local m_highlighted_construction_items	= {}
local m_highlighted_recruitment_items	= {}

-- Modders don't have to follow this format, this isn't necessarily the best way of going about things, it's just an option we choose
-- Define feature sets and components that are disabled/hidden by default at the start of the campaign

local m_starting_configuration =	{
																	 
										["tutorial"] =
										{
											["Features"]			= { "disable_elections" },
											["Hidden"]				= { "funds", "navy_promote" },
											["Disabled"]			= { },
											["Building"]			= { "tSecret1_gentlemens_club", 
																		"rIron1_iron_mine", "rIron2_steam-pumped_iron_mine", "rIron3_industrial_iron_mining_complex",
																		"pTrade1_trading_port", "pNavy1_shipyard", "pTrade2_commercial_port", "pTrade3_trading_company", 
																		"sArmy1_cantonment", "sArmy4_military_academy",
																		"sFortifications1_settlement_fortifications", 
																		"sAdmin1_tax_office", "sAdmin2_magistrate", "sAdmin4_court_appeals", 
																		"tEducation1_college", "tEducation2_university",
																		"tGuns1_gunsmith", "tGuns2_musket_manufactury", "tGuns3_small_arms_factory",
																		"tFactory1_manufactory", "tFactory2_factory",
																		"sCannon1_cannon_foundry", "sCannon2_ordnance_factory", "sCannon3_great_arsenal", "sCannon4_ordnance_board", "sCannon5_engineer_school",
																		"sCulture1_Theatre", "sCulture2_opera_house",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		"sCannon1_cannon_foundry", "sCannon2_ordnance_factory", "sCannon3_great_arsenal", "sCannon4_ordnance_board", "sCannon5_engineer_school",
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= { },
											["Intro_movie"]			= "NCS_01_Tut_Intro.bik",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},							 				
										["ita_napoleon"] =
										{
											["Features"]			= { "disable_elections" },
											["Hidden"]				= { "army_fort", "button_tech" },
											["Disabled"]			= { },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"tCommerce3_banking_house", 
																		"tEducation3_enlightened_university", 
																		"tFactory3_steam_powered_factory", 
																		"tGuns3_small_arms_factory", 
																		"tSecret3_masonic_lodge", 
																		"tSupply3_supply_depot", 
																		"sAdmin3_court_justice", "sAdmin4_court_appeals", "sAdmin5_court_supreme",
																		"sArmy3_drill_school", "sArmy4_military_academy", "sArmy5_staff_college",
																		"sCannon3_great_arsenal", "sCannon4_ordnance_board", "sCannon5_engineer_school",
																		"sCulture3_grand_opera_house", "sCulture4_great_museum",
																		"sFortifications1_settlement_fortifications", "sFortifications2_improved_settlement_fort",  
																		"sRoads3_tarmac_roads", 
																		"rFarm3_great_estates", 
																		"rGold2_steam-pumped_gold_mine", "rGold3_industrial_gold_mining_complex", 
																		"rHorse3_equestrian_estate", 
																		"rIron3_industrial_iron_mining_complex", 
																		"rTimber3_steam_powered_sawmill",
																		
																		"pTradeTutorial1_trading_port", 
																		"pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", "tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", "sCulture2Tutorial_opera_house",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= { "Inf_Light_Lombardy-Cisalpine_Legion" },
											["Intro_movie"]			= "NCS_03_Ita_Intro.bik",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},
										["mp_ita_napoleon"] =
										{
											["Features"]			= { "disable_elections" },
											["Hidden"]				= { "army_fort", "button_tech"},
											["Disabled"]			= { },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"tCommerce3_banking_house", 
																		"tEducation3_enlightened_university", 
																		"tFactory3_steam_powered_factory", 
																		"tGuns3_small_arms_factory", 
																		"tSecret3_masonic_lodge", 
																		"tSupply3_supply_depot", 
																		"sAdmin3_court_justice", "sAdmin4_court_appeals", "sAdmin5_court_supreme",
																		"sArmy3_drill_school", "sArmy4_military_academy", "sArmy5_staff_college",
																		"sCannon3_great_arsenal", "sCannon4_ordnance_board", "sCannon5_engineer_school",
																		"sCulture3_grand_opera_house", "sCulture4_great_museum",
																		"sFortifications1_settlement_fortifications", "sFortifications2_improved_settlement_fort",  
																		"sRoads3_tarmac_roads", 
																		"rFarm3_great_estates",
																		"rGold2_steam-pumped_gold_mine", "rGold3_industrial_gold_mining_complex", 
																		"rHorse3_equestrian_estate", 
																		"rIron3_industrial_iron_mining_complex", 
																		"rTimber3_steam_powered_sawmill",
																		
																		"pTradeTutorial1_trading_port", 
																		"pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", "tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", "sCulture2Tutorial_opera_house",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= {  },
											["Intro_movie"]			= "",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},										
										["egy_napoleon"] =
										{
											["Features"]			= { "disable_elections" },
											["Hidden"]				= { "army_fort" , "button_diplomacy"},
											["Disabled"]			= { },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"pTradeTutorial1_trading_port", 
																		"pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", "tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", "sCulture2Tutorial_opera_house", 
																		"sFortifications1_settlement_fortifications", "sFortifications2_improved_settlement_fort",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= {  },
											["Intro_movie"]			= "NCS_05_Egy_Intro.bik",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},
										["mp_egy_napoleon"] =
										{
											["Features"]			= { "disable_elections" },
											["Hidden"]				= { "army_fort" },
											["Disabled"]			= { },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"pTradeTutorial1_trading_port", "pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", 
																		"tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", 
																		"sCulture2Tutorial_opera_house",
																		"sFortifications1_settlement_fortifications", "sFortifications2_improved_settlement_fort",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= {  },
											["Intro_movie"]			= "",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},										
										["eur_napoleon"] =
										{
											["Features"]			= { },
											["Hidden"]				= { "army_fort"},
											["Disabled"]			= {  },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"pTradeTutorial1_trading_port", 
																		"pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", "tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", "sCulture2Tutorial_opera_house",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= {  },
											["Intro_movie"]			= "NCS_07_Eur_Intro.bik",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},
										["mp_eur_napoleon"] =
										{
											["Features"]			= { },
											["Hidden"]				= { "army_fort"},
											["Disabled"]			= {  },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"pTradeTutorial1_trading_port", 
																		"pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", "tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", "sCulture2Tutorial_opera_house",
																		
																		-- Disable those Spanish building chains 
																		"sAdminSpain1_tax_office", "sAdminSpain2_magistrate", "sAdminSpain3_court_justice", "sAdminSpain4_court_appeals", "sAdminSpain5_court_supreme",
																		"sArmySpain1_cantonment", "sArmySpain2_barracks", "sArmySpain3_drill_school", "sArmySpain4_military_academy", "sArmySpain5_staff_college",
																		
																		
																		"pSupplySpain1_supply_port", "pSupplySpain2_military_supply_port", "pSupplySpain3_military_port_complex",
																		"pNavySpain1_shipyard", "pNavySpain2_dockyard", "pNavySpain3_steam_drydock",
																		
																		"rTimberSpain1_timber_logging_camp", "rTimberSpain2_timber_lumber_mill", "rTimberSpain3_steam_powered_sawmill",
																		"rIronSpain1_iron_mine", "rIronSpain2_steam-pumped_iron_mine", "rIronSpain3_industrial_iron_mining_complex",
																		"rGoldSpain1_gold_mine", "rGoldSpain2_steam-pumped_gold_mine", "rGoldSpain3_industrial_gold_mining_complex",
																		
																		"tGunsSpain1_gunsmith", "tGunsSpain2_musket_manufactury", "tGunsSpain3_small_arms_factory",
																		"tCommerceSpain1_market", "tCommerceSpain2_merchant_house", "tCommerceSpain3_banking_house",
																		"tSupplySpain1_supply_post", "tSupplySpain2_supply_warehouse", "tSupplySpain3_supply_depot",
																		"tFactorySpain1_manufactory", "tFactorySpain2_factory", "tFactorySpain3_steam_powered_factory",
																		"tEducationSpain1_college", "tEducationSpain2_university", "tEducationSpain3_enlightened_university",
																		"tSecretSpain1_gentlemens_club", "tSecretSpain2_secret_society", "tSecretSpain3_masonic_lodge"},
											["Unit"]				= {  },
											["Intro_movie"]			= "",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},											
										["spa_napoleon"] =
										{
											["Features"]			= { },
											["Hidden"]				= { },
											["Disabled"]			= { },
											["Building"]			= { "rIronTutorial1_iron_mine", "rIronTutorial2_steam-pumped_iron_mine", "rIronTutorial3_industrial_iron_mining_complex",
																		"pTradeTutorial1_trading_port", "pNavyTutorial1_shipyard", 
																		"tEducationTutorial1_college", 
																		"sCannonTutorial1_cannon_foundry", 
																		"tGunsTutorial1_gunsmith", "tGunsTutorial2_musket_manufactury", 
																		"sArmyTutorial1_cantonment", 
																		"sCulture1Tutorial_Theatre", "sCulture2Tutorial_opera_house",
																		"sFortifications1_settlement_fortifications", "sFortifications2_improved_settlement_fort",
																																				
																		-- Disable those building chains being replaced
																		"sAdmin1_tax_office", "sAdmin2_magistrate", "sAdmin3_court_justice", "sAdmin4_court_appeals", "sAdmin5_court_supreme",
																		"sArmy1_cantonment", "sArmy2_barracks", "sArmy3_drill_school", "sArmy4_military_academy", "sArmy5_staff_college",
																		"sCannon1_cannon_foundry", "sCannon2_ordnance_factory", "sCannon3_great_arsenal", "sCannon4_ordnance_board", "sCannon5_engineer_school",
																		
																		"pTrade1_trading_port", "pTrade2_commercial_port", "pTrade3_trading_company",
																		"pNavy1_shipyard", "pNavy2_dockyard", "pNavy3_steam_drydock",
																		
																		"rTimber1_timber_logging_camp", "rTimber2_timber_lumber_mill", "rTimber3_steam_powered_sawmill",
																		"rIron1_iron_mine", "rIron2_steam-pumped_iron_mine", "rIron3_industrial_iron_mining_complex",
																		"rGold1_gold_mine", "rGold2_steam-pumped_gold_mine", "rGold3_industrial_gold_mining_complex",
																		
																		"tGuns1_gunsmith", "tGuns2_musket_manufactury", "tGuns3_small_arms_factory",
																		"tCommerce1_market", "tCommerce2_merchant_house", "tCommerce3_banking_house",
																		"tSupply1_supply_post", "tSupply2_supply_warehouse", "tSupply3_supply_depot",
																		"tFactory1_manufactory", "tFactory2_factory", "tFactory3_steam_powered_factory",
																		"tEducation1_college", "tEducation2_university", "tEducation3_enlightened_university",
																		"tSecret1_gentlemens_club", "tSecret2_secret_society", "tSecret3_masonic_lodge"},
											["Unit"]				= {  },
											["Intro_movie"]			= "",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},
										
									}							 
									  
--------------------------------------------------------------------------------------------------------------------
-- Local functions 
--------------------------------------------------------------------------------------------------------------------

-- Hide a component by divorcing it from it's parent
function HideComponent(id)
	local c = m_root:Find(id)
	local p = UIComponent(c):Parent()
	UIComponent(c):SetDisabled(true)
	m_hidden_components[id] = { ["Component"] = c,
						        ["Parent"]    = p,
							    ["Index"]	  = UIComponent(p):Divorce(c)
						   }
end

-- Reveal a component by getting it's original parent to re-adopt it.
-- This relies on the parent not ever being deleted, and the index remaining valid, otherwise things can go wrong
function RevealComponent(id)
	local details = m_hidden_components[id]
	
	if details ~= nil then
		out.ting("Revealing " .. id)
		UIComponent(details.Parent):Adopt(details.Component, details.Index)	
		
		-- Run the components script as if it was removed from UI tree at startup then it won't have had it's script run
		UIComponent(details.Component):SetDisabled(false)
		UIComponent(details.Component):RunScript()
		-- Clear the table entry
		m_hidden_components[id] = nil
	else
		out.ting("RevealComponent cannot find " .. id)
	end
end

function EnableComponent(id, enable)
	local c = UIComponent(m_root:Find(id))
	if enable then
		-- Cope with the pre-unification of button state naming conventions
		if c:SetState("normal") or c:SetState("Unselected") or c:SetState("up") then end
	else
		c:SetState("inactive")
		-- c:SetInteractive(false)
	end
end

events.HudRefresh[#events.HudRefresh+1] =
function ()
	out.ting("HUD refresh")

	for s,v in pairs( m_highlighted_components ) do
	
		local component_addr = m_root:Find( v )

		if component_addr ~= nil then

			local component = UIComponent( component_addr )
	
			component:Highlight( true )
		
		end
	
	end

	for s,v in pairs( m_highlighted_construction_items ) do

		CampaignUI.HighlightConstructionItem( v, true )
	
	end

	for s,v in pairs( m_highlighted_recruitment_items ) do

		CampaignUI.HighlightRecruitmentItem( v, true )
	
	end

end

-- Shane updated this to keep a history of the highlighted items so that when the HUD is reconstructed at any point 
-- it can reinstate any highlighting using the above funtion.
-- The event to listen for is HUD_REFRESH_EVENT.
function HighlightComponent( id, enable )

	local component_addr = m_root:Find( id )

	assert( component_addr ~= nil )

	if component_addr ~= nil then

		local component = UIComponent( component_addr )

		if enable == true then
		
			m_highlighted_components[ id ] = id
			
		else
		
			m_highlighted_components[ id ] = nil
			
		end
			
		component:Highlight( enable )

	else
		out.ting("HighlightComponent cannot find " .. id)
	end

end

function HighlightConstructionItem( building_key, enable )

	if enable == true then
	
		m_highlighted_construction_items[ building_key ] = building_key
		
	else
	
		m_highlighted_construction_items[ building_key ] = nil
		
	end

	CampaignUI.HighlightConstructionItem( building_key, enable )

end

function HighlightRecruitmentItem( unit_key, enable )

	if enable == true then

		m_highlighted_recruitment_items[ unit_key ] = unit_key

	else

		m_highlighted_recruitment_items[ unit_key ] = nil

	end
	
	CampaignUI.HighlightRecruitmentItem( unit_key, enable )

end

function ShowHUD(show)
	UIComponent(m_root:Find("veneer_DY")):SetVisible(show)
	message_handler.HideAllMessages(not show)
end

-- Go through all the hidden components we have and test if they have a parent
-- If they haven't then they won't get deleted when the UI tree is destroyed, so delete it now
local function OnDestroyed()
	if m_in_campaign then
		out.ting("exiting campaign, saving heirarchy")
		m_saved_state = m_root:SaveUIHeirarchy()
		
		for k, v in pairs(m_hidden_components) do
			if UIComponent(v.Component):Parent(false) == nil then
				Component.Destroy(v.Component, true)
			end
		end
	else
		out.ting("exiting non-campaign")
	end
	
	for k, v in pairs(m_hidden_components) do
		out.ting(k)
	end

	m_root = nil
	m_hidden_components = {}
	ClearMessageAutoShowOverrides()
end

--------------------------------------------------------------------------------------------------------------------
-- Define the feature set.  This has to be after the local function declarations as we call some of the functions
-- If these functions get too bloated then they can be explicitly declared in the local function section, it's just
-- that I like anonymous functions :)
--------------------------------------------------------------------------------------------------------------------

local m_features = { 
	-- This declares an anymous function that we can use to reveal various components
	["disable_elections"] = {
		["Enable"] = function()		end,
		["Disable"] = function()
			game_interface:disable_elections(true)
		end
		},
		
	["show_shroud_1_1"] = {
		["Enable"] = function()	
			game_interface:unveil_black_shroud("shroud_map_1_1")
			game_interface:set_map_bounds(-567, 281, -540, 256)
			game_interface:disable_shopping_for_ai_under_shroud(true)
		end,
		["Disable"] = function()
			ShowHUD(false)
		end,
		},
		
	["show_shroud_1_2"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_1_1")
			game_interface:unveil_black_shroud("shroud_map_1_2")
			game_interface:set_map_bounds(-567, 281, -533, 257)
		end,
		["Disable"] = function()	end
		},
		
	["show_shroud_1_3"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_1_2")
			game_interface:unveil_black_shroud("shroud_map_1_3")
			game_interface:set_map_bounds(-564, 294, -528, 256)
			game_interface:disable_shopping_for_ai_under_shroud(false)
		end,
		["Disable"] = function()	end
		},
		
	["show_shroud_2_1"] = {
		["Enable"] = function()
			game_interface:unveil_black_shroud("shroud_map_2_1")
			game_interface:set_map_bounds(-579, 306, -533, 259)
			game_interface:disable_shopping_for_ai_under_shroud(true)
		end,
		["Disable"] = function()
			ShowHUD(false)
		end,
		},
		
	["show_shroud_2_2"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_2_1")
			game_interface:unveil_black_shroud("shroud_map_2_2")
			game_interface:set_map_bounds(-579, 409, -351, 257)
		end,
		["Disable"] = function()	end
		},
		
	["show_shroud_2_3"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_2_2")
			game_interface:unveil_black_shroud("shroud_map_2_3")
			game_interface:set_map_bounds(-614, 409, -353, 257)
			game_interface:disable_shopping_for_ai_under_shroud(false)
		end,
		["Disable"] = function()	end
		},

	["start_of_ep5"] = {
		["Enable"] = function()		end,
		["Disable"] = function()
			ShowHUD(false)
			game_interface:set_zoom_limit(1.08, 0.02)
			CampaignUI.SetCameraZoom(1.04)
			CampaignUI.SetCameraTarget(-513.123, 301.675)
			game_interface:set_map_bounds(-779, 481, -323, -21) 
			game_interface:show_shroud(false)
			game_interface:enable_auto_generated_missions(true)
		end,
		},

	["government"] = {
		["Enable"] = function()
			RevealComponent("button_government")
			RevealComponent("ornate back")
			RevealComponent("faction_hud_flags")
		end,
		["Disable"] = function()	end
		},
		
	["list"] = {
		["Enable"] = function()
			RevealComponent("button_lists")
		end,
		["Disable"] = function()	end
		},

	["Hide_excess_on_government_screen"] = {
		["Enable"] = function()
			-- use visible flag instead of HideComponent to keep the uicomponent in the heirarchy
			-- scripts are called when switching tabs, the components in that script can only be hidden
			UIComponent(m_root:Find("tab_ministers")):SetVisible(false)
			UIComponent(m_root:Find("administration")):SetVisible(false)
			HideComponent("victory")
			HideComponent("arrow R")
			HideComponent("arrow L")
		end,
		["Disable"] = function()	end
		},

	["Hide_ita_egy_government_features_on_government_screen"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tab_ministers")):SetVisible(false)
			UIComponent(m_root:Find("tab_trade")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
	
	["Hide_spa_trade_on_government_screen"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("world market")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
	
	["Hide_spa_industry_on_tech_screen"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("entities_title")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
	
	["Hide_spa_button_diplomacy"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("button_diplomacy")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_ita_egy_government_tax_features"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tax_settings")):SetVisible(false)
			UIComponent(m_root:Find("tx_taxes")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},	
	
	["Hide_arrows_on_government_screen"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("info_box")):SetVisible(false)
			HideComponent("arrow R")
			HideComponent("arrow L")
		end,
		["Disable"] = function()	end
		},

	["Hide_excess_on_region_details"] = {
		["Enable"] = function()
			-- again set invisible instead of Hide
			UIComponent(m_root:Find("Public order panel layout")):SetVisible(false)
			UIComponent(m_root:Find("tax_panel")):SetVisible(false)
			-- Shane: This component has been removed.
			--UIComponent(m_root:Find("tx_turns_until...")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_pop_on_region_details"] = {
		["Enable"] = function()
			-- Shane: This component has been removed.
			-- UIComponent(m_root:Find("tx_turns_until...")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_ita_egy_population_on_region_details"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("Population panel layout")):SetVisible(false)
			UIComponent(m_root:Find("button_taxes")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
	
	["Hide_ita_minor_factions"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tab_minor_nations")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
	
	["hide_taxes_buttons"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tax_panel")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
		
	["show_taxes_buttons"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tax_panel")):SetVisible(true)
		end,
		["Disable"] = function()	end
		},
		
	["hide_help_buttons"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("button_advice")):SetVisible(false)
			UIComponent(m_root:Find("gilt_corner_TL")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
	
	["Hide_excess_on_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("infrastructure_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
			out.ting("build_demolish")
		end,
		["Disable"] = function()	end
		},
		
	["Hide_infrastructure_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("infrastructure_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Show_infrastructure_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("infrastructure_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(true)
			end
		end,
		["Disable"] = function()	end
		},	

	["Hide_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("review_DY", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Show_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("review_DY", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(true)
			end
		end,
		["Disable"] = function()	end
		},	
					
	["Hide_construction_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("construction_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Show_construction_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("construction_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(true)
			end
		end,
		["Disable"] = function()	end
		},	
		
	["Hide_naval_recruitment_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("naval_recruitment_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Show_naval_recruitment_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("naval_recruitment_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(true)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Hide_build_repair_button"] = {
		["Enable"] = function()
			local tab = m_root:Find("build_repair", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},	
		
	["Hide_building_upgrade_chain_button"] = {
		["Enable"] = function()
			local tab = m_root:Find("build_upgrade_altchain", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Hide_demolish_building_button"] = {
		["Enable"] = function()
			local tab = m_root:Find("build_demolish", false)
			if tab ~= nil then
				out.ting("demolish button found, hiding it")
				UIComponent(tab):SetVisible(false)
				--HideComponent("build_demolish") another script is using the same component, Hiding it with this will cause an error with the other script
			end
		end,
		["Disable"] = function()	end
		},
		
	["Hide_recruitment_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("recruitment_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},
		
	["Show_recruitment_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("recruitment_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(true)
			end
		end,
		["Disable"] = function()	end
		},	
	
	["Hide_prestige_tab"] = {
		["Enable"] = function()
			local tab = m_root:Find("tab_prestige", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},	
		
	["hide_declare_war_button"] = {
		["Enable"] = function()
			--UIComponent(m_root:Find("options_bar1")):SetDisabled(true)
			local tab = m_root:Find("options_bar1", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},	
	
	["hide_scupper_navy_button"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("navy_scupper")):SetVisible(false)
		end,
		["Disable"] = function()	

		end
		},	

	["Hide_excess_on_mission_panel"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tab_victory_conditions")):SetVisible(false)
			UIComponent(m_root:Find("tab_victory_conditions")):SetDisabled(true)
			UIComponent(m_root:Find("tab_prestige")):SetVisible(false)
			UIComponent(m_root:Find("tab_prestige")):SetDisabled(true)
		end,
		["Disable"] = function()	end
		},

	["unlockable_natives"] = {
		["Enable"] = function()
			game_interface:remove_restricted_unit_record("episodic_2_native_american_musketeer_auxiliary")
		end,
		["Disable"] = function()
			game_interface:add_restricted_unit_record("episodic_2_native_american_musketeer_auxiliary")
		end
		},

	["spawn_port"] = {
		["Enable"] = function()
			OverrideMessageAutoShow("new_port_emerges", true)
			game_interface:spawn_town_level("virginia", 1, true)
		end,
		["Disable"] = function()
			game_interface:disable_town_spawning(true)
		end
		},	
		
	["disable_end_turn"] = {
		["Enable"] = function()
			out.ting("End turn disabled")
			UIComponent(m_root:Find("button_end_turn")):SetVisible(false)
			UIComponent(m_root:Find("button_end_turn")):SetDisabled(true)
		end,
		["Disable"] = function()
			out.ting("End turn re-enabled")
			UIComponent(m_root:Find("button_end_turn")):SetVisible(true)
			UIComponent(m_root:Find("button_end_turn")):SetDisabled(false)
		end
		},

	["Hide_ita_egy_tabs_on_list_panel"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("fleets")):SetVisible(false)
			UIComponent(m_root:Find("fleets")):SetDisabled(true)
			UIComponent(m_root:Find("agents")):SetVisible(false)
			UIComponent(m_root:Find("agents")):SetDisabled(true)
		end,
		["Disable"] = function()	end
		},		
		
	["hide_banners"] = {
		["Enable"] = function()
			out.ting("banners hidden")
			UIComponent(m_root:Find("banners")):SetVisible(false)
		end,
		["Disable"] = function()
			out.ting("banners shown")
			UIComponent(m_root:Find("banners")):SetVisible(true)
		end
		},
	["hide_campaign_hud"] = {
		["Enable"] = function()
			out.ting("HUD hidden")
			UIComponent(m_root:Find("hud_left")):SetVisible(false)
			UIComponent(m_root:Find("hud_right")):SetVisible(false)
			UIComponent(m_root:Find("hud_center")):SetVisible(false)
		end,
		["Disable"] = function()
			out.ting("HUD shown")
			UIComponent(m_root:Find("hud_left")):SetVisible(true)
			UIComponent(m_root:Find("hud_right")):SetVisible(true)
			UIComponent(m_root:Find("hud_center")):SetVisible(true)
		end
		},
	
	["hide_radar_map"] = {
		["Enable"] = function()
			out.ting("radar map hidden")
			UIComponent(m_root:Find("radar_mask")):SetVisible(false)
			UIComponent(m_root:Find("zoom-")):SetVisible(false)
			UIComponent(m_root:Find("zoom+")):SetVisible(false)
			UIComponent(m_root:Find("map")):SetVisible(false)
			UIComponent(m_root:Find("radar")):SetVisible(false)
		end,
		["Disable"] = function()
			out.ting("radar map shown")
			UIComponent(m_root:Find("radar_mask")):SetVisible(true)
			UIComponent(m_root:Find("zoom-")):SetVisible(true)
			UIComponent(m_root:Find("zoom+")):SetVisible(true)
			UIComponent(m_root:Find("map")):SetVisible(true)
			UIComponent(m_root:Find("radar")):SetVisible(true)
		end
		},
	["hide_tech_button"] = {
		["Enable"] = function()
			out.ting("Tech button hidden")
			UIComponent(m_root:Find("button_tech")):SetVisible(false)
		end,
		["Disable"] = function()
			out.ting("Tech button revealed")
			UIComponent(m_root:Find("button_tech")):SetVisible(true)
		end
		},
	}

local function OnNewSession(context)
	out.ting("creating new game interface")
	game_interface = GAME(context)
end

local function OnWorldCreated(context)
	if game_interface:is_new_game() then
		effect.rewind_scripted_advice()	
	end
end

local function InitialiseCampaign()
	if not m_saved_state then
		out.ting("No saved heirarchy")

		if m_campaign ~= nil then
			-- These are not saved and is always hidden when going into a campaign. Restore them if needed
			out.ting("Starting campaign " .. m_campaign)
			-- Hide all the components that aren't used at the start of this campaign
			for i,v in ipairs(m_starting_configuration[m_campaign].Hidden) do
				HideComponent(v)
			end
			-- Disable all components marked as inactive at the start of this campaign
			for i,v in ipairs(m_starting_configuration[m_campaign].Disabled) do
				EnableComponent(v, false)
			end
			if game_interface:is_new_game() then
				-- effect.suspend_contextual_advice(true)
				-- features are can be complex, initize them only on new games.
				-- Call the function used to disable all the features at the start of this campaign
				for i,v in ipairs(m_starting_configuration[m_campaign].Features) do
					InitFeature(v)
				end
				-- these are saved automatically, activate them once only.
				-- Disable all the building listed
				for i,v in ipairs(m_starting_configuration[m_campaign].Building) do
					game_interface:add_restricted_building_level_record(v)
				end
				for i,v in ipairs(m_starting_configuration[m_campaign].Unit) do
					game_interface:add_restricted_unit_record(v)
				end
				for i,v in ipairs(m_starting_configuration[m_campaign].Exclusion_zone) do
					game_interface:add_exclusion_zone(	v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8]	)
				end

				for i,v in ipairs(m_starting_configuration[m_campaign].Visibility_trigger) do
					game_interface:add_visibility_trigger(	v[1], v[2], v[3]	)
				end
				for i,v in ipairs(m_starting_configuration[m_campaign].Location_trigger) do
					game_interface:add_location_trigger(	v[1], v[2], v[3], v[4]	)
				end
				game_interface:register_movies(m_starting_configuration[m_campaign].Intro_movie)
			end
			for i,v in ipairs(m_starting_configuration[m_campaign].Battlefield) do
				game_interface:add_custom_battlefield(	v[1], v[2], v[3], v[4], v[5]	)
			end
			for i,v in ipairs(m_starting_configuration[m_campaign].Settlement_override) do
				game_interface:add_settlement_model_override(	v[1], v[2]	)
			end
			for i,v in ipairs(m_starting_configuration[m_campaign].Building_override) do
				game_interface:add_building_model_override(	v[1], v[2], v[3]	)
			end
		end
	else
		m_hidden_components = m_root:RestoreUIHeirarchy(m_saved_state)
		m_saved_state = nil
		
		out.ting("Restoring old heirarchy")
		for k, v in pairs(m_hidden_components) do
			out.ting(k)
		end

	end

	if m_campaign ~= nil then
		OverrideMessageAutoShow("internal_mission_successful", false)
		OverrideMessageAutoShow("campaign_won", false)
		OverrideMessageAutoShow("disaster_earthquake",false)
		OverrideMessageAutoShow("disaster_eruption",false)
		OverrideMessageAutoShow("disaster_fire",false)
		OverrideMessageAutoShow("disaster_flood",false)
		OverrideMessageAutoShow("disaster_hurricane",false)
		OverrideMessageAutoShow("disease_cholera",false)
		OverrideMessageAutoShow("disease_dengue_fever",false)
		OverrideMessageAutoShow("disease_gripe",false)
		OverrideMessageAutoShow("disease_malaria",false)
		OverrideMessageAutoShow("disease_plague",false)
		OverrideMessageAutoShow("disease_small_pox",false)
		OverrideMessageAutoShow("disease_typhoid_fever",false)
		OverrideMessageAutoShow("disease_typhus",false)
		OverrideMessageAutoShow("disease_yellow_fever",false)
		--OverrideMessageAutoShow("faction_leader_dies_male_monarch",false)
		--OverrideMessageAutoShow("faction_leader_dies_president",false)
		--OverrideMessageAutoShow("faction_leader_dies_queen",false)
		--OverrideMessageAutoShow("faction_leader_executed_revolution",false)
		--OverrideMessageAutoShow("faction_neutral_friendly",false)
		--OverrideMessageAutoShow("faction_neutral_hostile",false)
		--OverrideMessageAutoShow("governor_minister_dies_in_office",false)
		--OverrideMessageAutoShow("new_faction_leader_king",false)
		--OverrideMessageAutoShow("new_faction_leader_president",false)
		--OverrideMessageAutoShow("new_faction_leader_queen",false)
		OverrideMessageAutoShow("royal_birth_not_heir",false)
		OverrideMessageAutoShow("royal_death_female",false)
		OverrideMessageAutoShow("royal_death_male",false)
		OverrideMessageAutoShow("royal_heir_born_female",false)
		OverrideMessageAutoShow("royal_heir_born_male",false)
		OverrideMessageAutoShow("royal_heir_female_new_not_birth",false)
		OverrideMessageAutoShow("royal_heir_male_new_not_birth",false)
		OverrideMessageAutoShow("royal_marriage_celebrations",false)
		OverrideMessageAutoShow("royal_retires_unmarried",false)
		OverrideMessageAutoShow("royal_suitor_available_daughter",false)
		OverrideMessageAutoShow("royal_suitor_available_son",false)
		--OverrideMessageAutoShow("your_government_change_cabinet_monarchy",false)
		--OverrideMessageAutoShow("your_government_change_cabinet_republic",false)
		--OverrideMessageAutoShow("your_government_change_type_monarchy",false)
		--OverrideMessageAutoShow("your_government_change_type_to_republic",false)
		--OverrideMessageAutoShow("your_new_faction_leader_king",false)
		--OverrideMessageAutoShow("your_new_faction_leader_president",false)
		OverrideMessageAutoShow("your_new_faction_leader_queen",false)
		OverrideMessageAutoShow("your_throne_disputed",false)
	end
end

function ClearEventCallbacks()
	for i,v in ipairs(m_user_defined_event_callbacks) do
		local new_event_table = {}
		--out.tom("Total callbacks for event "..v.event.." pre removal", #events[v.event])
		for ei, ev in ipairs(events[v.event]) do
			if ev ~= v.func then
				new_event_table[#new_event_table+1] = ev
			else
				out.tom("Removed "..tostring(v.func).." from event "..v.event)
			end
		end
		events[v.event] = new_event_table
		--out.tom("Total callbacks for event "..v.event.." post removal", #events[v.event])
	end
	
	m_user_defined_event_callbacks = {}
end

--------------------------------------------------------------------------------------------------------------------
-- Global functions that will get exported
--------------------------------------------------------------------------------------------------------------------
function IsOnCampaignMap()
	return m_in_campaign
end

function SetCampaign(campaign)
	out.ting("Playing episodic campaign: "..campaign)
	m_campaign = campaign
end

function AddEventCallBack(event, func, add_to_user_defined_list)
	assert(events[event] ~= nil, "Attempting to add event callback to non existant event ("..event..")")
	assert(func ~= nil, "Attempting to add a non existant function to event "..event)

	-- Push the function to the back of the list of function for the specified address	
	events[event][#events[event]+1] = func
	
	if add_to_user_defined_list ~= false then
		m_user_defined_event_callbacks[#m_user_defined_event_callbacks+1] = {}
		m_user_defined_event_callbacks[#m_user_defined_event_callbacks].event = event
		m_user_defined_event_callbacks[#m_user_defined_event_callbacks].func = func
	end
	
	out.tom("Adding "..tostring(func).." to event "..event)
end

function EnableFeature(feature)
	assert(m_features[feature] ~= nil, "Attempting to enable an unknown feature ("..feature..")")
	out.ting("Enabling "..feature)

	-- Call the feature function
	m_features[feature].Enable()
end

function DisableFeature(feature)
	-- InitFeature is called before the game starts, DisableFeature is more user friendy
	InitFeature(feature)
end

function InitFeature(feature)
	assert(m_features[feature] ~= nil, "Attempting to disable an unknown feature ("..feature..")")

	out.ting("Init "..feature)
	-- Call the feature function
	m_features[feature].Disable()
end

-- Override the database defined AutoShow property for a given message type.  
-- The msg parameter should be a key from the message_event_strings table, or the value "HistoricEvent"
-- If "override" is true, then messages that don't normal autoshow will do so, setting it false will mean that messages that normally
-- autoshow will not do so, and setting it to "nil" will use the default behaviour (and should thus be used to tidy up)
function OverrideMessageAutoShow(msg, override)
	out.ting("message override:" .. msg)
	message_handler.OverrideAutoShow(msg, override)
end

function ClearMessageAutoShowOverrides()
	message_handler.ClearOverrides()
end

function OnUICreated(context)
	m_highlighted_components = {}
	m_root = UIComponent(context.component)
	if context.string == "Campaign UI" then
		InitialiseCampaign()
		m_in_campaign = true
	else
		m_in_campaign = false
	end
end

--------------------------------------------------------------------------------------------------------------------
-- One time setup
--------------------------------------------------------------------------------------------------------------------

-- These event callbacks shouldn't be removed as they won't get re-added, so 
AddEventCallBack("UICreated",		OnUICreated, false)
AddEventCallBack("WorldCreated",	OnWorldCreated, false)
AddEventCallBack("NewSession",		OnNewSession, false)
AddEventCallBack("UIDestroyed",		OnDestroyed,  false)
