///@description Do not create without calling mCreateHurtBox.

//followObject: the hurtbox will stay attached to the object. Hurtbox can die if told by the object or if the object dies.
//obeyTimeline: the hurtbox will only perform actions in an associated timeline. The hurtbox must be told to die by the timeline.
//stayStill: the hurtbox will stay still. The behaviorReference is set to how many frames it should live for. Will always live for 1 at least.
enum hurtBoxBehaviorTypes
{
	followObject,
	obeyTimeline,
	stayStill,
	unassigned
}

behaviorType = hurtBoxBehaviorTypes.unassigned;

//Based on the hurtbox's behavior type, this can be a followed object, obeyed timeline, or number of frames to live for.
behaviorReference = noone;

//Used if this hurtbox must attach itself to a point that is not the origin of the object.
//Naturally, this can also be used the timeline if an extra 2D Vector is needed.
behaviorOffX = 0;
behaviorOffY = 0;

//Used if this hurtbox must follow an object but still should have a limited life.
behaviorLife = 0;

damageChunk = noone;




//This is the list of "factions" that the hitbox can damage.
//targetFactions = ["Generic", "Lom", "Feracia"];

//When this hits 0, the hitbox ceases to exist.
alarm[0] = 3