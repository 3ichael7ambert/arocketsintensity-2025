/// @description First spawn
global.cur_rag = 1;
a = instance_create_depth(x,y,depth,obj_ragdoll);
Create_Ragdoll(a,spr_SRS_head,spr_SRS_neck,spr_SRS_torso,spr_SRS_waist,spr_SRS_upperarm,spr_SRS_lowerarm,spr_SRS_upperleg,spr_SRS_lowerLeg,spr_SRS_foot,0,0,0,1,0,0);
alarm_set(0,25);
flip = false;