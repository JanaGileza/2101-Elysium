/// @description to draw the ui to the screen in the world map
// You can write your code in this editor
draw_set_color(c_white);
draw_text(50, 50, "Player Health: " + string(ui_health))
draw_text(350, 50, "Player MP: " + string(ui_mp))
draw_text(50, 150, "Player Money: " + string(ui_money))

if(room == World_Map)
	draw_text(350, 150, "Position: " + ui_coords)



