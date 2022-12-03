/// @description Insert description here
// You can write your code in this editor

//for debugging purposes for battle
if(keyboard_check(ord("3")))
{	
	saved_point = current_point
	room_goto(Battle_Room)
}

if(keyboard_check(ord("4")))
{
	global.player_exp += 10
	
	if(global.player_exp >= global.player_exp_needed)
		level_up()
}

if(player_loss)
{
	//room_goto(lose_room)
	start_transition(narration, seq_fadein, seq_fadeout)
	enter_point = false
	player_loss = false
}


if(enter_point)
{
	changing_room = true
//making sure that we are not in the Battle_Room before entering, prevents calling upon deleted objects
	if(goto_point == Battle_Room || goto_point == Boss_Battle_Room)
	{
			if(current_point.is_battle)
			{
				saved_point = current_point
				enter_point = false
				player = obj_protoplayer
				multi = saved_point.map_x
				start_battle = true
				//room_goto(goto_point)
				start_transition(goto_point, seq_fadein, seq_fadeout)
			}
			
			if(current_point.is_boss_battle)
			{
				boss_started = true
				saved_point = current_point
				enter_point = false
				player = obj_protoplayer
				multi = saved_point.map_x
				start_transition(goto_point, seq_fadein, seq_fadeout)
			}
		
	}
	else if(goto_point == Town_Map)
	{
				saved_point = current_point
				enter_point = false
				player = obj_TownPlayer
				start_transition(goto_point, seq_fadein, seq_fadeout)
	}
	else
	{
		if(global.gameLost)
		{
			start_transition(narration, seq_fadein, seq_fadeout)
		}
		else if(global.gameWon)
		{
			start_transition(narration, seq_fadein, seq_fadeout)
		}
		else
		{
			player = obj_MapPlayer
			start_transition(goto_point, seq_fadein, seq_fadeout)
		}
		
	}
	

}
		





