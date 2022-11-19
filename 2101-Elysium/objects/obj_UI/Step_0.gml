/// @description Insert description here
// You can write your code in this editor

ui_health = obj_GameManager.players_current_hp
ui_money = obj_GameManager.player_money

if(instance_exists(obj_MapPlayer))
	if(!obj_MapPlayer.moving)
		ui_coords = "( " + string(obj_GameManager.current_point.map_x) + ", " +  string(obj_GameManager.current_point.map_y) + " )"




