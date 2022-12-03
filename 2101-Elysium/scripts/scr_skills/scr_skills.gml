// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function skill_stuct (_myname, _skillfunction, _skillcost)
{
	
	this_struct = 
	{
		my_name : _myname,
		scr_per : _skillfunction,
		my_cost : _skillcost
	}
	
	return this_struct
}

function fireball(text, amount){
	for(i = 0; i < amount; i++)
	{
		show_debug_message(text)
	}
}

function basic_shot(obj_id, obj_target, bul_sprite, _isend, _expType)
{
	//a struct to fill the bullet info
				bullet_struct = 
				{
					this_sprite : bul_sprite,
					parent : obj_id,
					target : obj_target,
					is_end : _isend,
					explosion_type : _expType
				}
				if(obj_id == obj_baseenemy)
					instance_create_layer(obj_id.x - 30,obj_id.y - (obj_id.sprite_height / 4) ,"Instances", obj_BaseBullet, bullet_struct) 
				else
					instance_create_layer(obj_id.x + 30,obj_id.y - (obj_id.sprite_height / 4) +13,"Instances", obj_BaseBullet, bullet_struct) 
}

function burst_shot(obj_id, obj_target, bul_sprite, fire_now, _expType)
{

	basic_shot(obj_id, obj_target, bul_sprite, fire_now, _expType)
	
	
	//if(fire_now)
	//	obj_protoplayer.mana -= 10;
}

function grenade_toss(obj_id, obj_target, bul_sprite, fire_now, _expType)
{
				bullet_struct = 
				{
					this_sprite : bul_sprite,
					parent : obj_id,
					target : obj_target,
					is_end : fire_now,
					explosion_type : _expType
				}
	
			 instance_create_layer(obj_id.x,obj_id.y,"Instances", obj_GrenadeBullet, bullet_struct)
}

function charge_shot(obj_id, obj_target, bul_sprite, fire_now, _expType)
{
				bullet_struct = 
				{
					this_sprite : bul_sprite,
					parent : obj_id,
					target : obj_target,
					is_end : fire_now,
					explosion_type : _expType
				}
	
			 instance_create_layer(obj_id.x + 50,obj_id.y - (obj_id.sprite_height / 4) - 50,"Instances", obj_ChargeBullet, bullet_struct)
}

////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
// Enemy SKills
///////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


