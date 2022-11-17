/// @description Insert description here
// You can write your code in this editor



if(position_meeting(mouse_x, mouse_y, id))
{
	if(is_sub)
	{
		switch(state)
		{
			case CANCEL_SELECT:
				obj_protoplayer.state = player_state.idle
			break;
			case ENEMY_SELECT:
			{
				obj_protoplayer.player_target = instance_find(obj_baseenemy, pos)
			}
			break;
		}
			
	}
	else
	{
		obj_protoplayer.state = state
	}
	obj_UI_Box.button_pressed = true
	

}

pressed = false





