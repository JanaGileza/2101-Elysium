/// @description Insert description here
// You can write your code in this editor
defense_up = false

wait = false;
my_turn = false;

timer = 3;
count_down = true;

move_speed = irandom_range(2, 100)

//my_name = "Basic " + string(instance_number(obj_baseenemy) - obj_BattleManager.enemy_count)

obj_BattleManager.counter++;
my_name = "Basic " + string(obj_BattleManager.counter)


image_speed = 0.1
image_xscale = -1

shoot_once = false

hp = hp * obj_GameManager.multi;
hp_max = hp;

base_damage *= obj_GameManager.multi;
min_damage = base_damage - 3;

if(min_damage <= 0)
	min_damage = 1;

choice_num = 0;
save_self = 0;

base_max = base_damage
base_min = min_damage
base_def = defense_reduction