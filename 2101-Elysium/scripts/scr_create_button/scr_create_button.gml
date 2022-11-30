// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//the constructor for buttons
function button_struct(_x, _y,_room, _pressed, _text, _state, _is_sub, _pos) constructor{
	temp_struct = 
	{
		linked_room : _room,
		pressed : _pressed,
		text : _text,
		state : _state,
		is_sub : _is_sub,
		pos : _pos
	}
	instance_create_layer(_x, _y, "Buttons", obj_button, temp_struct)
}

//create the main menu for the player turn in battle
function create_main_buttons()
{
	button_struct(128, 640, 0, false, "Attack", player_state.attack, false,0)
	button_struct(448, 640, 0, false, "Defend", player_state.defend, false,0)
	button_struct(128, 768, 0, false, "Skill", player_state.skill, false,0)
	button_struct(448, 758, 0, false, "Item", player_state.item, false,0)
	button_struct(288, 864, 0, false, "Escape", player_state.escape, false,0)
}

//used for choosing targets, skills, items
function create_sub_buttons(list, state)
{	
	next_pos = 0
	amount = ds_list_size(list)
	for(i = 0; i < amount; i++)
	{
		var has_grenades = false
		next_pos = 75 * i
		if(obj_protoplayer.state == player_state.item)
			button_struct(288, 650 + next_pos, 0, false, string(ds_list_find_value(list, i).my_name) + " x " + string(ds_list_find_value(list,i).my_total), state, true, i)
		else
		{
			if(ds_list_find_value(list, i).my_name == "Grenade Toss")
			{
				
				for(var j = 0; j < ds_list_size(global.player_inv); j++)
				{
					var item = ds_list_find_value(global.player_inv, j)
					
					if(item.my_name == "Grenade")
					{
						has_grenades = true
						break;
					}
				}
				if(has_grenades)
					button_struct(288, 650 + next_pos, 0, false, string(ds_list_find_value(list, i).my_name), state, true, i)
			}
			else
				button_struct(288, 650 + next_pos, 0, false, string(ds_list_find_value(list, i).my_name), state, true, i)
		}
		
	}
	
 button_struct(288, 650 + (75 * amount), 0, false, "Cancel", CANCEL_SELECT, true, 0)

	
}


//this creates the decision buttons in the world map, to see if the player wants to enter battle or town
function create_world_decision_buttons(_x,_y)
{
	button_struct(_x, _y, 0, false, "Yes", CANCEL_SELECT, false, 0)
	button_struct(_x + 200,_y,0, false, "No", CANCEL_SELECT, false, 1)

}

//destroy the buttons once done
function destroy_buttons()
{
	with(obj_button)
		instance_destroy()
}
