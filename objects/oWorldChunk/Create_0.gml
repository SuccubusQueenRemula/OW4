tileGrid = noone;
terrainWalls = noone;
terrainEdges = noone;
mDsCreateList(id, "instanceList");
mDsCreateMap(id, "instanceMap");
depth = Depths.AbsoluteBottom
draw = false;


xCoord = noone;
yCoord = noone;

terrainSurface = noone;
overheadCanvas = instance_create_depth(x, y, Depths.AbovePlayer, oOverheadCanvas);
overheadCanvas.owner = id;

overheadParallaxCanvas = instance_create_depth(x, y, Depths.OverheadParallax, oOverheadParallaxCanvas);
overheadParallaxCanvas.owner = id;




//leftBorder = noone;
//rightBorder = noone;
//topBorder = noone;
//bottomBorder = noone;
//topLeftBorder = noone;
//topRightBorder = noone;
//bottomLeftBorder = noone;
//bottomRightBorder = noone;