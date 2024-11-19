/// @function minimap_init(playerObj,playerObjMinimapSpr,drawPlayerCone,playerConeAlpha,playerConeLen,playerConeAng,playerConeCol);
/// @description Initialise the minimap
/// @param {id} playerObj The object the minimap is based off
/// @param {id} playerObjMinimapSpr The minimap sprite to draw for the playerObj
/// @param {bool} drawPlayerCone Whether to draw a vision cone for the playerObj
/// @param {real} playerConeAlpha Set the player vision cone alpha
/// @param {real} playerConeLen Set the player vision cone length
/// @param {real} playerConeAng Set the player vision cone angle
/// @param {real} playerConeCol Set the player vision cone colour
/// NOTE: Assign minimapDir to direction or image_angle etc. in the playerObj Step event (e.g. minimapDir = direction;)
function minimap_init(_playerObj,_playerObjMinimapSpr,_drawPlayerCone,_playerConeAlpha,_playerConeLen,_playerConeAng,_playerConeCol) {
	global.player = _playerObj;
	global.minimapObjects = [];
	with (global.player) {
		minimapSpr = _playerObjMinimapSpr;
		minimapDir = 0;
		minimapDrawCone = _drawPlayerCone;
		minimapConeAlpha = _playerConeAlpha;
		minimapConeLen = _playerConeLen;
		minimapConeAng = _playerConeAng;
		minimapConeCol = _playerConeCol;
	}
}

/// @function minimap_objects(object1,object1MinimapSpr,[object2,object2MinimapSpr,...,objectN,objectNMinimapSpr]);
/// @description Initialise minimap objects - Must be run After scr_minimap_init();
/// @param {id} object1 The object to be drawn on the minimap
/// @param {id} object1MinimapSpr The minimap sprite of object1
/// @param {id} [object2,object2MinimapSpr,...,objectN,objectNMinimapSpr] Repeat for each object to be drawn on the minimap (optional)
///	NOTE:	Do Not include the player object in this list. The minimap sprites must have the same origin as the actual sprites (i.e. if the wall sprite is centered, the wall minimap sprite must also be centered)
///			Place the following variables in the Create event of any object you want to use direction rotation or have a vision cone drawn on the minimap for:
///			minimapUseDirection = true;//sets this object's minimap sprite to be drawn rotated to its direction (if you remove this variable or set it to false the minimap will use image_angle)
///			minimapDrawCone = true;//Whether to draw a vision cone [based on either image_angle or direction per above] (if you remove this variable or set it to false it will not draw a cone)
///			minimapConeAlpha = 0.25;//set the alpha of the cone
///			minimapConeLen = 24;//set the cone length
///			minimapConeAng = 22;//set the angle of the cone
///			minimapConeCol = c_red;//set the cone colour
function minimap_objects() {
	for (var _i=0; _i<argument_count; _i++) {
		global.minimapObjects[array_length_1d(global.minimapObjects)] = argument[_i];
	}
}

