loadingWorldChunk = instance_create_depth(x, y, 16000, oWorldChunk);
chunkFile = "testChunk.json";
chunkInfo = noone;
finishedLoading = false;

applySurface = false;
dataBuffer = buffer_create(1, buffer_grow, 1);
loadId = noone;
finishedBuffering = true;



alarm[0] = 20;

//timeline_index = qLoadWorldChunk;
//timeline_running = true;
//timeline_position = 0;
//timeline_loop = false;