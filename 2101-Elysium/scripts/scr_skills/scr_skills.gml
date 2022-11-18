// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function skill_stuct (_myname, _skillfunction)
{

	
	this_struct = 
	{
		my_name : _myname,
		scr_per : _skillfunction
	}
	
	return this_struct
}

function fireball(text, amount){
	for(i = 0; i < amount; i++)
	{
		show_debug_message(text)
	}
}

function basic_shot(obj_id, obj_target, bul_sprite)
{
	//a struct to fill the bullet info
				bullet_struct = 
				{
					this_sprite : bul_sprite,
					parent : obj_id,
					target : obj_target
				}
	
			 instance_create_layer(obj_id.x,obj_id.y,"Instances", obj_BaseBullet, bullet_struct)
}

function burst_shot(obj_id, obj_target, bul_sprite, fire_now)
{
	for(i = 0; i < 3; i++)
	{
		basic_shot(obj_id, obj_target, bul_sprite)
	}
}

function grenade_toss(obj_id, obj_target, bul_sprite, fire_now)
{
				bullet_struct = 
				{
					this_sprite : bul_sprite,
					parent : obj_id,
					target : obj_target
				}
	
			 instance_create_layer(obj_id.x,obj_id.y,"Instances", obj_GrenadeBullet, bullet_struct)
}
