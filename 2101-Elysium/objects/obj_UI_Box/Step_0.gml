/// @description Insert description here
// You can write your code in this editor

if(button_pressed && obj_protoplayer.my_turn)
{
	if(main_needed)
	{
		destroy_buttons()
		main_needed = false;
		create_main_buttons()
		button_pressed = false
	}


	if(obj_protoplayer.state == player_state.idle)
	{
		reset_UI_Box()
		main_needed = true
	}

	if(obj_protoplayer.state == player_state.attack)
	{
			image_xscale = 4
			image_yscale = 4.5
			y = origin_y + 30
			sub_needed = true
			amount = obj_BattleManager.saved_enemy_count
			s_state = ENEMY_SELECT
	}

	if(sub_needed)
	{
		destroy_buttons()
		button_pressed = false
		sub_needed = false
		create_sub_buttons(amount, "test", s_state)
	
	}


}

