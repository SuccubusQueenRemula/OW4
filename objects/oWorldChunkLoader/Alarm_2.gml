///@description Apply changelists.

//First, we need to see if any changelist exists. The key for all changelists is just the file name of the chunk.
var _changeList = noone;
var _file = chunkFile;
var _loadingWorldChunk = loadingWorldChunk;

with (oChangeListHandler)
{
	_changeList = mChangeListFindOrCreate(_loadingWorldChunk.xCoord, _loadingWorldChunk.yCoord);
}

//If it's still undefined, we'll create a new changelist and add it to the map.


//Now we start applying the individual changelists.
with (_changeList)
{
	//If the changelist's changes are not defined, then we're just done. There's no changes to apply.
	if (changes == noone)
	{
		exit;
	}
	//We also only want to progress if changes is defined as a ds_grid.
	if (ds_exists(changes, ds_type_grid))
	{
		//We also also also only want to progress if there's any rows in the grid.
		if (ds_grid_height(changes) >= 1)
		{
			
			mChangeListApplyChanges(_loadingWorldChunk);
		}
		else
		{
			exit;
		}
	}
	else
	{
		exit;
	}
}
