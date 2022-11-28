/// @description Insert description here
// You can write your code in this editor


/*check if a button been pressed and if its the player turn, no need for it to be constantly on screen
will eventually create a state machine for it
*/

if(!obj_protoplayer.my_turn)
	reset_UI_Box()
if(button_pressed && obj_protoplayer.my_turn)
{
	create_once = false
	
	if(main_needed)
	{
		destroy_buttons()
		create_main_buttons()
		button_pressed = false
		main_needed = false;
	}

		
	switch(obj_protoplayer.state)
	{
		case player_state.idle:
			reset_UI_Box()
		break;
		case player_state.attack:
			image_xscale = 4
			image_yscale = 4.5
			y = origin_y + 30
			sub_needed = true
			amount = obj_BattleManager.saved_enemy_count
			s_state = ENEMY_SELECT
			ds_list_clear(sub_list)
			for(i = 0; i < instance_number(obj_baseenemy); i++)
			{
				ds_list_add(sub_list, instance_find(obj_baseenemy, i))
			}
			
		break;
		case player_state.skill:
			image_xscale = 4
			image_yscale = 4.5
			y = origin_y + 30
			sub_needed = true
			amount = ds_list_size(obj_GameManager.player_skills)
			s_state = SKILL_SELECT
			ds_list_copy(sub_list, obj_GameManager.player_skills)	
			check_sub_options = true
		break;
		case player_state.item:
			image_xscale = 4
			image_yscale = 4.5
			y = origin_y + 30
			sub_needed = true
			amount = ds_list_size(global.player_inv)
			s_state = ITEM_SELECT
			ds_list_copy(sub_list, global.player_inv)	
			check_sub_options = true	
		break
		
	}
	
	if(sub_needed)
	{
		destroy_buttons()
		main_needed = false
		button_pressed = false
		sub_needed = false
		create_sub_buttons(sub_list, s_state)
	}

}

