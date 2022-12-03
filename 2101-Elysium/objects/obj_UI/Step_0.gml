/// @description Insert description here
// You can write your code in this editor

ui_health = obj_GameManager.players_current_hp
ui_mp = obj_GameManager.players_current_mp
ui_money = global.player_money

if(room == World_Map)
	if(instance_exists(obj_MapPlayer) && obj_GameManager.current_point != noone)
		if(!obj_MapPlayer.moving)
			ui_coords = "( " + string(obj_GameManager.current_point.map_x) + ", " +  string(obj_GameManager.current_point.map_y) + " )"




