/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();
boss_attack_animation_timer--
if(my_turn )
{
	if(chance_hit(use_skill_chance))
	{
		var skill_type = boss_skill_chance()
		
		switch(skill_type)
		{
			//heal
			case 0:
			{
					var heal_amount = (hp_max / 4)
					hp += heal_amount
					var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
					text_box.msg = string(my_name) + " healed " + string(heal_amount) 
					my_turn = false
					obj_BattleManager.next_turn = true
					obj_BattleManager.process_next_turn = true
			}
			break;
			//buff
			case 1:
			{
				if(chance_hit(50))
				{
					str_buffed = true;
					turn_length_s += 3;
					var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
					text_box.msg = string(my_name) + " gave themselves a power boost!" 
				}
				else
				{
					def_buffed = true;
					turn_length_d += 3;
					var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
					text_box.msg = string(my_name) + " gave themselves a defense boost!"
				}
			}
			break;
			
			//burstshot
			case 2:
				if(fire_now)
				{
					fire_now = false;
					alarm[5] = 0.05 * room_speed;
					burst_count++
					if(burst_count > 2)
					{				
						script_execute(burst_shot, id, obj_protoplayer, Bullet_6, true, Impact_6 )
						target = noone
						boss_attack_animation_timer = 20
						sprite_index = spr_boss_attack
						my_turn = false
						burst_count = 0
					}
					else
					{
						script_execute(burst_shot, id, obj_protoplayer, Bullet_6, false, Impact_6 )
					}
					
				}
			break;
			
			//charge_shot
			case 3:
			{
					script_execute(grenade_toss, id, target, Bullet_4, true, Impact_3)
					target = noone
					boss_attack_animation_timer = 20
					sprite_index = spr_boss_attack
					my_turn = false
			}
			break;
		}
	}
	else
	{
		if(shoot_once)
		{
			shoot_once = false
			basic_shot(id, obj_protoplayer, Bullet_5, true, Impact_5)
			boss_attack_animation_timer = 30
			sprite_index = spr_boss_attack
			my_turn = false
		}
	}
}
else
	shoot_once = true;
if(hp <= 0)
	instance_destroy()
if(boss_attack_animation_timer <= 0)
	sprite_index = spr_boss_idle