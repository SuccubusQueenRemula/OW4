//First of all, this object only does much work if the game state is set to conversations.
//Otherwise, it's kinda useless. Yeah.
var _chosenKeyWord = "";
if (oGame.gameState = gameStates.conversation)
{
	//First, we'll determine if the index has changed.
	if (oInputHandler.inputMouseWheelUp || oInputHandler.inputUp)
	{
		//Can't scroll up if already at the top.
		selectedKeyWordIndex = max(selectedKeyWordIndex - 1, 0);
		displayedKeyWordIndex = max(displayedKeyWordIndex - 1, 0);
	}
	
	if (oInputHandler.inputMouseWheelDown || oInputHandler.inputDown)
	{
		//Can't scroll down if already at the bottom
		selectedKeyWordIndex = min(selectedKeyWordIndex + 1, ds_grid_height(knownKeyWords) - 1);
		var _lowestDisplayBot = min(maxDisplayedIndex, ds_grid_height(knownKeyWords) - 1);
		displayedKeyWordIndex = min(displayedKeyWordIndex + 1, _lowestDisplayBot);
		
	}
	
	//The player has picked a topic to ask about.
	if (oInputHandler.inputSpace)
	{
		 //This should be used if there is still content in the queue of messages.
	 	 var _qSize = ds_queue_size(conversationQueue);
		 if (_qSize > 0)
		 {
			//We need to kill the old message.
			instance_destroy(currentMessage);
			//Now we dequeue the next message and set it as current.
			currentMessage = ds_queue_dequeue(conversationQueue);
			displayedText = currentMessage.messageText;
			displayedPortrait = currentMessage.portraitSprite;
			var _qSize = ds_queue_size(conversationQueue);
		 }
		 //There's no message content left in the message queue? The player can then select a keyword.
		 else
		 {
			 #region ThisProbablyNeedsToBeAMethodLol
			//Grab the word.
			 _chosenKeyWord = ds_grid_get(knownKeyWords, 0, selectedKeyWordIndex);
			 //If it's bye, end the conversation.
			 if (_chosenKeyWord == "bye")
			 {
				mRemoveTempKeyWords();
				with (oDrawable)
				{
					mActorPauseControl(false);
				}
				with (oGame)
				{
					gameState = gameStates.normal;
				}
				selectedKeyWordIndex = 0;
				displayedKeyWordIndex = 0;
			 }
		 
		 
		 
			 else
			 {
				 if (!is_undefined(ds_map_find_value(speakingNPC.conversationKeyWords, _chosenKeyWord)))
				 {
					 mHandleKeyWordOuput(ds_map_find_value(speakingNPC.conversationKeyWords, _chosenKeyWord));
				 
					 if (ds_queue_size(conversationQueue) > 0)
					 {
						 currentMessage = ds_queue_dequeue(conversationQueue);
						 displayedText = currentMessage.messageText;
						 displayedPortrait = currentMessage.portraitSprite;
					 }
				 }
				 else
				 {
					 displayedText = "Sorry, I don't know about " + _chosenKeyWord + ".";
				 }
			 }
			 #endregion ThisProbablyNeedsToBeAMethodLol
		}		 
	}
}
