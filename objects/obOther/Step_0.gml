	depth=-y

	if room=roStart
	{
		var xLimit=20
		var xLimitMax=480
		var yLimit=130
		var yLimitMax=240
		
		x=clamp(x, xLimit, xLimitMax)
		y=clamp(y, yLimit, yLimitMax)
	}
	
	
	
	if !Attacking 
	{
		if MoveType=1
		{
			x+=2.5
			sprite_index=Run
			image_xscale=1
		}
		if MoveType=2
		{
			x-=2.5
			sprite_index=Run
			image_xscale=-1
		}

		if MoveType2=1
		{
			y-=2.5
			sprite_index=Run
		}
		if MoveType2=2
		{
			y+=2.5
			sprite_index=Run
		}
	}