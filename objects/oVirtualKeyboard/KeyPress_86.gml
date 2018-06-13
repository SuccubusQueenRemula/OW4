if (keyboard_check_direct(vk_lshift) || keyboard_check_direct(vk_rshift))
{
	keyboardString += "V";
}

else if (keyboard_check_direct(vk_lcontrol) || keyboard_check_direct(vk_lcontrol))
{
	if (clipboard_has_text())
	{
		keyboardString += clipboard_get_text();
	}
}

else
{
	keyboardString += "v";
}