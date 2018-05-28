event_inherited();

animationFinished = false;
frameCounter = -1;
attackHurtBox = noone;
drawInv = false;

#region PlayerEnums
enum faceDirections
{
	right,
	down,
	left,
	up
}

enum playerStates
{
	idle,
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
moveSpeed = 8;
baseMoveSpeed = 8;

x = room_width/2;
y = room_height/2;

#region SpriteLookupTable


playerSpriteTable[playerStates.idle, faceDirections.up] = sHeroIdleUp;
playerSpriteTable[playerStates.idle, faceDirections.left] = sHeroIdleLeft;
playerSpriteTable[playerStates.idle, faceDirections.down] = sHeroIdleDown; 
playerSpriteTable[playerStates.idle, faceDirections.right] = sHeroIdleRight;

playerSpriteTable[playerStates.move, faceDirections.up] = sHeroRunUp;
playerSpriteTable[playerStates.move, faceDirections.left] = sHeroRunLeft;
playerSpriteTable[playerStates.move, faceDirections.down] = sHeroRunDown; 
playerSpriteTable[playerStates.move, faceDirections.right] = sHeroRunRight;

playerSpriteTable[playerStates.converse, faceDirections.up] = sHeroRunUp;
playerSpriteTable[playerStates.converse, faceDirections.left] = sHeroRunLeft;
playerSpriteTable[playerStates.converse, faceDirections.down] = sHeroRunDown; 
playerSpriteTable[playerStates.converse, faceDirections.right] = sHeroRunRight;

playerSpriteTable[playerStates.attack, faceDirections.up] = sHeroAttackUp;
playerSpriteTable[playerStates.attack, faceDirections.left] = sHeroAttackLeft;
playerSpriteTable[playerStates.attack, faceDirections.down] = sHeroAttackDown;
playerSpriteTable[playerStates.attack, faceDirections.right] = sHeroAttackRight;


#endregion SpriteLookupTable