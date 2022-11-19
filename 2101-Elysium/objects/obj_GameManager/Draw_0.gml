/// @description Insert description here
// You can write your code in this editor

//drawing to show inventory right now

for(i = 0; i <ds_list_size(global.player_inv); i++) 
{
	draw_text(player.x, player.y + (i * 30), global.player_inv[| i]);
}




