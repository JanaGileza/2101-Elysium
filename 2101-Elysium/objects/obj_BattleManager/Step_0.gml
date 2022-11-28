/// @description Insert description here
// You can write your code in this editor

//testing purposes for when the player wins and lose
if(keyboard_check(ord("1")))
{
	state = battle_states.win
}
if(keyboard_check(ord("2")))
{
	state = battle_states.lose
}

if(wait)
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
		enemy_count = irandom_range(1,3)
		saved_enemy_count = enemy_count
		
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
					if(enemy_count > 0)
					{
						instance_create_layer(spot_check.x, spot_check.y,"Instances", obj_baseenemy)
						spot_check.spot_filled = true;
						enemy_count--
					}
					else
						break;
				}
			}
		}
		state = battle_states.idle;
	}
	obj_turn = (obj_protoplayer.move_speed > obj_baseenemy.move_speed) ? obj_protoplayer : obj_baseenemy;
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
			if(keyboard_check(vk_enter))
			{
				instance_destroy(obj_UI_TextBox)
			}
			else
				exit;
		}
		obj_turn = ds_priority_find_max(turn_order)
		ds_priority_delete_max(turn_order)
		
		if(!instance_exists(obj_turn))
			break;
		
		
		//if(instance_exists(obj_UI_TextBox))
		//{
		//		wait = true
		//		alarm[11] = 3 * room_speed
		//		//instance_destroy(obj_UI_TextBox)
		//}
		
	
		
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
				obj_turn.state = player_state.idle
				destroy_buttons()
				create_main_buttons()
				
			}
			
			if(create_once)
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
			if(check_player.hp < 0)
				state = battle_states.lose
			else
				state = battle_states.idle
		
			process_next_turn = false
			//state = battle_states.idle
		}
	break;
	
	case battle_states.win:
		draw_text(surface_get_width(application_surface) / 2, 10, "Player Wins!")
		obj_GameManager.battle_concluded = true
		obj_GameManager.goto_point = First_Playable_World
		obj_GameManager.enter_point = true
	break;
	
	case battle_states.lose:
	
		draw_text(surface_get_width(application_surface) / 2, 10, "Player Lost!")
		obj_GameManager.battle_concluded = true
		obj_GameManager.goto_point = First_Playable_World
		obj_GameManager.player_loss = true
		obj_GameManager.enter_point = true
	break;
	case battle_states.escaped:
		obj_GameManager.battle_concluded = true
		obj_GameManager.goto_point = First_Playable_World
		obj_GameManager.enter_point = true
	break;
}



