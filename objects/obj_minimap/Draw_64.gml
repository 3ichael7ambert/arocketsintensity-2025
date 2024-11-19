///@description Draw minimap
//draw_text(8,8,"Press <Space> to change minimap example");
//draw minimap
var _minimapOffset = sprite_get_xoffset(sprMiniMap);
var _xOffset = 540;
var _yOffset = -250;



;
if (example == 1) {
	minimap_draw_gui(0,sprMiniMap,0,sprMiniMap,1,_minimapOffset+_xOffset,display_get_gui_height()-_minimapOffset-_yOffset,1,1,0,c_white,1,960,540,180);
}
else {//example 2
	minimap_draw_gui(1,sprMiniMap,0,sprMiniMap,1,_minimapOffset+_xOffset,display_get_gui_height()-_minimapOffset-_yOffset,1,1,0,c_white,1,960,540,170);
}
