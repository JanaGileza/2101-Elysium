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
	script_execute(ds_grid)	
}

if(enter_point)
{
	changing_room = true
//making sure that we are not in the Battle_Room before entering, prevents calling upon deleted objects
	if(goto_point == Battle_Room)
	{
			if(current_point.is_battle)
			{
				saved_point = current_point
				enter_point = false
				room_goto(goto_point)
			}
		
	}
	else if(goto_point == First_Playable_Town)
	{
				saved_point = current_point
				enter_point = false
				room_goto(goto_point)
	}
	else
	{
		room_goto(goto_point)
	}
	

}
		





