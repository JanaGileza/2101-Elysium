/// @description Insert description here
// You can write your code in this editor


wait = false;
my_turn = false;

timer = 3;
count_down = true;

move_speed = irandom_range(2, 100)

//my_name = "Basic " + string(instance_number(obj_baseenemy) - obj_BattleManager.enemy_count)

my_name = "Basic " + string(obj_BattleManager.counter)

obj_BattleManager.counter++;