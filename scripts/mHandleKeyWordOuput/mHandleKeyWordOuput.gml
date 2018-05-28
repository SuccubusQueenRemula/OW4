///@arg KeyWordOutput

//  THIS SCRIPT SHOULD ONLY EVER BE CALLED BY oConversationHandler. NO EXCEPTIONS. 100% ORIGINAL COPYRIGHTED TO oConversationHandler! NO STEALING!
//  NPCs can do a whole lot more with the topics the players asks than respond with text.
//  There is an entire scripting language built into their files. They might give the player an item.
//  They might teach the player a new keyword. They might end the conversation and attack the player.
//  This script takes the complex text string associated with the NPC's keyword and translates it into
//  actions for the conversation handler to commit.


//The output should be the value of the key-value pair in a conversation ds_map.
//It should turn out to be a list in order to match the .json format the asset maker saves.
var _selectedKeyWord = argument0;

//The keyword itself contains an object with a key, "scenarioCommands", which we pull into a list.
//Each item in this list is a ds map, containing each command name and its values.
var _list = ds_map_find_value(_selectedKeyWord, "scenarioCommands");
var _value = noone;

if (ds_exists(_list, ds_type_list))
{
	//Now we know that this is a list we successful pulled, meaning so far it matches the expected .json structure.
	//Each entry of the list should be a dictionary, so let's just iterate accordingly...
	var _listLength = ds_list_size(_list)
	for (var _i = 0; _i < _listLength; _i++)
	{
		//...and grab the map, which is a command for the keyword at each spot.
		var _command = ds_list_find_value(_list, _i);
		
		//If this isn't actually a ds_map, we just skip this command. Dunno why we have bad data here, but whatever. Skip it.
		if (ds_exists(_command, ds_type_map))
		{
			//Now we can read the command type.
			var _commandType = ds_map_find_value(_command, "commandName");
			if (is_string(_commandType))
			{
				//Now we can read what the command type is and perform logic accordingly.
				//We always check if the value is a list, but for cases where there should only be one value, we just read the 0th entry if it is.
				switch (_commandType)
				{
					case "queueMessage":
					case "enqueueMessage":
						//var _text = ds_map_find_value(_command, "messageText");
						//var _portrait = ds_map_find_value(_command, "messagePortrait");]
						_value = ds_map_find_value(_command, "commandValues");
						var _newMessage = instance_create_layer(x, y, "Instances", oQueueMessage);
						
						if (ds_exists(_value, ds_type_map)) 
						{
							//Pull the text and portrait, then save them to a message object
							var _text = ds_map_find_value(_value, "message");
							var _portrait = ds_map_find_value(_value, "portrait");
							_newMessage.messageText = _text;
							_newMessage.portraitSprite = asset_get_index(_portrait);
							//Store the message in the queue.
							ds_queue_enqueue(conversationQueue, _newMessage);
						}
						else
						{
							instance_destroy(_newMessage);
							displayedText = "ERROR";
						}
						break;
		
					case "addNewKeyWord":
						_value = ds_map_find_value(_command, "commandValues");
						if (is_string(_value)) 
						{
							mAddNewKnownKeyWord(_value, keyWordPriority.normal);
						}
						else
						{
							mAddNewKnownKeyWord(ds_list_find_value(_value, 0), keyWordPriority.normal);							
						}
						break;
			
					case "addNewTempKeyWord":
						_value = ds_map_find_value(_command, "commandValues");
						if (is_string(_value)) 
						{
							mAddNewKnownKeyWord(_value, keyWordPriority.temporary);
						}
						else
						{
							mAddNewKnownKeyWord(ds_list_find_value(_value, 0), keyWordPriority.temporary);
						}
						break;
		
					default:
						break;
				}
			}
		}
	}
}