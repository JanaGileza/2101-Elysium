/// @description Insert description here
// You can write your code in this editor
enum battle_states
{
	start,
	idle,
	player_turn,
	enemy_turn,
	win,
	lose,
	calculate
}

state = battle_states.start
obj_turn = obj_protoplayer


randomize()

process_next_turn = true;

room_speed = 60

turn_order = ds_priority_create()
next_turn = true;
enemy_count = 0;
saved_enemy_count = 0
counter = 0;
create_once = true