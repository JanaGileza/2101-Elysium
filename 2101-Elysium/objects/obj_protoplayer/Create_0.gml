/// @description Insert description here
// You can write your code in this editor

enum player_state
{
	idle,
	attack,
	skill,
	item,
	defend,
	escape
}


movespeed = 3;

selected = false

basic_fire = true;

buff_fire_rate = false;

player_target = noone

state = player_state.idle

fire_rate = 3