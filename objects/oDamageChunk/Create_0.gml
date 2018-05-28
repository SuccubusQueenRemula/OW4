///@description Holds damage being dealt.

enum damageTypes
{
	physical,
	cold,
	hot,
	electric,
	fyoshinite,
	antium
}

//Usually set to the id of the damage dealer.
damageSource = noone;

//Contains each instance of damage and its type.
//Most damageChunks have only 1 instance of damage, so we give 1 row by default.
damageInstances = ds_grid_create(2, 1);
canHarmSource = false;