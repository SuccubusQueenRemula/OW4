//Given a default value in chunk savers. If the player edits an item (or gets an item that was generated),
//a new file is made and this is updated.
itemFile = "";
//If an item's not been edited, it can reference the default file.
isEdited = false;
//This item overrides all rules of destruction. It can never truly be destroyed.
isImmortal = false;
//If this item is attached to the mouse, it must follow it constantly.
isMouseAttached = false;

//How much space does this take up in inventory?
invWidth = 1;
invHeight = 1;
mDsCreateList(id, "mouseOverText");
//mouseOverText = ds_list_create();



////Displayed in game.
//itemName = "";
////Should reference a script (scenario?) which the item follows to determine behavior.
//itemUse = noone;
////If -1, no cooldown for these:
//itemUseCoolDown = -1;
//itemUseCharges = 1;
////If false, this item will not be destroyed when it has no charges left.
//disappearsWhenNoCharges = true;
////Might become just a regular string later.
//mouseOverText = ds_list_create();

////Current/max stacks.
//itemStackSize = 0;
//itemMaxStackSize = 0;