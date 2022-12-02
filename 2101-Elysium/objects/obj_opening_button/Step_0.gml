/// @description Insert description here
// You can write your code in this editor

if mouse_check_button_pressed(mb_left) {
	mx = window_mouse_get_x();
	my = window_mouse_get_y();
	if collision_point(mx,my,self,false,false) {
		room_goto(First_Playable_World);
	}
}
