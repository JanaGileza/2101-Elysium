/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button(mb_left))
{
	part_particles_create(global.particle_system, mouse_x, mouse_y, global.ptBasic, 1)
}
//testing purposes for when the player wins and lose
if(keyboard_check(ord("1")))
{
	state = battle_states.win
}
if(keyboard_check(ord("2")))
{
	state = battle_states.lose
}

if(transition)
{
	
	obj_GameManager.battle_concluded = true
	obj_GameManager.goto_point = World_Map
	obj_GameManager.enter_point = true
}

if(wait && state != battle_states.win)
	exit;
/////////////////////////////////////////////

/*the central core for the battle, it keeps tracks and changes the state of the battle
  start - instantiates everything for the battle, its only called once
  
  idle - despite its being called idle, it checks the priority queue and refills it if needed
  after checking it will tell the next obj that its their turn
  
  player_turn - it tells the player is their turn and halts battle progress until the player
  completes their turn
  
  enemy_turn - same as player but faster because of the choice speed
  
  calculate - checks the state of the battle, if there are no more enemies it will declare the player 
  the winner, the opposite will happen if the player hp is 0 or less
  
  win - declares the player the winner (will need to display graphics to further show, will add rewards
  screen soon)
  
  lose - declares the player the loser (will need to display graphics to further show)*/
