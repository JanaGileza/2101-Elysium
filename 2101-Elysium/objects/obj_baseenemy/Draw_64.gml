/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_text(x - 50, y -150, "Hp: " + string(hp));

if(global.debug)
{
	
	
	draw_text(x - 50, y - 240, "Max attack: " + string(base_damage))
	draw_text(x - 50, y - 220, " Min Attack: " + string(min_damage))
	
	if(str_buffed)
	{
		draw_text(x - 50, y - 200, "Buffed Strength")
		draw_text(x - 100, y - 200, string(a_add))
	}
	if(def_buffed)
	{
		draw_text(x - 50, y - 180, "Buffed Defense")
		draw_text(x - 100, y - 180, string(d_add))
	}
	//draw_text(x - 50, y -125, "Stamina: " + string(stamina));

	if(my_turn)
		draw_text(x - 50, y -110, "my turn");
}
draw_set_color(c_white)	
//draw_text(x - 50, y -100, timer);

