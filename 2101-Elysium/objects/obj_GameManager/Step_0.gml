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
	global.player_exp++
	
	if(global.player_exp >= global.player_exp_needed)
		level_up()
}

if(player_loss)
{
	room_goto(lose_room)
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
				room_goto(goto_point)
			}
			
			if(current_point.is_boss_battle)
			{
				boss_started = true
				saved_point = current_point
				enter_point = false
				player = obj_protoplayer
				multi = saved_point.map_x
				room_goto(goto_point)
			}
		
	}
	else if(goto_point == Town_Map)
	{
				saved_point = current_point
				enter_point = false
				player = obj_TownPlayer
				room_goto(goto_point)
	}
	else
	{
		player = obj_MapPlayer
		room_goto(goto_point)
	}
	

}
		





