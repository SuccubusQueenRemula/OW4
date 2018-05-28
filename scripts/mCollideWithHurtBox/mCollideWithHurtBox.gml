///@description Called by the object colliding with the hurtbox, not the hurtbox itself. 
///@arg victim - Usually object the HurtBox is colliding with, but can be something else.
///@arg hurtBox - The HurtBox being collided with.

//Generally deals with behavior of the hurtbox destroying itself or whether damage should be checked.
//For actual dealing damage, mApplyDamageChunk is applied.

var _victim = argument0;
var _hb = argument1;

//The damage chunk is obviously a huge part of the data a hurtbox contains.
var _dc = _hb.damageChunk;


//mApplyDamageChunk returns true if it successfully applies damage. Right now, we destroy the hurtbox on a hit.
if (mApplyDamageChunk(id, _dc))
{
	instance_destroy(_hb);
}