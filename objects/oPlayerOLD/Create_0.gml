event_inherited();

animationFinished = false;
frameCounter = -1;
attackHurtBox = noone;

#region PlayerEnums
enum faceDirectionsOLD
{
	right,
	down,
	left,
	up
}

enum playerStatesOLD
{
	move,
	attack,
	converse,
	recoil
}
#endregion PlayerEnums

maxHealth = 10;
currentHealth = maxHealth;

faceDirection = faceDirections.down;
playerState = playerStates.move;
moveSpeed = 3;
baseMoveSpeed = 3;

#region SpriteLookupTable
playerSpriteTable[playerStates.move, faceDirections.up] = sHeroRunUp;
playerSpriteTable[playerStates.move, faceDirections.left] = sHeroRunRight;
playerSpriteTable[playerStates.move, faceDirections.down] = sHeroRunDown; 
playerSpriteTable[playerStates.move, faceDirections.right] = sHeroRunRight;

playerSpriteTable[playerStates.converse, faceDirections.up] = sHeroRunUp;
playerSpriteTable[playerStates.converse, faceDirections.left] = sHeroRunRight;
playerSpriteTable[playerStates.converse, faceDirections.down] = sHeroRunDown; 
playerSpriteTable[playerStates.converse, faceDirections.right] = sHeroRunRight;

playerSpriteTable[playerStates.attack, faceDirections.up] = sHeroAttackUp;
playerSpriteTable[playerStates.attack, faceDirections.left] = sHeroAttackLeft;
playerSpriteTable[playerStates.attack, faceDirections.down] = sHeroAttackDown;
playerSpriteTable[playerStates.attack, faceDirections.right] = sHeroAttackRight;


#endregion SpriteLookupTable