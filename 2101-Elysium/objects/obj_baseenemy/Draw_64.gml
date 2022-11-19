/// @description Insert description here
// You can write your code in this editor

draw_text(x - 50, y -150, "Hp: " + string(hp));
//draw_text(x - 50, y -125, "Stamina: " + string(stamina));

if(my_turn)
	draw_text(x - 50, y -110, "my turn");
	
draw_text(x - 50, y -100, timer);

