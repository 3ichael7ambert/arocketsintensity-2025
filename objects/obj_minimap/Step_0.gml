//check if player and enemy exist


if instance_exists(objPlane) {_objPlane=objPlane;} 
else if instance_exists(objLevel) {_objPlane=objLevel;}
else  if instance_exists(objLevelSide) {_objPlane=objLevelSide;}
else {_objPlane=noone;}

if instance_exists(objEnemyPlane) {_objEnemyPlane=objEnemyPlane;} 
else if instance_exists(objLevel) {_objEnemyPlane=objLevel;}
else  if instance_exists(objLevelSide) {_objEnemyPlane=objLevelSide;}
else {_objEnemyPlane=noone;}
