// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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

function create_main_buttons()
{
	button_struct(128, 640, 0, false, "Attack", player_state.attack, false,0)
	button_struct(448, 640, 0, false, "Defend", player_state.defend, false,0)
	button_struct(128, 768, 0, false, "Skill", player_state.skill, false,0)
	button_struct(448, 758, 0, false, "Item", player_state.item, false,0)
	button_struct(288, 864, 0, false, "Escape", player_state.escape, false,0)
}

function create_sub_buttons(amount, text, state)
{	
	next_pos = 0
	for(i = 0; i < amount; i++)
	{
		next_pos = 75 * i
		button_struct(288, 650 + next_pos, 0, false, text, state, true, i)
	}
	
 button_struct(288, 650 + (75 * amount), 0, false, "Cancel", CANCEL_SELECT, true, 0)

	
}
function destroy_buttons()
{
	with(obj_button)
		instance_destroy()
}
