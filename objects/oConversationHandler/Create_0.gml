event_inherited();

#region Enums
enum keyWordPriority
{
	normal = 0,
	favorite = 1,
	temporary = 2,
	bye = 3,
	job = 4,
	name = 5
}
#endregion Enums

#region InitiateKeyWords
//When a conversation is occuring, this is the currently selected row of the keyword grid.
selectedKeyWordIndex = 0;
displayedKeyWordIndex = 0;
displayedText = "";
displayedPortrait = noone;

//TODO: Calculate this dynamically whenenever the GUI size is set.
maxDisplayedIndex = 8;


//Known keywords is a two-column grid. The first column is the text of the keyword.
//The second is the keyword priority. See the above enum.
mInitializeKnownKeyWords();
#endregion InitiateKeyWords

//This instance ID of the NPC being conversed with. Stored for quick and easy access.
conversingNPC = noone;

mDsCreateQueue(id, "conversationQueue");

currentMessage = noone;


