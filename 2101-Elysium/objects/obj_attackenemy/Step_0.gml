/// @description Insert description here
// You can write your code in this editor

attack_animation_timer--

if(my_turn )
{
	if(chance_hit(skill_chance))
		use_skill = true
	
	if(use_skill)
	{
		if(fire_now)
				{
					fire_now = false;
					alarm[5] = 0.05 * room_speed;
					burst_count++
					if(burst_count > 2)
					{				
						script_execute(burst_shot, id, obj_protoplayer, Bullet_6, true, Impact_6 )
						target = noone
						attack_animation_timer = 30
						sprite_index = spr_attacker_attack1
						audio_play_sound(snd_burstshot,1,0)
						my_turn = false
						burst_count = 0
						use_skill = false
						if(turn_length_s > 0)
							turn_length_s--
						if(turn_length_d > 0)
							turn_length_d--
					}
					else
					{
						script_execute(burst_shot, id, obj_protoplayer, Bullet_6, false, Impact_6 )
					}
					
				}
	}
	else
	{
		if(shoot_once)
		{
			shoot_once = false
			basic_shot(id, obj_protoplayer, Bullet_5, true, Impact_5)
				if(turn_length_s > 0)
					turn_length_s--
				if(turn_length_d > 0)
					turn_length_d--
			sprite_index = spr_attacker_attack1
			attack_animation_timer = 30
			audio_play_sound(snd_attack,1,0)
			my_turn = false
		}
	}
}
else
	shoot_once = true;
if(hp <= 0)
	instance_destroy()

if(attack_animation_timer <= 0)
	sprite_index = spr_attacker1_idle
	
	event_inherited()