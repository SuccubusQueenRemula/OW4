timerDelta += delta_time;

//If a second has elapsed...
if (timerDelta >= 1000000)
{
	//... then we take that second away from the delta timer and give it to the seconds.
	timerDelta -= 1000000;
	timerSeconds++;
	
	//Now repeat that process with seconds being over 60.
	if (timerSeconds >= 60)
	{
		timerSeconds -= 60;
		timerMinutes++;
		
		//And once more with minutes.
		if (timerMinutes >= 60)
		{
			timerMinutes -= 60;
			timerHours++;
		}
	}
}