/// @description Spawning
if instance_number(obj_ragdoll) < 20{
	a = instance_create_depth(x,y,depth,obj_ragdoll);
	Create_Ragdoll(a,spr_SRS_head,spr_SRS_neck,spr_SRS_torso,spr_SRS_waist,spr_SRS_upperarm,spr_SRS_lowerarm,spr_SRS_upperleg,spr_SRS_lowerLeg,spr_SRS_foot,irandom_range(0,7),random_range(-2,2),random_range(-2,2),choose(-1,1),random_range(-2,2),random_range(-2,2));
	alarm_set(0,random_range(5,35));
}