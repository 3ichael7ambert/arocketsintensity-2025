/// @description keyboard_init(left,right,up,down,a1,a2,a3,a4)
/// @param left
/// @param right
/// @param up
/// @param down
/// @param a1
/// @param a2
/// @param a3
/// @param a4
function keyboard_init(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	globalvar
	key_left,  //keys
	key_right,
	key_up,
	key_down,

	key_a1,
	key_a2,
	key_a3,
	key_a4,

	key_left_p, //keys pressed
	key_right_p,
	key_up_p,
	key_down_p,

	key_a1_p,
	key_a2_p,
	key_a3_p,
	key_a4_p,

	key_left_r, //keys_released
	key_right_r,
	key_up_r,
	key_down_r,

	key_a1_r,
	key_a2_r,
	key_a3_r,
	key_a4_r;

	//set keys

	//keys
	key_left = keyboard_check(argument0)
	key_right = keyboard_check(argument1)
	key_up = keyboard_check(argument2)
	key_down = keyboard_check(argument3)
	key_a1 = keyboard_check(argument4)
	key_a2 = keyboard_check(argument5)
	key_a3 = keyboard_check(argument6)
	key_a4 = keyboard_check(argument7)
	//pressed
	key_left_p = keyboard_check_pressed(argument0)
	key_right_p = keyboard_check_pressed(argument1)
	key_up_p = keyboard_check_pressed(argument2)
	key_down_p = keyboard_check_pressed(argument3)
	key_a1_p = keyboard_check_pressed(argument4)
	key_a2_p = keyboard_check_pressed(argument5)
	key_a3_p = keyboard_check_pressed(argument6)
	key_a4_p = keyboard_check_pressed(argument7)
	//released
	key_left_r = keyboard_check_released(argument0)
	key_right_r = keyboard_check_released(argument1)
	key_up_r = keyboard_check_released(argument2)
	key_down_r = keyboard_check_released(argument3)
	key_a1_r = keyboard_check_released(argument4)
	key_a2_r = keyboard_check_released(argument5)
	key_a3_r = keyboard_check_released(argument6)
	key_a4_r = keyboard_check_released(argument7)









}
