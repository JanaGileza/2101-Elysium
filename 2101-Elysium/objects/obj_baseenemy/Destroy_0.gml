/// @description Insert description here
// You can write your code in this editor

global.exp_gained += exp_num
global.gold_gained += gold_num

var place = ds_list_find_index(obj_BattleManager.enemy_list, id)
ds_list_delete(obj_BattleManager.enemy_list, place);

