/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("1")))
{
	state = battle_states.win
}

switch(state)
{
	case battle_states.start:
	{
		enemy_count = irandom_range(1,3)
		saved_enemy_count = enemy_count
		
		for(i = 0; i < instance_number(obj_Position); i++)
		{
			show_debug_message(enemy_count)
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
		//temp_p = ds_priority_create()
		for(i = 0; i < instance_number(obj_BaseBattle); i++)
		{
			var inst = instance_find(obj_BaseBattle, i)
			ds_priority_add(turn_order, inst, inst.move_speed)
		}	
	}
	else
	{
		obj_turn = ds_priority_find_max(turn_order)
		ds_priority_delete_max(turn_order)
		
		if(obj_turn.object_index == obj_protoplayer)
			state = battle_states.player_turn
		else
			state = battle_states.enemy_turn
	}
	break;
	
	case battle_states.player_turn:
	if(instance_exists(obj_protoplayer))
	{

			if(next_turn && !obj_turn.my_turn)
			{
				next_turn = false;
				obj_turn.my_turn = true;
				obj_turn.player_target = noone
				//alarm[0] = 2 * room_speed
			}
			else
			{
				state = battle_states.calculate
			}
			
			
		
	}
	//else
	//	state = battle_states.calculate;
	break;
	
	case battle_states.enemy_turn:
	if(instance_exists(obj_baseenemy))
	{

		if(next_turn)
		{
			next_turn = false;
			obj_turn.my_turn = true;
			alarm[0] = 2 * room_speed
		}
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
		
		
			//state = battle_states.idle
		}
	break;
	
	case battle_states.win:
		draw_text(surface_get_width(application_surface) / 2, 10, "Player Wins!")
		obj_GameManager.battle_concluded = true
		room_goto(World_Map)
	break;
	
	case battle_states.lose:
	
		draw_text(surface_get_width(application_surface) / 2, 10, "Player Lost!")
	break;
}



