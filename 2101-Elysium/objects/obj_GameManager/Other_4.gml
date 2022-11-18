/// @description Insert description here
// You can write your code in this editor

//if its the start of the game, create the player at the start of the first node only once. 
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


/*if the battle is over, set every completed node back to their completed states, set the current point
back to the correct point to traverse map properly and to make sure to place the player back to their original
position*/
if(changing_room)
{
	changing_room = false
	enter_point = false
	current_point = saved_point
	if(instance_exists(current_point))
	{
		if(battle_concluded)
		{
			battle_concluded = false
			current_point.battle_won = true
		}
		for(i = 0; i < ds_list_size(completed_points); i++)
			ds_list_find_value(completed_points, i).battle_won = true;
	
	

	
			ds_list_add(completed_points, current_point)
			move_pos = {move_x : current_point.map_x,
						 move_y : current_point.map_y}
			map_player = instance_create_layer(current_point.x, current_point.y, "Instances", obj_MapPlayer, move_pos)
			map_player.move_x = current_point.map_x
			map_player.move_y = current_point.map_y
	}
	
}

if(room == First_Playable_Town)
{
	
	if(instance_exists(obj_SpawnPoint))
	{
		instance_create_layer(obj_SpawnPoint.x, obj_SpawnPoint.y, "Instances", obj_TownPlayer)
	}
}

