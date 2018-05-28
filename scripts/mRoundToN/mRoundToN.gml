///arg value
///arg increment

var value = argument0;
var inc = argument1;


//Actually clever as balls. Rounds the value to the nearest increment.
return round(value / inc) * inc;