
var _text = mConcatenateFile("NPC Conversations/" + conversationFile + ".json");
if (_text != noone)
{
	conversation = json_decode(_text);
	conversationKeyWords = ds_map_find_value(conversation, "conversationKeyWords");
}