///@description Given an object, updates the changelist for the chunk it's on spawn that object henceforth.
///@arg object - The object to make spawn

var _object = argument0;

//We only want to progress if this object's chunk can be determined.
if (!mDetermineObjectChunk(_object))
{
	return "COULD NOT DETERMINE OWNER";
}

//We can use the detX and detY to build the changelist name... 
//...which we can then use to pull the changelist.
var _changeList = mChangeListFindOrCreate(_object.detChunkX, _object.detChunkY);
	
//Center it.
_changeList.x = oPlayer.x;
_changeList.y = oPlayer.y;
	
//Now we do some work to add an item to this changelist.
with (_changeList)
{
	//All changes need a timestamp.
	var _time = mGetTimePlayedAsString();
	
	//Create three entries for this changelist. One to add the item, by CHID, as well as which file to load.
	//Then two more placing it at the proper x/y.
	mAddChangeToList(changeListCommands.addInvItemCHIDAndFile, _object.CHID, _time, _object.itemFile);
	mAddChangeToList(changeListCommands.addInvItemCHIDAndFileUpdateX, _object.CHID, _time, _object.localX);
	mAddChangeToList(changeListCommands.addInvItemCHIDAndFileUpdateY, _object.CHID, _time, _object.localY);		
}

//Now deactivate this CL.
instance_deactivate_object(_changeList);