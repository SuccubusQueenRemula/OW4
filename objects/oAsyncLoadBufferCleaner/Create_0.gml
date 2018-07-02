//Async loads are great, but usually they exist because we want loads during live gameplay without impacting FPS.
//As such, actions the player takes during gameplay might "cancel" the async load.
//But when the async load event finishes... you have an issue with destroying the buffer the file was loading into.
//Because the async load was independant of framerate, you can't reliably know if the buffer has beem destroyed when you try to read it. This results in a crash.
//With this object, you can "stall" the deletion of a buffer a number of frames which you reliably know is past the last time it will be read.
//You can let the buffer load into a variable for the object as normal, then simply delete it afterwords.

dataBuffer = noone;
