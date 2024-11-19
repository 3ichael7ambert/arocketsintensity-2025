/// @description inicialize particle system
function sPlayer_particles() {
	drift=part_system_create()
	part_system_automatic_draw(drift,false)
	part_system_position(drift,0,0)
	emm=part_emitter_create(drift)
	//tyre particles
	tyre_part=part_type_create()
	part_type_sprite(tyre_part,spr_car_tires,false,false,false)
	part_type_life(tyre_part,1,500)
	part_type_alpha2(tyre_part,0.04,0)
	//smoke_particles
	smoke_part=part_type_create()
	part_type_sprite(smoke_part,spr_smoke,false,false,false)
	part_type_size(smoke_part,0.1,2,0.1,0.1)
	part_type_orientation(smoke_part,0,359,1,1,0)
	part_type_life(smoke_part,10,100)
	part_type_alpha2(smoke_part,0.1,0)
	//misc
	angle_dif=-1;



}
