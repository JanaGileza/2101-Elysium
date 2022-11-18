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

//making sure that we are not in the Battle_Room before entering, prevents calling upon deleted objects
if(room != Battle_Room)
{
	if(enter_point)
	{
		if(current_point.is_battle)
		{
			room_goto(Battle_Room)
		}
	}
}
		





