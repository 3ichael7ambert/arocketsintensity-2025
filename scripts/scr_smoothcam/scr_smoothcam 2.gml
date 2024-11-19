/// @description scr_smoothcam(target)
/// @param target
function scr_smoothcam(argument0) {
	if ! instance_exists(obj_camera)
	    {
	    instance_create(argument0.x,argument0.y,obj_camera);
	    }
    
	__view_set( e__VW.Object, 0, obj_camera );
	with (obj_camera)
	    {
	        x += (argument0.x - x) * .1
	        y += (argument0.y - y) * .1
	    }



}
