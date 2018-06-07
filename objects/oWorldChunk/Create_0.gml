tileGrid = noone;
terrainWalls = noone;
terrainEdges = noone;
instanceList = ds_list_create();
instanceMap = ds_map_create();
depth = 14999;
draw = false;


xCoord = noone;
yCoord = noone;

terrainSurface = noone;
overheadSurface = instance_create_depth(0, 0, Depths.AbovePlayer, oOverheadCanvas);
overheadSurface.x = x;
overheadSurface.y = y;
overheadSurface.owner = id;




leftBorder = noone;
rightBorder = noone;
topBorder = noone;
bottomBorder = noone;
topLeftBorder = noone;
topRightBorder = noone;
bottomLeftBorder = noone;
bottomRightBorder = noone;