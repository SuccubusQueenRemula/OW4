///@description To be called by oPlayer. If the talk key is pressed, attempts to initiate a conversation with an NPC. Updates state accordingly. Returns whether or not a conversation began.

//Only if the player is hitting the talk button.
if (oInputHandler.inputSpace)
{
	//Reset the speaking NPC to noone, just in case.
	//TODO: I kinda want this to be a global var.
	speakingNPC = noone;
	
	//Is there an NPC there?
	//TODO: I think if an NPC is tiny enough, you'll check past it and this will return false even though you're right next to it.
	switch (faceDirection)
	{
		case faceDirections.up:
			speakingNPC = instance_place(x, y - NPC_SPEAKING_DISTANCE, oConversationNPC);
			break;
			
		case faceDirections.down:
			speakingNPC = instance_place(x, y + NPC_SPEAKING_DISTANCE, oConversationNPC);
			break;
		
		case faceDirections.left:
			speakingNPC = instance_place(x - NPC_SPEAKING_DISTANCE, y, oConversationNPC);
			break;
			
		case faceDirections.right:
			speakingNPC = instance_place(x +NPC_SPEAKING_DISTANCE, y, oConversationNPC);
			break;		
	}
	
	//If we found a speaking NPC..
	if (speakingNPC != noone)
	{
		//...Then we can start a convo!
		playerState = playerStates.converse;
		
		mInitiateConversation(speakingNPC);
		return true;
		
	}
	
	//No NPC found? Return false.
	return false;
}

//The player isn't even TRYING to talk to an NPC? Return false.
return false;