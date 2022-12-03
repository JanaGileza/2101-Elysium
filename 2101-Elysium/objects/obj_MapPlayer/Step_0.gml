/// @description Functionality of the player in the open world
// You can write your code in this editor

/*the player should not move when choosing the next destination, so we can prevent them creating
	unwanted routes lol
*/

//if(!place_meeting(x,y, obj_MapPlayer))
//	interact = false
if(!moving)
{
	if(keyboard_check(ord("D")))
	{
		prev_x = move_x
		move_x++;
		moving = true;
		h = true
		image_xscale = 1;
		
	}
	
	if(keyboard_check(ord("A")))
	{
		prev_x = move_x
		move_x--;
		moving = true;
		h = true
		image_xscale = -1
	}
	

	if(keyboard_check(ord("W")))
	{
		prev_y = move_y
		move_y--;
		moving = true;
		v = true
	}

	if(keyboard_check(ord("S")))
	{
		prev_y = move_y
		move_y++;
		moving = true;
		v = true
	}
	
	if(keyboard_check(vk_enter) && !global.changing)
	{
		instance_create_layer(x,y, "Buttons", obj_UI_Menu_Box)
	}
}

/*
	 if the player is ready to move, get the destination and save it for other purposes
	 
*/
if(moving)
{
	path = path_add()

	for( i = 0; i < ds_list_size(global.TotalMap); i++)
	{
		point = ds_list_find_value(global.TotalMap, i);
		
		if(move_x == point.map_x && move_y == point.map_y)
		{
			if(mp_grid_path(global.grid, path, x,y, point.x, point.y, 1))
			{
				move_x = point.map_x
				move_y = point.map_y
				path_found = true
				obj_GameManager.current_point = point
				path_start(path, 5,  0, false)
				break
			}
		}
	}
	
	//if path was not found, revert search variables back to prevent skipping points
	if(!path_found)
	{
		if(h)
			move_x = prev_x
		if(v)
			move_y = prev_y
	}
	
	//resetting everything once the route is completed
	if(path_index == -1)
	{
		moving = false
		path_found = false
		h = false
		v = false

	}
	
}



