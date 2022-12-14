/// @description Main, contains player state machine
// You can write your code in this editor

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
switch(state)
{
	case player_state.attack:
	{
		//checking if the player isnt targetting anyone
		if(player_target != noone)
		{

				
			basic_shot(id, player_target, Bullet_1, true)
			
			//need to reset target to prevent target choice to be rolled over.
			player_target = noone
			my_turn = false
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
						if(burst_count > 3)
						{
							script_execute(skill_perf, id, player_target, Bullet_1, true )
							player_target = noone
							my_turn = false
							skill_perf = noone
							burst_count = 0
						}
						else
						{
							script_execute(skill_perf, id, player_target, Bullet_1, false )
							
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
