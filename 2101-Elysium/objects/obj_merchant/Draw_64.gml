/// @description Insert description here
// You can write your code in this editor
if(!is_open)
	exit;
	
draw_set_color(c_black)
draw_set_alpha(0.8)
draw_rectangle(0,0,g_width,g_height,0)
draw_set_alpha(0.5)
draw_rectangle(m_marge, 0, m_marge + m_width, g_height, 0)
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
	
	draw_text_transformed(_x,_y, item, 1, 1, 0)
}





