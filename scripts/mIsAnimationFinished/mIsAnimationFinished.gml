///@description Returns true if an object's current sprite animation has completed once and has begun to loop this frame. Otherwise, returns false.
//Must be called every frame while the animation is playing in order to continuously check in.

//The variable frameCounter needs to exist for this script to work.
if (variable_instance_exists(id, "frameCounter"))
{
	//The image_index of this object can't be -1. This means the animation's first frame can run normally
	//But the second time the animation plays, it will be less than frameCounter.
	if (image_index < frameCounter)
	{
		return true;
	}
	//If the animation hasn't finished though, we just set frameCounter to be equal to the image_index.
	//That way when the animation resets, frameCounter will recognize the loop.
	else
	{
		frameCounter = image_index;
		return false;
	}
}

//Uh-oh! Did we try to run this script when there's no frameCounter variable on the calling instance?
//That's fine. We'll give it a frameCounter variable this step.

else
{
	frameCounter = image_index;
	return false;
}

//This shouldn't really be possible to hit, but just in case.
return false;