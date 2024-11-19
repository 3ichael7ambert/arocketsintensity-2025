//draw_set_valign(fa_bottom)
//draw_set_halign(fa_middle)

//draw_text(x, y, Monster)

x=lerp(x, myX, 0.1)
y=lerp(y, myY, 0.1)

if Monster="Snake"
{
	sprite_index=spEnemy0	
}

if Monster="Bat"
{
	sprite_index=spEnemy1
}
image_speed=0
draw_self()

draw_text(x, y-32, Type)