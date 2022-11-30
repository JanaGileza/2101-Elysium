/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
//show_message(path_get_length(Path1))
x = parent.x
y = parent.y
path_change_point(Path1,0, x, y, 50)
path_change_point(Path1, 2, target.x, target.y, 50)
path_start(Path1, 50, path_action_stop, true)

//path_change_point(Path1, 2, x, y, 3)