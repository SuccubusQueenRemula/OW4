tileGrid = noone;
terrainWalls = noone;
terrainEdges = noone;
instanceList = ds_list_create();
instanceMap = ds_map_create();
depth = Depths.AbsoluteBottom
draw = false;


xCoord = noone;
yCoord = noone;

terrainSurface = noone;
overheadCanvas = instance_create_depth(x, y, Depths.AbovePlayer, oOverheadCanvas);
overheadCanvas.owner = id;




//leftBorder = noone;
//rightBorder = noone;
//topBorder = noone;
//bottomBorder = noone;
//topLeftBorder = noone;
//topRightBorder = noone;
//bottomLeftBorder = noone;
//bottomRightBorder = noone;