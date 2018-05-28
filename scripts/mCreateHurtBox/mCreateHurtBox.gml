///@description Creates a HurtBox, defining its life and behavior.
///@arg startingX - The X the Hurtbox will appear on its first frame.
///@arg startingY - The Y the Hurtbox will appear on its first frame.
///@arg behaviorType - Reference to the enum hurtBoxBehaviorTypes. What behavior box has per frame.
///@arg behaviorReference - Data type varies. A reference to necessary info based on behavior type.
///@arg behaviorOffX - Value to offset X by when the box's behavior is to follow another object.
///@arg behaviorOffY - Value to offset Y by when the box's behavior is to follow another object.
///@arg behaviorLife - Define the life of the box in frames. Only applies for stayStill and followObject behavior. Set to -1 for infinite life.
///@arg xScale - The width, in pixels, of the box.
///@arg yScale - The height, in pixels, of the box.
///@arg targetFactions - The factions this box can damage.
///@arg sourceFaction - The source of the calling instance.
///@arg canHarmSource - Bool value. Whether or not the calling instance can be damaged by this hurtbox.
///@arg damageChunk - The damage chunk to deal to targets this hits.

#region AssignArguments
var _startingX = argument0;
var _startingY = argument1;
var _behaviorType = argument2;
var _behaviorReference = argument3;
var _behaviorOffX = argument4;
var _behaviorOffY = argument5;
var _behaviorLife = argument6;
var _xScale = argument7;
var _yScale = argument8;
var _targetFactions = argument9;
var _sourceFaction = argument10;
var _canHarmSource = argument11;
var _damageChunk = argument12;

#endregion AssignArguments


var _hb = instance_create_layer(_startingX, _startingY, "Instances", oHurtBox);

//Now it's time to start making this object!
with (_hb)
{
	//First, let's check that the variables which never change data types are all the correct data type.
	//If not, we can just return noone instead of the box ID and let the caller handle it.
	
	if (_behaviorType != noone && is_real(_xScale) && is_real(_yScale) && (_canHarmSource == 0 || _canHarmSource == 1) && _damageChunk != noone)
	{
		damageChunk = _damageChunk;
		canHarmSource = _canHarmSource;
		behaviorType = _behaviorType;
		image_xscale =  (_xScale / sprite_get_width(sHurtBox));
		image_yscale = (_yScale / sprite_get_height(sHurtBox));
	}
	else
	{
		instance_destroy(_hb);
		targetFactions = [];
		return noone;
	}
	
	#region AssignVariablesBasedOnBehavior
	//Now, what type of behavior was this?
	switch (behaviorType)
	{
	
		//If it's stayStill. We just ensure behavior reference is a number (the frames to live for).
		//Otherwise, return noone.
		case hurtBoxBehaviorTypes.stayStill:
			if (is_real(_behaviorReference))
			{
				behaviorReference = _behaviorReference;
			}
			else
			{
				instance_destroy(_hb);
				targetFactions = [];
				return noone;
			}
			break;
		
		//Following an object? Let's ensure the object exists and all 3 possible variables are real.
		//If any fail, return noone.
		case hurtBoxBehaviorTypes.followObject:
			if (instance_exists(_behaviorReference) && is_real(_behaviorOffX) && is_real(_behaviorOffY) && is_real(_behaviorLife))
			{
				behaviorReference = _behaviorReference;
				behaviorOffX = _behaviorOffX;
				behaviorOffY = _behaviorOffY;
				behaviorLife = _behaviorLife;
			}
			else
			{
				instance_destroy(_hb);
				targetFactions = [];
				return noone;
			}
			break;
			
		//Obeying a timeline? We just need to make sure the timeline exists and let it handle the rest.
		//Naturally, if we can't find the timeline, we just kill this hurtbox and return noone.
		case hurtBoxBehaviorTypes.obeyTimeline:
			if (timeline_exists(behaviorReference))
			{
				behaviorReference = _behaviorReference;
			}
			else
			{
				instance_destroy(_hb);
				targetFactions = [];
				return noone;
			}
			break;
			
		default:
			instance_destroy(_hb);
			targetFactions = [];
			return noone;
			break;
			
	}
	#endregion AssignVariablesBasedOnBehavior
	
	#region HandleTargetFactions
	//Now we can begin working on the factions.
	//You know the drill by now. If the target factions aren't an array, we end this and return noone.
	if (is_array(_targetFactions))
	{
	
		//We already know how long the array is, so we don't need to resize it a ton of times.
		var _length = array_length_1d(_targetFactions);
		if (_length > 0)
		{
			//So this is a bit confusing. We always make that bit of extra room for generic...
			//...UNLESS the source faction was generic, because we don't want mobs hitting each other...
			//...BUT if generic was explicitly added to the argument in this method, we still add it.
			if (_sourceFaction != "Generic")
			{
				targetFactions[_length] = "Generic";
			}
			else
			{
				//Just filler. Here so we can add the last entry first and not redefine the array size.
				targetFactions[_length - 1] = "FILLER";
			}
		
			//Now we can finally loop through the argument and add the factions.
		
			var _i = 0;
	
			repeat (_length)
			{
				targetFactions[_i] =  _targetFactions[_i];	
				_i++;
			}
		}
		
		else 
		{
			//The array length of target factions is 0. This hitbox can harm nothing. But it still exists.
			targetFactions = [];
		}
	}
	else
	{
		instance_destroy(_hb);
		targetFactions = [];
		return noone;
	}
	#endregion HandleTargetFactions
}

//If we made it this far, the hurtbox was properly made and saw no reason to obliterate itself.
//We can now return this hurtbox's id.

return _hb;