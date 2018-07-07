///@description Initializes and returns a grid with the 3 original known keywords, so the grid never has a height of 0.

mDsCreateGrid(id, "knownKeyWords", 2, 3);

ds_grid_add(knownKeyWords, 0, 0, "name");
ds_grid_add(knownKeyWords, 1, 0, keyWordPriority.name);
ds_grid_add(knownKeyWords, 0, 1, "job");
ds_grid_add(knownKeyWords, 1, 1, keyWordPriority.job);
ds_grid_add(knownKeyWords, 0, 2, "bye");
ds_grid_add(knownKeyWords, 1, 2, keyWordPriority.bye);