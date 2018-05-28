///@description Initializes and returns a grid with the 3 original known keywords, so the grid never has a height of 0.

var _grid = ds_grid_create(2, 3);

ds_grid_add(_grid, 0, 0, "name");
ds_grid_add(_grid, 1, 0, keyWordPriority.name);
ds_grid_add(_grid, 0, 1, "job");
ds_grid_add(_grid, 1, 1, keyWordPriority.job);
ds_grid_add(_grid, 0, 2, "bye");
ds_grid_add(_grid, 1, 2, keyWordPriority.bye);

return _grid;