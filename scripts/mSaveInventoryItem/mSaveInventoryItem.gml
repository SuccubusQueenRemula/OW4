///@description Called by the creation code of an item in the chunk creation room.
///@arg itemFile - The file this item should reference that contains all info for it.

//This can only be called by an inventory item.
if (object_index == oInventoryItemSaver)
{
	itemFile = argument0;
}