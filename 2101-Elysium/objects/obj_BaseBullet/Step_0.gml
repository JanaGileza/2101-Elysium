/// @description Insert description here
// You can write your code in this editor


//if the bullet has a target, head in that direction
if(!instance_exists(target))
{
	//if(parent == obj_protoplayer)
		target = instance_nearest(x,y,obj_baseenemy)
}
	
if(position_meeting(x,y,target))
{
	//checking if the bullet hit or miss
	if(chance_hit(accuracy))
		instance_destroy()
}
else
{
	if(instance_exists(target))
		move_towards_point(target.x,y, b_speed);
}


