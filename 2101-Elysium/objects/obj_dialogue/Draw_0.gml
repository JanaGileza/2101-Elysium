/// @description Insert description here
// You can write your code in this editor

if(global.changing)
	exit;
//draw_set_font(fnt_dialogue);
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_set_color(c_green);

draw_set_font(fnt_dialogue);
draw_set_color(c_green);
draw_set_halign(fa_center);
draw_set_valign(fa_center);



var _len = string_length(text);
if (char_current < _len) {
	char_current += char_speed;
}

var _str = string_copy(text, 1, char_current);

draw_text_ext(text_x, text_y, _str, 32, 1000);
