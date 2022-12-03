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
	charging,
	escape
}

add = 0.2;
uni_add = shader_get_uniform(glow_shader, "add")
uni_time = shader_get_uniform(glow_shader, "time")
glow_count = 0;

glow_multi = 1;

hp = obj_GameManager.players_current_hp;
hp_max = global.bplayer_health
mana_max = global.bplayer_mana
base_damage = global.bplayer_maxdamage 
defense_reduction = global.bplayer_defense
crit_chance = global.bplayer_critchance 
crit_multi = global.bplayer_critmulti
global.bplayer_accmulti = 0.1;
move_speed = 100
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

charging = false
charging_length = 0;
charge_enemy = noone

min_damage = base_damage - 3;

if(min_damage <= 0)
	min_damage = 1;