///@description Usually called from mApplyDamageChunk. Applies an individual instance of damage.
///@arg victim - The oCombatActor whom this is dealing damage to.
///@arg damageValue - The amount of damage to deal.
///@arg damageType - The type of damage to deal.

var _victim = argument0;
var _damageValue = argument1;
var _damageType = argument2;

var _typeResist = 0;
var _bonusDamage = 0;

switch (_damageType)
{
	case damageTypes.physical:
		_typeResist = _victim.physicalResist;
		break;
		
	case damageTypes.cold:
		_typeResist = _victim.coldResist;
		break;
		
	case damageTypes.hot:
		_typeResist = _victim.hotResist;
		break;
		
	case damageTypes.electric:
		_typeResist = _victim.electricResist;
		break;
		
	case damageTypes.fyoshinite:
		_typeResist = _victim.physicalResist;
		if (_victim.race == "demon")
		{
			_typeResist /= 2;
			_bonusDamage += 2;
		}
}

_typeResist = min(_typeResist, 100);
_typeResist = 100 - _typeResist;
_typeResist = _typeResist / 100;
_damageValue = _damageValue * _typeResist;
_damageValue += _bonusDamage;

_victim.currentHealth -= _damageValue;