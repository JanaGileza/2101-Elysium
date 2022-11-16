/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(target))
{
	//if(parent == obj_protoplayer)
		target = instance_nearest(x,y,obj_baseenemy)
}
	
if(position_meeting(x,y,target))
{
	if(chance_hit(accuracy))
		instance_destroy()
}
else
{
	if(instance_exists(target))
		move_towards_point(target.x,target.y, b_speed);
}


