with (oGame)
{
	if (file_exists("ClientLog.txt"))
	{
		file_delete("ClientLog.txt");
	}
	
	var _initialOpen = file_text_open_append("ClientLog.txt");
	file_text_close(_initialOpen);
	
	mClientLogAddEntry("Client Log initiated. Old Client Log deleted.")
}