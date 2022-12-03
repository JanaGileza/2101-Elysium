/// @description Insert description here
// You can write your code in this editor
//room_goto(World_)
draw_set_font(Text_Box_Battle)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if(global.gameWon || global.gameLost)
{
	game_restart()
	start_transition(Title_Screen, seq_fadein, seq_fadeout)
	
}
else
	start_transition(World_Map, seq_fadein, seq_fadeout)

