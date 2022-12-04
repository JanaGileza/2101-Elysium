/// @description Insert description here
// You can write your code in this editor
if(wait)
	exit;

//if the bullet has a target, head in that direction
if(!instance_exists(target))
{
	//if(parent == obj_protoplayer)
		//target = instance_nearest(x,y,obj_baseenemy)
		instance_destroy()
}

if(target == obj_protoplayer)
	if(position_meeting(x-30,y,target))
	{
		//checking if the bullet hit or miss
		if(chance_hit(accuracy))
			instance_destroy()
		else
			target_missed = true;
	}
	else
	{
		if(instance_exists(target) && !target_missed)
			move_towards_point(target.x,target.y, b_speed);
		else
			move_towards_point(x - 1, y, b_speed);
	}

else
	if(position_meeting(x+30,y,target))
	{
		//checking if the bullet hit or miss
		if(chance_hit(accuracy))
			instance_destroy()
		else
			target_missed = true;
	}
	else
	{
		if(instance_exists(target) && !target_missed)
			move_towards_point(target.x,target.y, b_speed);
		else
			move_towards_point(x + 1, y, b_speed);
	}









