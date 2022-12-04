/// @description Insert description here
// You can write your code in this editor
prev_h = draw_get_halign()
prev_v = draw_get_valign()

draw_set_halign(fa_middle)
draw_set_valign(fa_center)
if(obj_GameManager.current_point.is_start)
		text = "This is the start"

if(obj_GameManager.current_point.is_battle)
		text = "Enter Battle?"

if(obj_GameManager.current_point.is_merchant)
		text = "Enter Town?"
		
if(obj_GameManager.current_point.is_boss_battle)
	text = "Challenge The Boss?"
		



draw_text(x -((sprite_width / 2) - 225) , y -  ((sprite_height / 2) - 40), text)

draw_set_halign(prev_h)
draw_set_valign(prev_v)