//Upon arrival at the new screen, we delete all duplicate singletons. If the existing ones contain important
//data, not to worry! This method favors the existing ones.
mDeleteDuplicateSingletons();

with (oPlayer)
{
	persistent = false;
}

//In case this is a new camera, retarget the player.
if (true)
{
	with (oCamera)
	{
		target = oPlayer;	
	}
}