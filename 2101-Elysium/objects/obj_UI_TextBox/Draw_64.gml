/// @description Insert description here
// You can write your code in this editor

var pnt = msg_list[| msg_ID]

//var my_name = pnt[msg_states.NAME]
//var my_pic = pnt[msg_states.IMAGE]

draw_set_font(this_font)

scr_nine_slice(x,y,width,height,spr_text_box, 0)

prev_h = draw_get_halign()
prev_v = draw_get_valign()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var draw_x = (x + width/2) //+ gui_padding
var draw_y = (y + height/6.5)  + gui_padding

//if(sprite_exists(my_pic))
//{
//	var pic_width = sprite_get_width(my_pic)
//	var pic_height = sprite_get_height(my_pic)
//	var draw_XW = draw_x + pic_width
//	var draw_YH = draw_y + pic_height
//	draw_sprite(my_pic, 0 , draw_XW / 2, draw_YH / 2 )
	
//	draw_x += pic_width + gui_padding;
//}

//draw_text_color(c_white)

draw_maxW = width - (draw_x + gui_padding);

draw_text_ext(draw_x, draw_y, msg, -1, draw_maxW)
draw_text_ext(draw_x, draw_y + 50, "Press a Key To Continue", -1, draw_maxW)


draw_set_halign(prev_h)
draw_set_valign(prev_v)





