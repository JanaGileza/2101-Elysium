/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_text(x - 50, y -150, "Hp: " + string(hp));
//draw_text(x - 50, y -125, "Stamina: " + string(stamina));

if(my_turn)
	draw_text(x - 50, y -110, "my turn");
draw_set_color(c_white)	
//draw_text(x - 50, y -100, timer);

