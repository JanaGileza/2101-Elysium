/// @description Insert description here
// You can write your code in this editor

/*if the left mouse button is released and over the button, the interaction is finalized and feeds
information to the necessary components (still working on)*/
if(room == Battle_Room)
{
	if(position_meeting(mouse_x, mouse_y, id))
	{
		if(is_sub)
		{
			switch(state)
			{
				case CANCEL_SELECT:
					obj_protoplayer.state = player_state.idle
					obj_UI_Box.button_pressed = true
				break;
				case ENEMY_SELECT:
				{
					if(obj_protoplayer.skill_perf != noone)
						obj_protoplayer.state = player_state.skill
					obj_protoplayer.player_target = instance_find(obj_baseenemy, pos)
					obj_UI_Box.button_pressed = true
					obj_UI_Box.create_once = true
				}
				break;
				case SKILL_SELECT:
				{
					//obj_protoplayer.player_target = instance_find(obj_baseenemy, pos)
					obj_protoplayer.skill_perf = ds_list_find_value(obj_GameManager.player_skills, pos).scr_per
					obj_UI_Box.button_pressed = true
					obj_UI_Box.create_once = true
					if(obj_UI_Box.check_sub_options)
						obj_protoplayer.state = player_state.attack
				}
				break;
			}
		}
		else
		{
			obj_protoplayer.state = state
			obj_UI_Box.button_pressed = true
		}
		

	}
	pressed = false
}
else if(room == First_Playable_World)
{
	if(position_meeting(mouse_x, mouse_y, id))
	{
		obj_UI_Menu_Box.decision_made = pos
		obj_UI_Menu_Box.button_pressed = true
	}
	
	pressed = false
}





