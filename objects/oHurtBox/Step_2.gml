//Goes at end step to ensure everything else has moved first, in case it follows another object

switch (behaviorType)
{
	//Follow the object.
	case hurtBoxBehaviorTypes.followObject:
		if (instance_exists(behaviorReference))
		{
			x = behaviorReference.x + behaviorOffX;
			y = behaviorReference.y + behaviorOffY;
			if (behaviorLife <= 0)
			{
				instance_destroy();
			}
			
			behaviorLife--;
		}
		
		else
		{
			instance_destroy();
		}
		break;
		
	//Staystill will countdown to its own death.
	case hurtBoxBehaviorTypes.stayStill:
		if (behaviorReference != noone)
		{
			if (behaviorReference <= 0)
			{
				instance_destroy();
			}
			behaviorReference--;
		}
		else
		{
			instance_destroy();
		}
		break;
		
	//Timelines already run on their own, but this case just does a bit of work to make sure nothing has gone wrong.
	//Basically just kills this hurtbox if it can't find the timeline or the timeline is somehow not working right.
	case hurtBoxBehaviorTypes.obeyTimeline:
		if (!timeline_exists(behaviorReference))
		{
			instance_destroy();
		}
		break;
	
}