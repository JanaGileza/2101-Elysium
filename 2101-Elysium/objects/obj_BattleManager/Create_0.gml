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
	calculate,
	escaped
}



state = battle_states.start
obj_turn = obj_protoplayer
global.total_damage = 0;

global.particle_system = part_system_create()
part_system_depth(global.particle_system, -800)

randomize()

lerp_exp = 0;
text_skip = false
process_next_turn = false;

room_speed = 60

turn_order = ds_priority_create()
enemy_list = ds_list_create()
next_turn = true;
enemy_count = 0;
saved_enemy_count = 0
counter = 0;
create_once = true
wait = false
lerp_val = 0;
lerp_gold = 0;
text_box_delay = true;
transition = false