//World coordinates of the chunk this is a changelist for.
chunkX = 0;
chunkY = 0;

changes = ds_grid_create(4, 0);

enum changeListCommands
{
	cleanUp, // This is used during mChangeListCondenseAll. As it works, entries which need to be removed are flagged with this. Then a second sweep is performed which makes a new CL that doesn't include this command type.
	addInstanceWithCHID,
	removeInstanceByCHID,
	addInvItemCHIDAndFile,
	addInvItemCHIDAndFileUpdateX, //These two update X/Y for an instance but should ONLY be used following the
	addInvItemCHIDAndFileUpdateY //command directly above it, addInvItemCHIDAndFile. This ensures that when CLs are cleaned, that there's not a misunderstanding about which entries need to be removed.
}

enum changeListColumns
{
	command = 0,
	target = 1,
	time = 2,
	arg = 3
}

