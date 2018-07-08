///@description Inventories belong to oActors, but not every oActor has one. This script takes an actor as an argument, checks if the actor has an inventory, and gives them one if not.
///@arg actor - The actor to initiate an inventory for.

var _actor = argument0;

//First, let's make sure we've actually been given an actor.
if (object_is_ancestor(_actor.object_index, oActor))
{
	with (_actor)
	{
		//Though unlikely, it's possible to call this script before actorInventory has even been assigned "noone".
		if (variable_instance_exists(_actor, "actorInventory"))
		{
			//Now we check it's already been made into an inventory.
			if (actorInventory != noone && actorInventory.object_index == oInventory)
			{
				//This inventory has already been initiated.
				exit;
			}
			else
			{
				actorInventory = instance_create_layer(x, y, "Instances", oInventory);
				actorInventory.owner = id;
			}
		}
		//The inventory's not yet been set even to noone. We still want to initiate it.
		else
		{
			actorInventory = instance_create_layer(x, y, "Instances", oInventory);
			actorInventory.owner = id;
		}
	}
}