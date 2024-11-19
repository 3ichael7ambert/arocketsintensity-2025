if ds_map_find_value(async_load, "id") == Data
{
    user = ds_map_find_value(async_load, "username")
    pass = ds_map_find_value(async_load, "password")
	if Type=0
	{
		var Struct = {
			Type: "Reg",
			U: user,
			P: pass,
		}
	scrSend(Struct)
	} else 
	{
	
		var Struct = {
			Type: "Log",
			U: user,
			P: pass,
		}
		scrSend(Struct)
	}
	
	//show_message_async(user)
	
}