//All code per step is based on player state. As this is a switch statement with breaks,
//Only one state's code can be executed per frame.
if (!global.gamePaused)
{
	switch (playerState)
	{
		case playerStates.idle:
			mPlayerIdle();
			break;
		
		
		case playerStates.move:
			mPlayerMove();
			break;
		
		case playerStates.converse:
			break;
		
		case playerStates.attack:
			mPlayerAttack();
			break;
		
		default:
			break;
	}
}

sprite_index = playerSpriteTable[playerState, faceDirection];


//game   image   per
//60      15      .25
//60      20      .33
//60      30      .5
//60      60       1

