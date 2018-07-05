//Making the surface in the create event could potentially be the source of the nasty chunk misloading bug.
//However, I want to leave this on until I can more successfully diagnose this as the problem.
surface = noone;//surface = surface_create(global.chunkWidth, global.chunkHeight); 
draw = false;
owner = noone;


overheadWalls = noone;
overheadRoofs = noone;
overheadDecorum = noone;

