//At the topmost level, if the player is holding an item, they should attempt to drop it.
if (global.mouseItem != noone)
{
	//An item will be dropping. Let's get the distance from where the player is to where the player tries to drop it.
	var _distance = point_distance(x, y, mouse_x, mouse_y);
	
	//Prep a landing spot.
	var _landingX = 0;
	var _landingY = 0;
	
	//If the distance is less than 300, then it can be dropped at the mouse.
	if (_distance < 300)
	{
		var _landingX = mouse_x;
		var _landingY = mouse_y;	
	}
	//Otherwise, the player will just drop it at their current location.
	else
	{
		var _landingX = x;
		var _landingY = y;
	}
	
	//Set the object to be at the landing spot.
	global.mouseItem.x = _landingX;
	global.mouseItem.y = _landingY;
	
	//Record the object chunk.
	//mDetermineObjectChunk(global.mouseItem);
	
	mChangeListInvItemAdd(global.mouseItem);
	global.mouseItem.isMouseAttached = false;
	global.mouseItem = noone;
	
}
//If the player isn't holding an item on their mouse, all kinds of crap can happen.
else
{
	//Check if there's an item instance here at all.
	var _inst = instance_position(mouse_x, mouse_y, oInventoryItem);
	if (_inst != noone)
	{
		//Attach this item to the mouse.
		if (mAttemptPlaceItemMouse(_inst))
		{
			//The item has been succesfully placed on the mouse.
			//Thus, we now update the changelist for this chunk to remove that item.
			//To do this, we first find out the chunk X and Y of this object.
			mDetermineObjectChunk(_inst);
			
			//Now we grab the changelist based on the object chunk it was on.
			var _changeList = mChangeListFindOrCreate(_inst.detChunkX, _inst.detChunkY);
			
			//Now with that info, we can update the change list.
			mChangeListObjectRemove(_inst, _changeList);
		}
	}
	
	//If not, we attack.
	else
	{
		var _hbStartX;
		var _hbStartY;
	
		if (faceDirection = faceDirections.up) { _hbStartY = y - 5; _hbStartX = x; }
		else if (faceDirection = faceDirections.down) { _hbStartY = y - 5; _hbStartX = x; }
		else if (faceDirection = faceDirections.left) { _hbStartY = y - 5; _hbStartX = x; }
		else if (faceDirection = faceDirections.right) { _hbStartY = y - 5; _hbStartX = x; }
	
		mChangePlayerState(playerStates.attack);
		var _damageGrid = ds_grid_create(2, 3);
		ds_grid_set(_damageGrid, 0, 0, 15);
		ds_grid_set(_damageGrid, 1, 0, damageTypes.physical);
		ds_grid_set(_damageGrid, 0, 1, 16);
		ds_grid_set(_damageGrid, 1, 1, damageTypes.cold);
		ds_grid_set(_damageGrid, 0, 2, 17);
		ds_grid_set(_damageGrid, 1, 2, damageTypes.hot);
	
	
		var _hb = mCreateHurtBox(x, y, hurtBoxBehaviorTypes.followObject, id, 0, 0, 600, 10, 10, [], "Generic", false, mCreateDamageChunk(id, _damageGrid, false));
		//instance_create_layer(x, y, "Instances", oHurtBox);
	}
}