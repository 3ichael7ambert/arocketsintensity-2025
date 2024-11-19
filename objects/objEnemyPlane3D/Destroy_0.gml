/// @description Explode
var radius = 64;
repeat(20)
{
    var xx = x+lengthdir_x(random(radius), random(360));
    var yy = y+lengthdir_y(random(radius), random(360));
    var sp = random_range(0.05, 0.1);
    create_effect(xx, yy, sprSmoke, sp, 0, -0.5, c_gray, 0.8);
}
create_effect(x, y, sprExplosion, 0.4, 0, 0, c_white, 1);


//ragdoll
instance_create(x,y,obj_ragdoll);

//kill +1
objLevel.kills+=1;

//--------------------//
// STEAM
steam_set_stat_int("total_kills", steam_get_stat_int("total_kills") + 1);
//--------------------//