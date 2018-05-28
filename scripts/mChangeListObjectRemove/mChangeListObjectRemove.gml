///@description Given an object and a changelist, updates the changelist of the chunk it is on so that object will no longer spawn there.
///@arg object - The object to cease from spawning.
///@arg changeList - The changelist to update.

var _object = argument0;
var _changeList = argument1;

//Only do work if the changelist exists
if (instance_exists(_changeList))
{
	
	//Rest of the work is done with the changelist.
	with (_changeList)
	{
		
		//This is a good time to ensure the changelist is still scoped near the center of the screen.
		x = oPlayer.x;
		y = oPlayer.y;

		//Time matters as it is what the changelist is sorted by.
		var _time = mGetTimePlayedAsString();		
		mAddChangeToList(changeListCommands.removeInstanceByCHID, _object.CHID, _time, _object.CHID);
		
		//There is no need to re-add the value to the map. The map will already be referencing it.
		//However, we must deactivate the changelist to keep CPU free.
		instance_deactivate_object(_changeList);
	}
}