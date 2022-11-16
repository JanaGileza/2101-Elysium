/// @description Insert description here
// You can write your code in this editor

if(!moving)
{
	if(keyboard_check(ord("D")))
	{
		prev_x = move_x
		move_x++;
		moving = true;
		h = true
	}
	
	if(keyboard_check(ord("A")))
	{
		prev_x = move_x
		move_x--;
		moving = true;
		h = true
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
}
	
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
				path_start(path, 2,  0, false)
				break
			}
		}
	}
	
	if(!path_found)
	{
		if(h)
			move_x = prev_x
		if(v)
			move_y = prev_y
	}
	
	if(path_index == -1)
	{
		moving = false
		path_found = false
		h = false
		v = false

	}
	
}



