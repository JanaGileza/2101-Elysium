/// @description Insert description here
// You can write your code in this editor


player_money = 0

players_current_hp = 100

global.TotalMap = ds_list_create()
global.grid = mp_grid_create(0, 0, room_width / 32, room_height / 32, 32, 32);

//make sure to set keep track of all map points
with(obj_MapPoints)
{

	ds_list_add(global.TotalMap, id)
}

completed_points = ds_list_create()


gamestart = false
current_point = ds_list_find_value(global.TotalMap, 0)
start_battle = false
battle_concluded = false
saved_point = current_point
enter_point = false



