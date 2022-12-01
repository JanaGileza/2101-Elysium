/// @description Insert description here
// You can write your code in this editor
if(obj_GameManager.current_point == noone)
	exit;
if(interact)
{
	if(!obj_MapPlayer.moving)
		if(obj_GameManager.current_point.is_battle || obj_GameManager.current_point.is_boss_battle 
		|| obj_GameManager.current_point.is_merchant)
			draw_text(x, y - 30, "Press Enter to interact")		
}


