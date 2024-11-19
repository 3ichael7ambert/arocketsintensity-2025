/// @description Toggle between minimap examples
/*if instance_exists(objPlane)
{
	if (example == 1) {
	//change minimap sprites
	var _example2 = [objEnemyPlane,sprCircleEnemy,objEnemyBullet,sprCircleBullet];
	array_copy(global.minimapObjects,0,_example2,0,array_length_1d(_example2));
	global.player.minimapSpr = sprCirclePlayer;
	//change vision cones
	global.player.minimapDrawCone = false;
	with (objEnemyPlane) {
		minimapDrawCone = true;
	}
	example = 2;
}
else {
	//change minimap sprites
	var _example1 = [objEnemyPlane,sprCircleEnemy,objEnemyBullet,sprCircleBullet];
	array_copy(global.minimapObjects,0,_example1,0,array_length_1d(_example1));
	global.player.minimapSpr = sprCirclePlayer;
	//change vision cones
	global.player.minimapDrawCone = true;
	with (objEnemyPlane) {
		minimapDrawCone = false;
	}
	example = 1;
}
}*/