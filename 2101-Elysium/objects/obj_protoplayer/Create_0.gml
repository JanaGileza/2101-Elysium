/// @description variables for player
// You can write your code in this editor

//needed variables for the player
enum player_state
{
	idle,
	attack,
	skill,
	item,
	defend,
	escape
}


hp = global.bplayer_health
hp_max = hp
base_damage = global.bplayer_maxdamage 
defense_reduction = global.bplayer_defense
crit_chance = global.bplayer_critchance 
crit_multi = global.bplayer_critmulti
//global.bplayer_accmulti = 0.1;
move_speed = global.bplayer_speed
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



min_damage = base_damage - 3;

if(min_damage <= 0)
	min_damage = 1;