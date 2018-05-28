///@description To be called by an instance of oChangeList. Writes the arguments into the list at the specified entry.
///@arg changeType - What type of change work is this?
///@arg target - What entity does this change target? This is usually a CHID.
///@arg time - At what gametime was this change applied? This is usually to sort the list or to use the order of events to condense the list into a smaller form.
///@arg args - Can basically be anything. A parameter or an array of parameters that the list needs to know.

//Add a new row for this change.
mDsGridAddRow(changes);

var _i = ds_grid_height(changes) - 1;
var _changeType = argument0;
var _tar = argument1;
var _time = argument2;
var _args = argument3;

ds_grid_set(changes, changeListColumns.command, _i, _changeType);
ds_grid_set(changes, changeListColumns.target, _i, _tar);
ds_grid_set(changes, changeListColumns.time, _i, _time);
ds_grid_set(changes, changeListColumns.arg, _i, _args);
