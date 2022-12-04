/// @description Insert description here
// You can write your code in this editor
heal_animation_timer--
healer_attack_animation_timer--

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
		sprite_index = spr_healer1_heal
		audio_play_sound(snd_heal,1,0)
		heal_animation_timer = 20
		my_turn = false
		if(turn_length_s > 0)
			turn_length_s--
		if(turn_length_d > 0)
			turn_length_d--
		
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
			sprite_index = spr_healer1_heal
			heal_animation_timer = 20
			audio_play_sound(snd_heal,1,0)
			my_turn = false
			obj_BattleManager.next_turn = true
			obj_BattleManager.process_next_turn = true
			if(turn_length_s > 0)
				turn_length_s--
			if(turn_length_d > 0)
				turn_length_d--
		}
		else
		{
			if(shoot_once)
			{
				shoot_once = false
				basic_shot(id, obj_protoplayer, Bullet_5, true, Impact_5)
				healer_attack_animation_timer = 20
				sprite_index = spr_healer1_attack
				audio_play_sound(snd_attack,1,0)
				my_turn = false
				if(turn_length_s > 0)
					turn_length_s--
				if(turn_length_d > 0)
					turn_length_d--
			}
		}
	}
}
else
	shoot_once = true;
if(hp <= 0)
	instance_destroy()
	
if(heal_animation_timer <= 0 && healer_attack_animation_timer <=0)
	sprite_index = spr_healer1_idle


event_inherited()




