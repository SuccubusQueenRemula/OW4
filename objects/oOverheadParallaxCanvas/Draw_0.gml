//var _ownX = owner.x;
//var _ownY = owner.y;
//var _centX = oRoomCenter.x;
//var _centY = oRoomCenter.y;

//var _distX = _ownX - _centX;
//var _distY = _ownY - _centY;

//_distX *= 2;
//_distY *= 2;

//_distX -= global.chunkWidth;
//_distY -= global.chunkHeight;

if (draw)
{

var _ocx = owner.x + 512;
var _ocy = owner.y + 512;
var _rcx = oRoomCenter.x;
var _rcy = oRoomCenter.y;

//var _cc = ds_grid_get(oWorldHandler.worldChunks, 1, 1);
//var _cpoccX = _cc.x + 512;
//var _cpo;



//for (var _xx = 0; _xx < 3; _xx++)
//{
//	for (var _yy = 0; _yy < 3; _yy++)
//	{
//		var _value = ds_grid_get(oWorldHandler.worldChunks, _xx, _yy);
		
//		if (_value.object_index == oWorldChunkLoader) { _value = _value.loadingWorldChunk; }
		
//		if (_value.overheadCanvas == id)
//		{
//			_offsetX = (_xx - 1) * global.chunkWidth;
//			_offsetY = (_yy - 1) * global.chunkHeight;
//		}
		
//	}
//}

//var _distX = ((_cpoccX - _rcx) + _offsetX) * 2;
//var _distY = ((_cpoccY - _rcy) + _offsetY) * 2;

//var _distX = (_ownerX - _rcx * 2) - global.chunkWidth;
//var _distY = (_ownerY - _rcy * 2) - global.chunkHeight;



	if (!surface_exists(surface))
	{
		mDrawOverheadParallaxToSurface();
	}
	
	x = _rcx + ((_ocx - _rcx) * 2) - (surface_get_width(surface) / 2);
	y = _rcy + ((_ocy - _rcy) * 2) - (surface_get_height(surface) / 2);
	draw_surface(surface, x, y);
	
}

draw_set_color(c_red);
draw_rectangle(-5, -5, 5, 5, false);