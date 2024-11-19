/// @description Set variables
image_alpha = 1;
image_xscale = random_range(0.75, 1.5);
image_yscale = image_xscale;
x += random_range(3, -3);
y += random_range(3, -3);
fade = 0.005;
if instance_exists(objPlane){
	depth=objPlane.depth+1;
} else
if instance_exists(objPlane){
	depth=objPlane3D.depth+1;
} else { depth=0; }


