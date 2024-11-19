///@desc Initialize

//Anti-aliasing level 8
display_reset(8, false);
//Initialize default parameters
halftone_initialize(spr_noise, spr_paper);
//Set ink colors slightly faded
halftone_set_cmyk_colors(#22FFFF, #FF22FF, #FFFF22, #222222);

//We'll draw this manually
application_surface_draw_enable(false);
//Width and height for aspect-ratio calculations
w = view_wport[0];
h = view_hport[0];

//Some basic slider parameters for demo
slider_selected = -1;
slider_defaults = [1, 0.03, 0.5, 0.5, 0.5, 0.667, 0.6, 0];
slider_values = [1, 0.03, 0.5, 0.5, 0.5, 0.667, 0.6, 0];
slider_names = ["Intensity", "Scale", "Contrast", "Brightness", "Noise Amp", "Noise Scale", "CMYK Shift", "CMYK Angle"];
slider_num = array_length(slider_values);
slider_enabled = false;

//Cursor 0 = default, 1 = highlight, 2 = side-arrow
cursor = 0;

//Updates settings from sliders
function setting_update(slider, value)
{
	var _value = clamp(value, 0, 1);
	//Update slider
	slider_values[slider] = _value;
	
	//Update settings (not the prettiest method, but it shows how this works)
	switch(slider_names[slider])
	{
		case "Scale":
		halftone_set_scale(lerp(2, 18, _value));
		break;
		
		case "Contrast":
		halftone_set_contrast(lerp(0.5, 2, _value));
		break;
		
		case "Brightness":
		halftone_set_contrast( , lerp(0, 1, _value));
		break;
		
		case "Noise Amp":
		halftone_set_noise( , , _value);
		break;
		
		case "Noise Scale":
		halftone_set_noise( , lerp(64, 256, _value));
		break;
		
		case "CMYK Shift":
		halftone_set_cmyk_offsets(lerp(-10, 10, _value));
		break;
		
		case "CMYK Angle":
		halftone_set_cmyk_offsets( , lerp(0, 360, _value));
		break;
	}
}

//Basic outline function for demo
function draw_text_outline(x, y, str)
{
	draw_set_color(#222244);
	draw_set_alpha(0.5);
	draw_text(x-2, y, str);
	draw_text(x+2, y, str);
	draw_text(x, y-2, str);
	draw_text(x, y+2, str);
	draw_text(x-1, y-1, str);
	draw_text(x+1, y-1, str);
	draw_text(x-1, y+1, str);
	draw_text(x+1, y+1, str);
	
	draw_set_alpha(1);
	draw_set_color($FFFFFF);
	draw_text(x, y, str);
}