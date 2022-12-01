/// @description Insert description here
// You can write your code in this editor
enum msg_states
{
	TEXT,
	NAME,
	IMAGE
}


msg_list = ds_list_create()
msg_ID = 0;
msg = ""
msg_char = 0
msg_speed = 1;

depth = -100

var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

height = floor(gui_height * 0.45) / 2;
width = gui_width / 2;

gui_padding = 5

//if(instance_exists(obj_UI_TextBox))
//	instance_destroy()





