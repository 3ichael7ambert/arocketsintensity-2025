function scrMove()
{
	depth=-y
	if room=1
	{
		var xLimit=20
		var xLimitMax=480
		var yLimit=130
		var yLimitMax=240
	}
	
	x=clamp(x, xLimit, xLimitMax)
	y=clamp(y, yLimit, yLimitMax)
	
	if keyboard_check_pressed(ord("Z")) and !Attacking
	{
		sprite_index=Atk[1]
		image_index=0
		Attacking=1
		MoveType=0
		MoveType2=0
		
		var Struct = {
			Type: "Attacker",
			Asset: sprite_get_name(sprite_index),
			//xScale: sign(image_xscale)
		}

		scrSend(Struct)
	}
	
	if sprite_index=Atk[0] and round(image_index)>=6 and !Spear
	{
		//var iD=instance_create_depth(x, y-65, depth-10, obSpear)
		//	iD.image_xscale=image_xscale	
			
		Spear=1
	}
	if keyboard_check_pressed(ord("X")) and !Attacking
	{
		sprite_index=Atk[0]
		image_index=0
		Attacking=1
		MoveType=0
		MoveType2=0
		Spear=0
		
		var Struct = {
			Type: "Attacker",
			Asset: sprite_get_name(sprite_index),
			//xScale: sign(image_xscale)
		}

		scrSend(Struct)
	}
	/*
	if Movie
	{
		//x=lerp(x, moveX, 0.1)
		//y=lerp(y, moveY, 0.1)
		if moveX>x x+=MoveSpeed else x-=MoveSpeed
	}
	if Movie2
	{
		//x=lerp(x, moveX, 0.1)
		//y=lerp(y, moveY, 0.1)
		if moveY>y y+=MoveSpeed else y-=MoveSpeed
	}
	if abs(x-moveX)<=10
	{
		Movie=0	
	}
	if abs(y-moveY)<=10
	{
		Movie2=0	
	}
	*/
	//Don't move when we attack
	if !Attacking
	{
		if keyboard_check(vk_right)// and x<xLimitMax
		{
			MoveType=1
			x+=MoveSpeed
			sprite_index=Run
			image_xscale=1
			//Movie=0
			//show_debug_message(x)
		}
		if keyboard_check(vk_left) //and x>xLimit
		{
			MoveType=2
			x-=MoveSpeed
			sprite_index=Run
			image_xscale=-1
			//Movie=0
		}

		if keyboard_check(vk_up) //and y<yLimitMax
		{
			MoveType2=1
			y-=MoveSpeed
			sprite_index=Run
			//Movie2=0
		}
		if keyboard_check(vk_down) //and y>yLimit
		{
			MoveType2=2
			y+=MoveSpeed
			sprite_index=Run
			//Movie2=0
		}
	
	if keyboard_check_released(vk_down) or keyboard_check_released(vk_up)
	{
		MoveType2=0
		sprite_index=Stand
		image_index=0
		MoveSpeed=DefaultMove
	}
	if keyboard_check_released(vk_right) or keyboard_check_released(vk_left)
	{
		MoveType=0
		sprite_index=Stand
		image_index=0
		MoveSpeed=DefaultMove
	}
	
	if keyboard_check(vk_right) and keyboard_check(vk_left)
	{
		MoveType=0
		sprite_index=Stand
		image_index=0
		MoveSpeed=0
	}
	
	if keyboard_check(vk_up) and keyboard_check(vk_down)
	{
		MoveType2=0
		sprite_index=Stand
		image_index=0
		MoveSpeed=0
	}
	
	if (keyboard_check(vk_up) and keyboard_check(vk_down)) and (keyboard_check(vk_left) or keyboard_check(vk_right))
	{
		MoveType=0
		sprite_index=Stand
		image_index=0
		MoveSpeed=0
	}
	if (keyboard_check(vk_left) and keyboard_check(vk_right)) and (keyboard_check(vk_down) or keyboard_check(vk_up))
	{
		MoveType2=0
		sprite_index=Stand
		image_index=0
		MoveSpeed=0
	}
	}
	//Don't send every frame
	if MoveChange!=MoveType
	{
		MoveChange=MoveType
	
		var Struct = {
			Type: "Move",
			MoveChange: MoveChange
		}
		scrSend(Struct)
	}
	if MoveChange2!=MoveType2
	{
		MoveChange2=MoveType2
	
		var Struct = {
			Type: "Move2",
			MoveChange2: MoveChange2
		}

		scrSend(Struct)
	}
}