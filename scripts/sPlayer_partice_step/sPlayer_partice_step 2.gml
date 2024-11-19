/// @description sPlayer_partice_step();
function sPlayer_partice_step() {

	if phy_speed>1{

	part_emitter_region(drift,emm,x-1,x+1,y-1,y+1,ps_shape_rectangle,ps_distr_gaussian)
	inertia_dir=point_direction(x,y,x+phy_speed_x,y+phy_speed_y)
	forward_dir=point_direction(x,y,x+lengthdir_x(50,-phy_rotation+90),y+lengthdir_y(50,-phy_rotation+90))
	angle_dif=abs(angle_difference(forward_dir,inertia_dir))
	if (angle_dif>20){

	//emit tyres
	part_type_orientation(tyre_part,-phy_rotation,-phy_rotation,0,0,0)
	part_emitter_burst(drift,emm,tyre_part,5)
	//emit smoke
	part_type_speed(smoke_part,1,2,0,0)
	part_type_direction(smoke_part,inertia_dir,inertia_dir,0,0)
	part_emitter_burst(drift,emm,smoke_part,1)
	}
	}



}
