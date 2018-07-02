loadingWorldChunk = instance_create_depth(x, y, 16000, oWorldChunk);
chunkInfo = noone;
finishedLoading = false;

applySurface = false;
dataBuffer = noone;
loadId = noone;
haltLoad = false;



alarm[0] = 2;

//timeline_index = qLoadWorldChunk;
//timeline_running = true;
//timeline_position = 0;
//timeline_loop = false;