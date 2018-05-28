if (instance_exists(oTimer))
{
	with (oTimer)
	{
		var _hours = string(timerHours);
		var _mins = string(timerMinutes);
		var _secs = string(timerSeconds);
		var _delta = string(timerDelta);
		return (_hours + ":" + _mins + ":"  + _secs + ":" + _delta);
	}
}

return "GetTimeFailed";