switch(state)
{
	case battle_states.start:
	{
		if(obj_GameManager.boss_started)
		{
			enemy_count = 3
			saved_enemy_count = enemy_count
		}
		else
		{
			enemy_count = irandom_range(1, 3)
			saved_enemy_count = enemy_count
		}
		
		for(i = 0; i < instance_number(obj_Position); i++)
		{
			//show_debug_message(enemy_count)
			spot_check = instance_find(obj_Position, i).id
			if(spot_check.type == "player" && !spot_check.spot_filled)
			{
				instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_protoplayer)
				spot_check.spot_filled = true;
			}
			else
			{
				if(spot_check.type == "enemy" && !spot_check.spot_filled)
				{
					if(obj_GameManager.boss_started)
					{
						if(enemy_count > 0)
						{
							var randomEnemy = -1
							if(instance_exists(obj_bossenemy))
							{
									randomEnemy = 3;
								
								if(instance_exists(obj_healerenemy))
								{
									randomEnemy = 2;
								}
							}
							else
								randomEnemy = 1;
						
							var enemy = noone
							if(randomEnemy == 1)
								enemy = instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_bossenemy)
						
							if(randomEnemy == 2)
								enemy = instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_bufferenemy)
						
							if(randomEnemy == 3)
								enemy = instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_healerenemy)
						
							ds_list_add(enemy_list, enemy)
							spot_check.spot_filled = true;
							enemy_count--
						}
							
					}
					else if(obj_GameManager.start_battle)
					{
						if(enemy_count > 0)
						{
							var randomEnemy = -1;
							var healerChance = 10 * obj_GameManager.multi;
							var bufferChance = 10 * obj_GameManager.multi;
						
							if(instance_exists(obj_attackenemy))
							{
								if(chance_hit(healerChance))
								{
									randomEnemy = 3;
								}
								else if(chance_hit(bufferChance))
								{
									randomEnemy = 2;
								}
								else
									randomEnemy = 1;
							}
							else
								randomEnemy = 1;
						
							var enemy = noone
							if(randomEnemy == 1)
								enemy = instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_attackenemy)
						
							if(randomEnemy == 2)
								enemy = instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_bufferenemy)
						
							if(randomEnemy == 3)
								enemy = instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_healerenemy)
						
							ds_list_add(enemy_list, enemy)
							spot_check.spot_filled = true;
							enemy_count--
						}
					}
					else
						break;
				}
			}
		}
		
		state = battle_states.idle;
		//obj_turn = (obj_protoplayer.move_speed > obj_baseenemy.move_speed) ? obj_protoplayer : obj_baseenemy;
	}
		
	
	break;
	
	case battle_states.idle:
		
	if(ds_priority_empty(turn_order))
	{
		for(i = 0; i < instance_number(obj_BaseBattle); i++)
		{
			var inst = instance_find(obj_BaseBattle, i)
			ds_priority_add(turn_order, inst, inst.move_speed)
		}	
	}
	else
	{
		
		if(instance_exists(obj_UI_TextBox))
		{
			if(keyboard_check(vk_anykey))
			{
				wait = true
				alarm[11] = 0.5 * room_speed
			}
			else
				exit;
		}
		
		obj_turn = ds_priority_find_max(turn_order)
		ds_priority_delete_max(turn_order)
		
		if(!instance_exists(obj_turn))
			break;
		

		if(obj_turn.object_index == obj_protoplayer)
		{
			state = battle_states.player_turn
			create_once = true
		}
		else
			state = battle_states.enemy_turn
	}
	break;
	case battle_states.player_turn:
	if(instance_exists(obj_protoplayer))
	{
		if(process_next_turn)
		{
				state = battle_states.calculate	
				break;
		}

			if(next_turn && !obj_turn.my_turn)
			{
				next_turn = false;
				obj_turn.my_turn = true;
				obj_turn.player_target = noone
				process_next_turn = false
				if(!obj_turn.charging)
				{
					obj_turn.state = player_state.idle
					destroy_buttons()
					create_main_buttons()
				}
				
			}
			
			if(create_once && !obj_turn.charging)
			{
				create_once = false
				instance_create_layer(obj_protoplayer.x + 40, obj_protoplayer.y + 275,"Buttons", obj_UI_Box)
			}
		
	}
	break;
	
	case battle_states.enemy_turn:
	if(instance_exists(obj_baseenemy))
	{
		if(process_next_turn )
		{
				state = battle_states.calculate	
				break;
		}
		
		if(next_turn && !obj_turn.my_turn)
		{
			next_turn = false;
			if(!obj_turn.my_turn)
			{
				obj_turn.my_turn = true;
			}
			process_next_turn = false;
			//alarm[0] = 2 * room_speed
		}
		
		if(process_next_turn)
			state = battle_states.calculate
					
		//show_message(obj_turn.name + "turn")
	}
	//else
	//	state = battle_states.calculate;
	break;
	
	case battle_states.calculate:
		var check_player = instance_find(obj_protoplayer, 0)
		var check_enemies = instance_number(obj_baseenemy)
		
		if(check_enemies <= 0)
		{
			state = battle_states.win
			
		}
		else
		{
			if(check_player.hp <= 0)
				state = battle_states.lose
			else
				state = battle_states.idle
		
			process_next_turn = false
			
			//state = battle_states.idle
		}
	break;
	
	case battle_states.win:
		if(!wait)
		{
			//if(!text_skip)
				wait = true;
			if(instance_exists(obj_protoplayer))
			{
				obj_GameManager.players_current_hp = obj_protoplayer.hp;
				obj_GameManager.players_current_mp = obj_protoplayer.mana
			}
			global.pausedScreen = sprite_create_from_surface(application_surface,0,0, global.surface_width, global.surface_height, false, true, 0, 0);
			//instance_deactivate_all(true)
			//instance_activate_object(obj_GameManager)
			lerp_exp = global.player_exp
			lerp_gold = global.gold_gained
			global.player_exp += global.exp_gained
			
		}
		
		if(text_box_delay)
		{
			if(!text_skip)
			{
				text_box_delay = false
				alarm[10] = 0.01 * room_speed
			}
			
			if(global.exp_gained > 0)
			{
				global.exp_gained--;
				lerp_exp++;
			}
			
			if(lerp_gold > 0)
			{
				global.player_money++;
				lerp_gold--;
			}
			
			
		}
		
		lerp_val = lerp(lerp_val, lerp_exp, 0.1)
		if(lerp_gold == 0 && global.exp_gained == 0)
		{
			if(keyboard_check(vk_anykey))
			{
				transition = true;
				text_skip = false;
				obj_GameManager.player_escaped = false;
				if(obj_GameManager.boss_started)
					global.gameWon = true;
			}
		}
	
	
			if(keyboard_check_pressed(vk_anykey))
			{
				text_skip = true
				wait = false;
				text_box_delay = true;
			}
			
		
	
	break;
	
	case battle_states.lose:
		draw_text(surface_get_width(application_surface) / 2, 10, "Player Lost!")
		obj_GameManager.battle_concluded = true
		obj_GameManager.goto_point = World_Map
		obj_GameManager.player_loss = true
		obj_GameManager.enter_point = true
		global.gameLost = true
	break;
	case battle_states.escaped:
			if(instance_exists(obj_protoplayer))
			{
				obj_GameManager.players_current_hp = obj_protoplayer.hp;
				obj_GameManager.players_current_mp = obj_protoplayer.mana
				
				if(obj_GameManager.boss_started)
					obj_GameManager.boss_started = false;
			}
		obj_GameManager.battle_concluded = true
		obj_GameManager.player_escaped = true
		obj_GameManager.goto_point = World_Map
		obj_GameManager.enter_point = true
	break;
}



