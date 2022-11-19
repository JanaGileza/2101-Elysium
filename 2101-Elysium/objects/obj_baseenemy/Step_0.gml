/// @description Insert description here
// You can write your code in this editor


//if(!wait)
//{
//	wait = true;
	
//	if(my_turn)
//		alarm[0] = 3 * room_speed;
//}


//if(my_turn && !wait)
//{
//	wait = true;
//	alarm[0] = 10 * room_speed;
//}

if(my_turn )
{
	if(shoot_once)
	{
		shoot_once = false
		basic_shot(id, obj_protoplayer, Bullet_5, true)
		my_turn = false
	}
}
else
	shoot_once = true;
if(hp < 0)
	instance_destroy()

