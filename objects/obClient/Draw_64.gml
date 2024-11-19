draw_set_halign(fa_left)
draw_text(10, 10, "Ping: "+string(Ping))

draw_text(10, 40, "Number: "+string(instance_number(obEnemy)))

if room=roLogin
{
	draw_set_halign(fa_center)
	draw_text(room_width/2, room_height/2, "Press R To Register")
	draw_text(room_width/2, room_height/2+50, "Press L To Login")
}