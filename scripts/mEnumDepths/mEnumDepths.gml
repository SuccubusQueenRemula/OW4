enum Depths
{
	LogicItems			=	 15900, //Should never be drawn.
	AbsoluteBottom		=    15800, //Still drawn but drawn below EVERYTHING.
	AbovePlayer			=   -15930, //Birds going overhead, that sort of thing.
	Atmosphere			=	-15940, //Clouds going by, mists in dungeons, poison smoke in swamps, etc.
	Weather				=	-15950, //Used by weather.
	DebugDisplay		=	-15970, // Used when entering debugging mode. Draws a lot of collision boxes and the like on top of everything.
	PseudoInterface		=	-15980 //Used by things that can't actually be on the GUI layer, but need to appear as if they are.
}