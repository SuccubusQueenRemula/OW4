///@description Creates a damage chunk. Usually, this is used later as an argument in a hurt box.
///@arg damageSource - The instance id of the damage source, usually the caller of this script (such as whoever is firing the arrow or swinging the sword).
///@arg damageGrid - A ds grid of damage instances to put in this chunk. First column is damage numbers. Second is damage types.
///@arg canHarmSource - Bool value. Whether or not the source of this can be harmed by it.

var _damageSource = argument0;
var _gridContent = argument1;
var _canHarmSource = argument2;

var _dc = instance_create_layer(x, y, "Instances", oDamageChunk);

with (_dc)
{
	if ((!instance_exists(_damageSource)) || !ds_exists(_gridContent, ds_type_grid))
	{
		instance_destroy(_dc);
		return noone;
	}

	//We'll affirm that this is a grid before we check the width.
	else if (ds_grid_width(_gridContent) != 2)	
	{
		instance_destroy(_dc);
		return noone;
	}
	
	else
	{
		damageSource = _damageSource;
		damageInstances = _gridContent;
		canHarmSource = _canHarmSource;
		return _dc;
	}
}

//I dunno how it's possible that you got here.

return noone;