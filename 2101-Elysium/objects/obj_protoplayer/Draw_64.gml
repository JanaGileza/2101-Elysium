/// @description drawing stats for debug purposes
// You can write your code in this editor

draw_set_color(c_black)


draw_text(x - 50, y -170, "Hp: " + string(hp))
draw_text(x - 50, y -150, "Mp: " + string(mana))

if(global.debug)
{
	draw_text(x - 50, y -130, "State: " + string(state));
	draw_text(x - 50, y -130, "FireRate: " + string(fire_rate));
	if(my_turn)
		draw_text(x - 50, y -100, "my turn");
	draw_path(Path1, x, y, true)
}

draw_set_color(c_white)

//draw_path(Path1, x, y, true)
