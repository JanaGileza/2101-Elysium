/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button(mb_left))
{
	if(position_meeting(mouse_x,mouse_y, obj_baseenemy))
	{
		player_target = instance_position(mouse_x,mouse_y, obj_baseenemy)
	}
}
//if(player_target == noone)
//{
//	if(instance_number(obj_baseenemy) >= 1)
//		player_target = instance_nearest(x,y,obj_baseenemy)
//}

if(buff_fire_rate)
{
	buff_fire_rate = false;
	alarm[1] = 0.5 * room_speed;
	fire_rate = 0.1
	basic_fire = true
}

if(!my_turn)
	exit;
	

if(player_target != noone)
{
	if(basic_fire)
	{
		basic_fire = false;
		alarm[0] = fire_rate * room_speed
	
		bullet_struct = 
		{
			this_sprite : Bullet_1,
			parent : id,
			target : player_target
		}
	
		bullet = instance_create_layer(x,y,"Instances", obj_BaseBullet, bullet_struct)
		//bullet.parent = id;
		//bullet.target = player_target
	
	}
}

if(keyboard_check_pressed(vk_space))
{
	if(fire_rate > 0.1)
	{
		fire_rate -= 0.1;
	}
}
