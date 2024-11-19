///@desc Draw halftone

halftone_draw(application_surface, 0, 0, slider_values[0], 0);

//Draw sliders
if (slider_enabled)
{
	//Draw corner gradient
	draw_primitive_begin(pr_trianglelist);
	draw_vertex_color(000, 000, 0, 0.6);
	draw_vertex_color(320, 000, 0, 0);
	draw_vertex_color(000, 480, 0, 0);
	draw_primitive_end();
	
	//Title
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_title);
	draw_text_outline(16, 8, "Xor's Halftone");

	//Brief description
	draw_set_font(fnt_main);
	draw_text_outline(24, 56, "Adjust sliders below");

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	//Draw all sliders
	for(var i = 0; i<slider_num; i++)
	{
		//Position and size
		var _x, _y, _w, _h;
		_x = 16;
		_y = 96+40*i;
	
		_w = 256;
		_h = 32;
	
		//Draw slider box shadow, background and slider value
		draw_roundrect_color(_x-1.5, _y-1.5, _x+_w+1.5, _y+_h+1.5, c_black, c_black, 0);
		draw_roundrect_color(_x, _y, _x+_w, _y+_h, #444444, #888888, 0);
		draw_roundrect_color(_x, _y, _x+_w*slider_values[i], _y+_h, #EEEECC, #FFFFDD, 0);
	
		//Draw slider name and amount
		var _text = slider_names[i] + " " + string(round(slider_values[i]*100))+"%";
		draw_text_outline(_x + _w/2, _y + _h/2, _text);
	}
}