///@description Given an object and a CHID type, assigns a new CHID to the object.
///@arg object - The object to give a CHID to.
///@arg typeCHID - The type of CHID to give this object (SPAWN, STORE, etc.).

//WARNING: This method does not care if the object already had a CHID. It will overwrite the original.
//Use with caution and check for a CHID before calling this.

var _object = argument0;
var _typeCHID = argument1;
var _CHID = "";
with (oChangeListHandler)
{
	switch (_typeCHID)
	{
		case typeCHIDs.basic:
			_CHID = "BASIC" + string(currentBasicCHID);
			_object.CHID = _CHID;
			currentBasicCHID++;
			break;
			
		case typeCHIDs.chunk:
			//TODO: I want this to basically be like existing chunk CHIDS, containing the coords, plus maybe one extra letter.
			_CHID = "CHUNK" + string(currentChunkCHID);
			_object.CHID = _CHID;
			currentChunkCHID++;
			break;
			
		case typeCHIDs.spawn:
			//TODO: I want spawns to not be permanent if not picked up.
			_CHID = "SPAWN" + string(currentSpawnCHID);
			_object.CHID = _CHID;
			currentSpawnCHID++;
			break;
			
		case typeCHIDs.store:
			//TODO: I want store CHIDs to also have some connection to which store they came from. 
			_CHID = "STORE" + string(currentStoreCHID);
			_object.CHID = _CHID;
			currentStoreCHID++;
			break;
			
		case typeCHIDs.special:
			//TODO: I want to think of something that I want special CHIDs to do.
			_CHID = "SPECIAL" + string(currentSpecialCHID);
			_object.CHID = _CHID;
			currentSpecialCHID++;
			break;
	}
}