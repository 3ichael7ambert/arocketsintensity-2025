///@description Initialise minimap
if instance_exists(objPlane) {_objPlane=objPlane;} 
else if instance_exists(objLevel) {_objPlane=objLevel;}
else  if instance_exists(objLevelSide) {_objPlane=objLevelSide;}
else {_objPlane=noone;}

if instance_exists(objEnemyPlane) {_objEnemyPlane=objEnemyPlane;} 
else if instance_exists(objLevel) {_objEnemyPlane=objLevel;}
else  if instance_exists(objLevelSide) {_objEnemyPlane=objLevelSide;}
else {_objEnemyPlane=noone;}

minimap_init(objPlane,sprCirclePlayer,true,0.25,22,34,c_white);
minimap_objects(objEnemyPlane,sprCircleEnemy,objEnemyBullet,sprCircleBullet,objBullet,sprCircleBullet,objMissile,sprCircleBullet);

example = 1;