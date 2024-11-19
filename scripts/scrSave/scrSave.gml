/// @description Save to a Javascript Grid
function scrSave() {
	var lvlstr, nl;

	lvlstr = "";
	nl = chr(13) + chr(10)
	lvlstr += "grid = [";
	var Tile=32
	for (var i = 0; i <room_height; i+=Tile) {
		lvlstr += "["
		for (var b = 0; b <room_width; b+=Tile)
		{
			
			if position_meeting(b, i, obCrate)
			{
				lvlstr += "1, "
			} else 
			{
				lvlstr += "0, "
			}
		}
		
		lvlstr += "],"
		
		lvlstr += nl;
		
	}
	lvlstr += "]";
	
	var File, Filename;
	Filename = string(room_get_name(room)) + ".txt"
	File = file_text_open_write(get_save_filename("", Filename))
	file_text_write_string(File,lvlstr);
	file_text_close(File);
}
