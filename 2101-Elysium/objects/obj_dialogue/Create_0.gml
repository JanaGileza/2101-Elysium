/// @description Insert description here
// You can write your code in this editor

//text[0] = "hello world";
//text[1] = "the fitness gram pacer test is a multi-stage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in-";

//tells gamemaker what the current text arr pos is
//text_current = 0;

//tells gamemaker what the last arr pos is
//text_last = 1;

//max width that the text will be before wrapping to new line
//text_width = 250;
state = global.gameState
//x pos for where text will be in room
text_x = (global.surface_width / 2);


//y pos for where text will be in room
text_y = (global.surface_height / 2) - 100;


//used to control character being drawn and at what speed
char_current = 1;
char_speed = 0.5;


text = receive_text(state)
//text_wrapped = string_wrap(text, text_width)
//text[text_current] = string_wrap(text[text_current], text_width);


//var _len = string_length(text[text_current]);
//if (char_current < _len) {
//	char_current += char_speed;
//}

//var _str = string_copy(text[text_current], 1, char_current);
//draw_text(text_x, text_y, _str);


