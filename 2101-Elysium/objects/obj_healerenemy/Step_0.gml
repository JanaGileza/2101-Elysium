/// @description Insert description here
// You can write your code in this editor

if(my_turn )
{
	if(hp < hp_max /2)
	{
		save_self = 25;
	}
	else
		save_self = 0;
	
	if(chance_hit(save_self))
	{
		var heal_amount = (hp_max / 3)
		hp += heal_amount
		var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
		text_box.msg = string(my_name) + " healed " + string(heal_amount) 
		my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true
	}
	else
	{
	
		for(var i = 0; i < ds_list_size(obj_BattleManager.enemy_list); i++)
		{
			var comrade = ds_list_find_value(obj_BattleManager.enemy_list, i)
			
			if(comrade.hp < comrade.hp_max / 2)
			{
				save_comrade_chance = 50
				if(chance_hit(save_comrade_chance))
				{
					saving_comrade = comrade
					break;
				}
				
			}
		}
		if(saving_comrade != noone)
		{
			var heal_amount = (saving_comrade.hp_max / 3)
			saving_comrade.hp += heal_amount
			var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
			text_box.msg = string(my_name) + " healed " + string(saving_comrade.my_name) + "for " + string(heal_amount)
			saving_comrade = noone
			my_turn = false
			obj_BattleManager.next_turn = true
			obj_BattleManager.process_next_turn = true
		}
		else
		{
			if(shoot_once)
			{
				shoot_once = false
				basic_shot(id, obj_protoplayer, Bullet_5, true)
				my_turn = false
			}
		}
	}
}
else
	shoot_once = true;
if(hp <= 0)
	instance_destroy()





