//We can't collect input with a game object. We need a game object to read the game state
//so we know HOW to collect input.
if (instance_exists(oGame))
{
	mInputFalsifyAll();
	switch(oGame.gameState)
	{
		//If the game state is just standard play, we can just collect all input for the frame.
		case (gameStates.normal):
			mInputCollect();
			break;
			
		//Right now conversation falsifies all input.
		case (gameStates.conversation):
			mInputConversation();
			break;
			
		default:
			break;			
	}
}