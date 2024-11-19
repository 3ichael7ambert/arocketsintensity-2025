/// @description moving the spawner
if flip{
	if x < 700{
		x++;
	}else{
		flip = !flip;	
	}
}else{
	if x > 350{
		x--;
	}else{
		flip = !flip;	
	}
}