///@description Removes existing references of a chunk to borders, allowing reassignment.
///@arg parentChunk - The chunk to remove references from.

var _chunk = argument0;

with (_chunk)
{
	leftBorder = noone;
	rightBorder = noone;
	bottomBorder = noone;
	topBorder = noone;
	topRightBorder = noone;
	topLeftBorder = noone;
	bottomRightBorder = noone;
	bottomLeftBorder = noone;
}