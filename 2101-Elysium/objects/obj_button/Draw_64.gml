/// @description Insert description here
// You can write your code in this editor

//only drawing when needed
if(room == Battle_Room || room == Boss_Battle_Room)
{
	if(obj_protoplayer.my_turn)
	{
		prev_h = draw_get_halign()
		prev_v = draw_get_valign()

		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(x + (sprite_width / 2), y + (sprite_height / 2), text)

		draw_set_halign(prev_h)
		draw_set_valign(prev_v)
	}
}
else if(room == World_Map)
{
		prev_h = draw_get_halign()
		prev_v = draw_get_valign()

		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(x + (sprite_width / 2), y + (sprite_height / 2), text)

		draw_set_halign(prev_h)
		draw_set_valign(prev_v)
}



