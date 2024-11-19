/// @description Take damage
instance_destroy();
other.take_damage = damage;


//--------------------//
// STEAM
steam_set_stat_int("shots_collide", steam_get_stat_int("shots_collide") + 1);
//--------------------//