/// @function minimap_draw_gui(type,bkgSprite,bkgSubImg,fgdSprite,fgdSubImg,x,y,xScale,yScale,rot,col,alpha,xRange,yRange,radius);
/// @description Draw the minimap
/// @param {real} type The type of minimap to draw: 0=based off player object, 1=based off center of room
/// @param {id} bkgSprite The minimap sprite background
/// @param {real} bkgSubImg The bkgSprite's sub image to draw
/// @param {id} fgdSprite The minimap sprite foreground (-1 for none)
/// @param {real} fgdSubImg The fgdSprite's sub image to draw (-1 for none)
/// @param {real} x The x-coordinate to draw the minimap
/// @param {real} y The y-coordinate to draw the minimap
/// @param {real} xScale The horizontal scaling to draw the minimap (1 for normal)
/// @param {real} yScale The vertical scaling to draw the minimap (1 for normal)
/// @param {real} rot The rotation to draw the minimap (0 for normal)
/// @param {real} col The colour to draw the minimap (c_white for normal)
/// @param {real} alpha The alpha to draw the minimap (1 for normal)
/// @param {real} xRange The horizontal range in pixels from the player object to be displayed on the minimap (see NOTE below)
/// @param {real} yRange The vertical range in pixels from the player object to be displayed on the minimap (see NOTE below)
/// @param {real} radius Half of the width in pixels of the minimap's sprite
/// NOTE: Your minimap sprite must be centered. The xRange/yRange you use and the size of your objects' minimap sprites are proportional - if the minimap looks off, change one or the other until it looks right
function minimap_draw_gui(_type,_bkgSprite,_bkgSubImg,_fgdSprite,_fgdSubImg,_x,_y,_xScale,_yScale,_rot,_col,_alpha,_xRange,_yRange,_radius) {
	//init drawing
	
	if instance_exists(global.player) {
	if (_type == 0)  {
		var _centerX = global.player.x;
		var _centerY = global.player.y;
		var _playerX = _x;
		var _playerY = _y;
	}
	else {
		var _centerX = round(room_width/2);
		var _centerY = round(room_height/2);
		var _pDist = _radius*(point_distance(_centerX,_centerY,global.player.x,global.player.y)/max(_xRange,_yRange));
		var _pAng = point_direction(_centerX,_centerY,global.player.x,global.player.y);
		var _playerX = _x+lengthdir_x(_pDist,_pAng);
		var _playerY = _y+lengthdir_y(_pDist,_pAng);
	}
	}
	//draw minimap background
	draw_sprite_ext(_bkgSprite,_bkgSubImg,_x,_y,_xScale,_yScale,_rot,_col,_alpha);
	//draw objects
	for (var _i=0; _i<array_length_1d(global.minimapObjects); _i++) {
		with (global.minimapObjects[_i]) {
			if (point_distance(x,_centerY,_centerX,_centerY) <= _xRange && point_distance(_centerX,y,_centerX,_centerY) <= _yRange) {//check xRange then yRange
				var _dist = _radius*(point_distance(_centerX,_centerY,x,y)/max(_xRange,_yRange));
				var _ang = point_direction(_centerX,_centerY,x,y);
				if (variable_instance_exists(id,"minimapUseDirection") && minimapUseDirection) {
					_oRot = direction;
				}
				else {
					var _oRot = image_angle;
				}
				var _xx = _x+lengthdir_x(_dist,_ang);
				var _yy = _y+lengthdir_y(_dist,_ang);
				draw_sprite_ext(global.minimapObjects[_i+1],0,_xx,_yy,1,1,_oRot,c_white,1);
				//draw vision cone
				if (variable_instance_exists(id,"minimapDrawCone") && minimapDrawCone) {
					draw_set_alpha(minimapConeAlpha);
					draw_triangle_color(_xx,_yy,
					_xx+lengthdir_x(minimapConeLen,_oRot-minimapConeAng),_yy+lengthdir_y(minimapConeLen,_oRot-minimapConeAng),
					_xx+lengthdir_x(minimapConeLen,_oRot+minimapConeAng),_yy+lengthdir_y(minimapConeLen,_oRot+minimapConeAng),minimapConeCol,minimapConeCol,minimapConeCol,false);
					draw_set_alpha(1);
				}
			}
		}
		_i += 1;//skip the minimap sprite in the array
	}
	//draw minimap foreground
	if (_fgdSprite != -1) {
		draw_sprite_ext(_fgdSprite,_fgdSubImg,_x,_y,_xScale,_yScale,_rot,_col,_alpha);
	}
	//draw player
	
	if instance_exists(global.player) {
	with (global.player) {
		draw_sprite_ext(minimapSpr,0,_playerX,_playerY,1,1,minimapDir,c_white,1);
		//draw vision cone
		if (minimapDrawCone) {
			draw_set_alpha(minimapConeAlpha);
			draw_triangle_color(_playerX,_playerY,
			_playerX+lengthdir_x(minimapConeLen,minimapDir-minimapConeAng),_playerY+lengthdir_y(minimapConeLen,minimapDir-minimapConeAng),
			_playerX+lengthdir_x(minimapConeLen,minimapDir+minimapConeAng),_playerY+lengthdir_y(minimapConeLen,minimapDir+minimapConeAng),minimapConeCol,minimapConeCol,minimapConeCol,false);
			draw_set_alpha(1);
		}
	}
	}
}