///description To be used with a conversation NPC in the world chunk saver or other premade area. Loads the NPC with the proper conversation files and properties.
///@arg conversationFile - the name of the conversation file to be used (without file extention or directory path).
///@arg initialGreeting - The first block of text the NPC reads off.
///@arg initialPortrait - The first portrait used by the NPC.


//NOTE THAT THE CONVERSATION IS NOT LOADED IN THIS SCRIPT. THIS SCRIPT ONLY SAVES THE FILE.
//THE CONVERSATION IS LOADED WHEN THE NPC IS LOADED IN GAME.
var _conversationFile = argument0;
var _initGreeting = argument1;
var _initPortrait = argument2;

//-----//

conversationFile = _conversationFile;
initialGreeting = _initGreeting;
if (sprite_exists(_initPortrait))
{
	initialPortrait = _initPortrait;
}
