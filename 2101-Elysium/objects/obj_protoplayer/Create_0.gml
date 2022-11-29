/// @description variables for player
// You can write your code in this editor

//needed variables for the player
image_xscale = -1
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

burst_count = 0
selected = false

basic_fire = true;

fire_now = true;

buff_fire_rate = false;

player_target = noone

state = player_state.idle

fire_rate = 3

image_speed = 0.2

create_once = true

pos = 0;

skill_perf = noone
item_perf = noone

defense_up = false
turn_length = 0;
