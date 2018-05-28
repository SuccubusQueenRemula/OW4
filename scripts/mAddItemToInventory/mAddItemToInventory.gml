///@description Takes a pre-existing item and adds it to the inventory of a pre-existing actor. An attempt is also made to initialize the actor's inventory in case it does not already have one.
///@arg item - The id of the item to add to inventory.
///@arg actor - The id of the actor to give the item to.

var _item = argument0;
var _actor = argument1;

//First, ensure that we've been handed the proper data types.
if (object_is_ancestor(_actor.object_index, oActor) && object_is_ancestor(_item.object_index, oInventoryItem))
{
	//Confirm the actor has an inventory before we attempt to add an item.
	mConceiveInventoryObject(_actor);
	
	//Everything looks good. Add it. 
	//In later versions, we may deal with weight and other variables, but this will do for now.
	ds_list_add(_actor.actorInventory, _item); 
}