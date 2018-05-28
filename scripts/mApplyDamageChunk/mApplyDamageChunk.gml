///@description Applies all damage in a damageChunk to a specific instance.
///@arg victim - The instance to apply all damage to.
///@arg damageChunk - The damageChunk to take instances of damage from.

var _victim = argument0;
var _dc = argument1;

//Verify the data types before we begin.
if (instance_exists(_victim) && _dc.damageInstances != undefined && ds_exists(_dc.damageInstances, ds_type_grid))
{
	var _di = _dc.damageInstances;
	var _gridHeight = ds_grid_height(_di);
	for (var _i = 0; _i < _gridHeight; _i++)
	{
		var _damageValue = ds_grid_get(_di, 0, _i);
		var _damageType = ds_grid_get(_di, 1, _i);
		mDealDamage(_victim, _damageValue, _damageType);	
	}
	
	//Damage was successfully dealt.
	return true;
}

//Damage not dealt.
return false;