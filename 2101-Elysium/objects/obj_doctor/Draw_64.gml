/// @description Insert description here
// You can write your code in this editor

if(obj_TownPlayer.interact && near_player)
{
	var g_width = display_get_gui_width()
	var g_height = display_get_gui_height()
	
	var cam_x = camera_get_view_x(view_camera[0])
	var cam_y = camera_get_view_y(view_camera[0])
	
	var _width = camera_get_view_width(view_camera[0])
	var _height = camera_get_view_height(view_camera[0])
	
	var text_x = (x - cam_x) * (g_width / _width)
	var text_y = (y - cam_y) * (g_height / _height)
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_middle)
	draw_text(text_x, text_y - (sprite_height + 40), "Press E to interact")
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

}

if(!is_open)
	exit;
	
draw_set_color(c_black)
draw_set_alpha(0.8)
draw_rectangle(0,0,g_width,g_height,0)
draw_set_alpha(0.5)
draw_rectangle(m_marge, 0, m_marge + m_width, g_height, 0)
draw_rectangle(m_marge, 0, m_width, g_height/ 2, 0)
draw_set_alpha(1)
draw_set_color(c_white);


for(i = 0; i < item_num; i++)
{
	var item_slot = ds_list_find_value(items, i)
	var item = item_slot.my_name;
	
	_x = m_marge + m_width/2;
	_y = (g_height/2) + (i-selected)*32;
	

		
	if(i == selected)
		item =  string(item) + " <"
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_text_transformed(_x,_y, item, 1, 1, 0)

	draw_sprite(item_slot.my_sprite, 0, _x - 150, _y - 10)
	draw_set_valign(fa_left)
	draw_set_valign(fa_left)
}


var inv = items[| selected];

var _x = (m_marge + m_width) + preview / 2
var _y = (g_height / 2)


draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(_x,_y - 200, inv.my_desc)
draw_set_valign(fa_top)
draw_set_valign(fa_left)

if(sprite_exists(spr_healer_display))
{
	var scaling = 3;
	
	draw_sprite_ext(spr_healer_display, 0, _x ,_y - 24, scaling * -1, scaling, 0, -1, 1)
}


draw_set_valign(fa_bottom)
draw_text(_x - 300, _y + 200, "Credits: " + string(global.player_money));
draw_text(_x - 150, _y + 200, "Price: " + string(inv.my_cost));

draw_set_halign(fa_right)
draw_text(_x + 300, _y + 200, "Press Enter to purchase");

draw_set_valign(fa_top)
draw_set_halign(fa_left)
