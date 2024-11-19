function draw_sprite_3d(sprite, index, xx, yy, zz, rotx, roty, rotz){
	
	depth = 0;
	var matrix_translate =	matrix_build(xx,yy,zz,	0,0,0,		1,1,1);
	var matrix_rotate =		matrix_build(0,0,0,		rotx,roty,rotz,	1,1,1);
	var matrix_scale =		matrix_build(0,0,0,		0,0,0,		1,1,1);
	
	var matrix_rs = matrix_multiply(matrix_scale, matrix_rotate);
	var matrix_final = matrix_multiply(matrix_rs, matrix_translate);
	
	matrix_set(matrix_world, matrix_final);
	
	draw_sprite(sprite, index, 0, 0);
	
	matrix_set(matrix_world, matrix_build_identity());
}
