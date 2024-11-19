///@desc Update sliders/settings

//Slider position, size and relative mouse position
var _x,_y,_w,_h,_mx,_my;
_x = 16;
_y = 96;
_w = 256;
_h = 40;
//Mouse relative to top-left corner
_mx = window_mouse_get_x() - _x;
_my = window_mouse_get_y() - _y;

//Check if inside slider area
if (_mx > -9) && (_mx < _w+9) && (_my>-9) && (_my<_h*slider_num+9) && (slider_enabled)
{
	//Change cursor to highlight
	if (cursor == 0)
	{
		window_set_cursor(cr_handpoint);
		cursor = 1;
	}
	
	//Select slider
	var _index;
	_index = clamp(floor(_my / _h), 0, slider_num-1);
	
	//Slider with left click
	if mouse_check_button_pressed(mb_left)
	{
		slider_selected = clamp(floor(_my / _h), 0, slider_num-1);
	}
	//Reset with right click
	if mouse_check_button_pressed(mb_right)
	{
		setting_update(_index, slider_defaults[_index]);
	}
	//Scroll slider (5%) with mouse wheel
	if (mouse_wheel_up() || mouse_wheel_down())
	{
		var _value;
		_value = slider_values[_index];
		_value += (mouse_wheel_up() - mouse_wheel_down()) * 0.05;
		
		setting_update(_index, _value);
	}
}
else
{
	//Default cursor
	if (cursor == 1) 
	{
		window_set_cursor(cr_default);
		cursor = 0;
	}
	//Switch background
	if mouse_check_button_pressed(mb_left)
	{
		var _layer, _back, _index;
		_layer = layer_get_id("Background");
		_back = layer_background_get_id(_layer);
		_index = layer_background_get_index(_back);
		
		layer_background_index(_back, _index+1);
	}
}

//If we're dragging a slider
if mouse_check_button(mb_left) && (slider_selected > -1)
{
	if (cursor != 2) 
	{
		window_set_cursor(cr_size_we);
		cursor = 2;
	}
	
	//Compute value
	var _value = _mx/_w;
	//Snap with shift
	if keyboard_check(vk_shift) _value = round(_value * 10) / 10;
	
	setting_update(slider_selected, _value);
}
else
{
	//Deselect when we release the mouse
	slider_selected = -1;
	
	if (cursor == 2) 
	{
		window_set_cursor(cr_handpoint);
		cursor = 1;
	}
}

//Quickly toggle the effect with space bar
if (keyboard_check_pressed(vk_space))
{
	slider_values[0] = !slider_values[0];
}

//Toggle sliders with enter
if (keyboard_check_pressed(vk_enter))
{
	//slider_enabled = !slider_enabled;
}

//Close game with escape
if (keyboard_check_pressed(vk_escape))
{
	game_end();
}

//Get window size
var _w,_h;
_w = window_get_width();
_h = window_get_height();
//If the window has been resized, update surface size
if (w != _w) || (h != _h)
{
	w = _w;
	h = _h;
	
	//Resize to window size
	surface_resize(application_surface, w, h);
	
	//Recenter and correct for aspect-ratio
	camera_set_view_pos(view_camera[0], 640 - 360 * w / h, 0);
	camera_set_view_size(view_camera[0], 720 * w / h, 720);
}