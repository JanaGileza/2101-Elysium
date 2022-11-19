/// @description Insert description here
// You can write your code in this editor

enum sub_state
{
	enemy_select,
	item_select,
	skill_select,
	cancel_select
}

#macro ENEMY_SELECT  6
#macro ITEM_SELECT  7
#macro SKILL_SELECT  8
#macro CANCEL_SELECT  9

base_scale_x = image_xscale
base_scale_y = image_yscale

origin_x = x
origin_y = y

main_list = ds_list_create()
sub_list = ds_list_create()

main_needed = true;
sub_needed = false;

sub_select = false

button_pressed = false
s_state = 0

create_main_buttons()
amount = 0;

check_sub_options = false

image_xscale = 6
image_yscale = 3.5

text = noone

create_once = false


function reset_UI_Box()
{
	image_xscale = 6
	image_yscale = 3.5
	x = origin_x
	y = origin_y
	main_needed = true
	sub_needed = false
	ds_list_clear(sub_list)
}


