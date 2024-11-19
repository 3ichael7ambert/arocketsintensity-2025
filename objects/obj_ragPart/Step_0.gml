/// @description  Joints & Physics
x = phy_position_x;
y = phy_position_y;

if joint = true && hp <= 0{
    joint = false;
    physics_joint_delete(j);
}

if joint = true{
    if !instance_exists(target_j){
        joint = false;
    }
}
if ini_forcex != 0 || ini_forcey != 0{
    physics_apply_local_impulse(0,0,ini_forcex,ini_forcey);
    ini_forcex = 0;
    ini_forcey = 0;
}