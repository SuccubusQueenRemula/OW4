///@arg speakingNPC
var _npc = argument0;
with (oConversationHandler)
{
	//We have a new NPC. Clear out the current conversation queue, just in case.
	ds_queue_clear(conversationQueue);
	//Now we create a new message object.
	var _message = instance_create_layer(x, y, "Instances", oQueueMessage);
	_message.messageText = _npc.initialGreeting;
	_message.portraitSprite = _npc.initialPortrait;
	//Now add the message to the queue.
	ds_queue_enqueue(conversationQueue, _message);
	selectedKeyWordIndex = 0;
	speakingNPC = _npc;
	
	displayedText = "INITIALIZE";
	displayedPortrait = "INITIALIZE";
}
//Input is disregarded for the remainder of this frame.
with (oInputHandler)
{
	mInputFalsifyAll();
}
with (oDrawable)
{
	mActorPauseControl(true);
}
with (oGame)
{
	gameState = gameStates.conversation;
}