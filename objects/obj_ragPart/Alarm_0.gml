image_xscale = dir;

if forcex = 0 && forcey = 0{
    physics_apply_local_force(0,0,ini_forcex * 2, ini_forcey * 2);
}


if title = "head"{
    physics_apply_local_force(0,0,forcex * (random_range(1.5,4) * -1),forcey * (random_range(1.5,4) * -1));
}
if title = "torso"{
    physics_apply_local_force(0,0,forcex * (random_range(3,7) * -1),forcey * (random_range(3,7) * -1));
}
if title = "waist"{
    physics_apply_local_force(0,0,forcex * (random_range(3,7) * -1),forcey * (random_range(3,7) * -1));
}
if title = "upperLegFront"{
    physics_apply_local_force(0,0,forcex * (random_range(1,6) * -1),forcey * (random_range(1,6) * -1));
}
if title = "upperLegBack"{
    physics_apply_local_force(0,0,forcex * (random_range(1,6) * -1),forcey * (random_range(1,6) * -1));
}
if title = "lowerLegFront"{
    physics_apply_local_force(0,0,forcex * (random_range(1,6) * -1),forcey * (random_range(1,6) * -1));
}
if title = "lowerLegBack"{
    physics_apply_local_force(0,0,forcex * (random_range(1,6) * -1),forcey * (random_range(1,6) * -1));
}

