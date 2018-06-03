///@description Creates and returns a new changelist for a chunk.
///@arg chunkX - The xCoord of the chunk this is a changelist for.
///@arg chunkY - The yCoord of the chunk this is a changelist for.

var _cl = instance_create_depth(x, y, Depths.LogicItems, oChangeList);
_cl.chunkX = argument0;
_cl.chunkY = argument1;

_cl.changes = ds_grid_create(4, 0);
return _cl;