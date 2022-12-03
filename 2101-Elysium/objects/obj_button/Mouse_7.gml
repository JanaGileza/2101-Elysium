/// @description Insert description here
// You can write your code in this editor

/*if the left mouse button is released and over the button, the interaction is finalized and feeds
information to the necessary components (still working on)*/
if(room == Battle_Room || room == Boss_Battle_Room)
{
	if(position_meeting(mouse_x, mouse_y, id))
	{
		if(is_sub)
		{
			switch(state)
			{
				case CANCEL_SELECT:
					if(obj_protoplayer.skill_perf != noone)
					{
						obj_protoplayer.mana += global.mana_cost
						obj_protoplayer.skill_perf = noone
					}
					obj_protoplayer.state = player_state.idle
					obj_protoplayer.sprite_index = Battle_Idle
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
					global.mana_cost = ds_list_find_value(obj_GameManager.player_skills, pos).my_cost
					if(obj_protoplayer.mana >= mana_cost)
					{
						obj_protoplayer.mana -= global.mana_cost
						//obj_protoplayer.player_target = instance_find(obj_baseenemy, pos)
						obj_protoplayer.skill_perf = ds_list_find_value(obj_GameManager.player_skills, pos).scr_per
						obj_UI_Box.button_pressed = true
						obj_UI_Box.create_once = true
						if(obj_UI_Box.check_sub_options)
							obj_protoplayer.state = player_state.attack
					}
					else
					{
						global.mana_cost = 0
						var text_box = instance_create_layer(surface_get_width(application_surface) / 2, surface_get_height(application_surface) / 2, "Instances",obj_UI_TextBox)
						text_box.msg = "Not enough MP"
						text_box.is_error = true
					}
				}
				break;
				case ITEM_SELECT:
				{
					
					obj_protoplayer.item_perf = ds_list_find_value(global.player_inv, pos)
					obj_UI_Box.button_pressed = true;
					obj_UI_Box.create_once = true;
					if(ds_list_find_value(global.player_inv,pos).my_name == "Grenade")
					{
						obj_protoplayer.state = player_state.skill
						//obj_protoplayer.skill_perf = grenade_toss
					}
					else
					{
						ds_list_find_value(global.player_inv, pos).my_total--;
						if(ds_list_find_value(global.player_inv,pos).my_total <= 0)
							ds_list_delete(global.player_inv,pos)
					}
					
				}
				break
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
else if(room == World_Map)
{
	if(position_meeting(mouse_x, mouse_y, id))
	{
		obj_UI_Menu_Box.decision_made = pos
		obj_UI_Menu_Box.button_pressed = true
	}
	
	pressed = false
}





