/// @description Insert description here
// You can write your code in this editor

if(gamestart)
{
	for(i = 0; i < ds_list_size(global.TotalMap); i++)
	{
		point = ds_list_find_value(global.TotalMap, i)
			if(point.map_x == 0 && point.map_y == 0)
			{
				instance_create_layer(point.x, point.y, "Instances", obj_MapPlayer)
				current_point = point.id;
				break;
			}
	}
	gamestart = false
}

if(battle_concluded)
{
	for(i = 0; i < ds_list_size(completed_points); i++)
		ds_list_find_value(completed_points, i).battle_won = true;
	battle_concluded = false
	current_point = saved_point
	current_point.battle_won = true
	ds_list_add(completed_points, current_point)
	move_pos = {move_x : current_point.map_x,
				 move_y : current_point.map_y}
	map_player = instance_create_layer(current_point.x, current_point.y, "Instances", obj_MapPlayer, move_pos)
	map_player.move_x = current_point.map_x
	map_player.move_y = current_point.map_y
	
}

