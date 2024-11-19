/// @description sPlayer_draw_neon(color);
/// @param color
function sPlayer_draw_neon(argument0) {
	draw_set_blend_mode(bm_add)
	draw_sprite_ext(spr_car_neon,-1,obj_car.phy_position_x,obj_car.phy_position_y,1,1,-phy_rotation,argument0,0.2)
	draw_set_blend_mode(bm_normal)



}
