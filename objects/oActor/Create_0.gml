//The faction is used to determine whether or not a hitbox can harm you.
//If faction is "Generic", it can be harmed by anything, whether the hitbox targets Generic or not.
//If the hitbox targets the "Omni" faction, it hits everything.

faction = "Generic";
name = "";
baseImageSpeed = 1;
actorInventory = noone;
//Any actor can have an inventory, since a chest or dead body might need to hold items.
//Though unlikely, it's possible that this value will be initialized prior by a room load script.

mConceiveInventoryObject(id);
