//World coordinates of the chunk this is a changelist for.
chunkX = 0;
chunkY = 0;

changes = ds_grid_create(4, 0);

enum changeListCommands
{
	addInstanceWithCHID,
	removeInstanceByCHID,
	updateCHIDCoordinateX,
	updateCHIDCoordinateY,
	addInvItemCHIDAndFile
}

enum changeListColumns
{
	command = 0,
	target = 1,
	time = 2,
	arg = 3
}

