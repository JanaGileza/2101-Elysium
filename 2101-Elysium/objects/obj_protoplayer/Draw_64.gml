/// @description drawing stats for debug purposes
// You can write your code in this editor

draw_text(x - 50, y -200, "Level: " + string(global.player_level));
draw_text(x - 50, y -180, "Hp: " + string(hp));
draw_text(x - 50, y -150, "Mp: " + string(mana))
draw_text(x - 50, y -130, "State: " + string(state));
//draw_text(x - 50, y -130, "FireRate: " + string(fire_rate));
if(my_turn)
	draw_text(x - 50, y -100, "my turn");

draw_path(Path1, x, y, true)
