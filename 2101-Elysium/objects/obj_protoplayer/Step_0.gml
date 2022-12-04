/// @description Main, contains player state machine
// You can write your code in this editor

if(charging)
{
	glow_count += (0.01 * glow_multi);

	if(glow_count >= 0.8 || glow_count <= 0)
	{
		glow_multi *= -1;
	}
	add = glow_count;
	
	//part_particles_create(global.particle_system, mouse_x, mouse_y, global.ptBasic, 1)
}
//experimental on choosing target by clicking on the enemy
if(mouse_check_button(mb_left))
{
	if(position_meeting(mouse_x,mouse_y, obj_baseenemy))
	{
		player_target = instance_position(mouse_x,mouse_y, obj_baseenemy)
	}
}

//if its not the players turn just exit
if(!my_turn)
{
	if(turn_length > 0)
		turn_length--;
	if(!charging)
	{
		state = player_state.idle
		add = 0;
	}
	exit;
}


//if we are going to base basic attacks off of fire_rate
if(buff_fire_rate)
{
	buff_fire_rate = false;
	alarm[1] = 0.5 * room_speed;
	fire_rate = 0.1
	basic_fire = true
}


	if(turn_length <= 0)
		defense_reduction = 1;
/*
The meat and potatoes of the player, the finite state for the player. The player will have 6 or more states
the main functions that performs is attacking, defending, utilizing skills/items and escaping if needed

Attack = create a bullet and aim it towards the target. For right now have bullet to end the player turn
to ensure that the turn ends when the animation is over. (Will need to change later)

Defend = Simply apply something to subtract incoming damage

Skill = Needs to be dynamic, it will fill depending on the players weapon but as of right now the weapon will
come later to put restraints on player to progress through game smoothly.

Items = same as skill, needs to be dynamic but instead will give aid to the player in some ways or the other

Escape = Just send player back to the world_map for now.
*/
if(mouse_check_button(mb_left))
{
	if(position_meeting(mouse_x,mouse_y, obj_baseenemy))
	{
		player_target = instance_position(mouse_x,mouse_y, obj_baseenemy)
	}
}

//if its not the players turn just exit
if(!my_turn)
{
	if(turn_length > 0)
		turn_length--;
	if(!charging)
		state = player_state.idle
	exit;
}

if(charging && charging_length >0)
	state = player_state.charging
	
if(charging && charging_length <= 0)
{
	state = player_state.skill
	skill_perf = charge_shot;
	player_target = charge_enemy
}


//if we are going to base basic attacks off of fire_rate
if(buff_fire_rate)
{
	buff_fire_rate = false;
	alarm[1] = 0.5 * room_speed;
	fire_rate = 0.1
	basic_fire = true
}

	if(turn_length <= 0)
		defense_reduction = 1;
/*
The meat and potatoes of the player, the finite state for the player. The player will have 6 or more states
the main functions that performs is attacking, defending, utilizing skills/items and escaping if needed

Attack = create a bullet and aim it towards the target. For right now have bullet to end the player turn
to ensure that the turn ends when the animation is over. (Will need to change later)

Defend = Simply apply something to subtract incoming damage

Skill = Needs to be dynamic, it will fill depending on the players weapon but as of right now the weapon will
come later to put restraints on player to progress through game smoothly.

Items = same as skill, needs to be dynamic but instead will give aid to the player in some ways or the other

Escape = Just send player back to the world_map for now.
*/
switch(state)
{
	case player_state.attack:
	{
		//checking if the player isnt targetting anyone
		if(player_target != noone)
		{
			//sprite_index = Battle_Shoot
			image_speed = 0.9
			image_index = 1
			var temp_struct = { this_sprite : Muzzle_1 }
			instance_create_layer(x - 100,y - (sprite_height / 2), "Instances", obj_muzzleeffect, temp_struct)
			basic_shot(id, player_target, Bullet_1, true, Impact_1)		
			//need to reset target to prevent target choice to be rolled over.
			player_target = noone
			audio_play_sound(snd_attack,1,0)
			my_turn = false
			
		}
		else
		{
			sprite_index = Battle_Shoot
			image_index = 0
			
		}
	}
	break;
	case player_state.skill:
		if(player_target != noone)
		{
			if(skill_perf != noone)
			{
				if(skill_perf == burst_shot)
				{
					if(fire_now)
					{
						fire_now = false;
						alarm[0] = 0.05 * room_speed;
						burst_count++
						image_speed = 0.9
						var temp_struct = { this_sprite : Muzzle_6 }
						instance_create_layer(x - 100,y - (sprite_height / 2), "Instances", obj_muzzleeffect, temp_struct)
						if(burst_count > 3)
						{
							image_index = 0;
							script_execute(skill_perf, id, player_target, Bullet_6, true, Impact_6 )
							player_target = noone
							audio_play_sound(snd_burstshot,1,0)
							my_turn = false
							skill_perf = noone
							burst_count = 0
						}
						else
						{
							script_execute(skill_perf, id, player_target, Bullet_6, false, Impact_6 )
						}
					
					}
				}
				else if(skill_perf == grenade_toss)
				{
						script_execute(skill_perf, id, player_target, Bullet_4, true, Impact_3)
						for(var j = 0; j < ds_list_size(global.player_inv); j++)
						{
							var item = ds_list_find_value(global.player_inv, j)
							if(item.my_name == "Grenade")
							{
								item.my_total--;
								if(item.my_total <= 0)
									ds_list_delete(global.player_inv, j)
							}
						}
						player_target = noone
						my_turn = false
						skill_perf = noone
				}
				else if(skill_perf == charge_shot)
				{
					if(charging && charging_length <= 0)
					{
						var temp_struct = { this_sprite : Muzzle_7 }
						instance_create_layer(x - 100,y - (sprite_height / 2), "Instances", obj_muzzleeffect, temp_struct)
						script_execute(skill_perf, id, player_target, Bullet_7, true, Impact_7)
						player_target = noone
						charge_enemy = noone
						charging = false
						my_turn = false
						skill_perf = noone
					}
					else
					{
						if(!charging)
						{
							charging = true
							charging_length = 2;
							var temp_struct = { parent : id }
							instance_create_layer(x - (40 * image_xscale), y, "Instances", obj_chargingEffect, temp_struct)
							charge_enemy = player_target
							state = player_state.charging;
						}
						
					}
					
				}
				else
				{
						script_execute(skill_perf, id, player_target, Bullet_1, true )
						player_target = noone
						my_turn = false
						skill_perf = noone
				}
			}
			
		}
	break;
	case player_state.charging:
	{
		if(charging)
		{
			image_speed = 0.9
			sprite_index = Battle_Charge
			charging_length--
			var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
			text_box.msg = my_name + " is charging an attack"
			my_turn = false;
			obj_BattleManager.next_turn = true
			obj_BattleManager.process_next_turn = true
			
		}
	}	
	break;
	case player_state.defend:
		//defense_up = true
		defense_reduction *= 2;
		turn_length = 1;
		my_turn = false;
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true
	break;
	case player_state.item:
		if(item_perf != noone)
		{
			item_execute(item_perf)
			player_target = noone
			my_turn = false
			item_perf = noone
			obj_BattleManager.next_turn = true;
			obj_BattleManager.process_next_turn = true;
		}
	break;
	case player_state.escape:
		if(chance_hit(50))
			obj_BattleManager.state = battle_states.escaped
	break;

}

//for testing purposes
if(keyboard_check_pressed(vk_space))
{
	if(fire_rate > 0.1)
	{
		fire_rate -= 0.1;
	}
}
