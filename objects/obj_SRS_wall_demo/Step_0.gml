/// @description Moving the box
if move{
	if flip{
		if (x < ini_x+amount){
			x++;
		}else{
			flip = !flip;	
		}
	}else{
		if (x > ini_x-amount){
			x--;
		}else{
			flip = !flip;	
		}
	}
	
	phy_position_x = x;
}