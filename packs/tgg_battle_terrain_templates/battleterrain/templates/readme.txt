TERRAIN TEMPLATE SYSTEM
=======================

Templates provide a way for designers to control the terrain auto-generation process.
Each template has a terrain type map and an attribute map.

Terrain type map specifies the terrain features that autogenerator is allowed to use.
Attribute map specifies deployment zones, farms areas, building areas, etc.
Both maps cover the whole battlefield, including the back terrain.


Terrain type map
----------------

Terrain type map is allowed to be 64 x 64 pixels only, where inner 8 x 8 represent the playable map.

Placing terrain types on this map does not guarantee that specific features WILL be placed, only
that autogenerator is ALLOWED to place them.

Special care needs to be taken when placing river and road tiles.
Each river/road tile is only allowed to "touch" no more than two neighbouring river/road tiles.
The neighbours can only be positioned directly above/below/left/right.


Attribute map
-------------

Attribute map can be of any resolution, but still always stretches to cover the whole map.
It is best to keep attribute map proportional to terrain map and have even dimensions (64x64, 128x128, 256x256, etc.).
As in terrain type map, inner 1/8th square area represents the playable map.
We can not have more than one seperate area with "force_buildings" attribute.

Previewing, submitting, etc.
----------------------------

It is possible to load a template in WarscapeFrame. To do this, you need to add the following line to your warscapeframe config file:

bm_load_template BattleTerrain/templates/bridge/default/ 2112 1328 0;

Where "BattleTerrain/templates/bridge/default/" is the name of your template, 2112 and 1328 are coordinates on the campaign metadata/height grid and 0 is for clock-wise rotation;
Rotation is an integer between 0 and 4 that represents clock-wise rotation of the whole template by 90 degrees.

By default, all terrain templates are packed into terrain_templates.pack in your Empire data directory.
However, for quick iteration, it is best to delete the pack file and copy the templates directory from perforce depot\EmpireArt\BattleTerrain to your local empire data\BattleTerrain.

When you are finished editing your templates, they need to be checked in back into perforce, under depot\EmpireArt\BattleTerrain\Templates\
To submit all templates to the main build, you need to run "create_terrain_templates_pack.cmd" script from EmpireArt\BattleTerrain\
This will create a "terrain_templates.pack" file which you can submit to the main empire branch.


Warscapeframe config file
-------------------------

This is simillar to your user script. You can find it here:
%appdata%\The Creative Assembly\Empire\scripts\warscapeframe.empire_script.txt

This config defines which modules you want to load and some parameters for them.

Here is an example script that might be a good starting point:

add_module sky_view;
add_module building_view;
add_module blendmap_view;
add_module tree_editor_view;
bm_load_template BattleTerrain/templates/bridge/default/ 2112 1328 1;


Various
-------

When in warscapeframe, you can use console command "terrain_boxes true" to enable display of deployment zones, playable area, etc.
This command is ONLY valid when generaging terrain using "bm_load_Template" in the config.


A handy colour key TGA is provided for reference on possible terrain and attribute types. This lives in depot\EmpireArt\BattleTerrain\templates\key.tga


