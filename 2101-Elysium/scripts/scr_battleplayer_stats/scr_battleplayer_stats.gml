// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.player_level = 1;
global.player_exp = 0;
global.player_exp_needed = 10;

global.exp_gained = 0;
global.gold_gained = 0;

global.bplayer_health = 100
global.bplayer_maxdamage = 1;
global.bplayer_defense = 1;
global.bplayer_critchance = 10;
global.bplayer_critmulti = 0.5;
global.bplayer_accmulti = 0.1;
global.bplayer_speed = 25;

function level_up()
{
	global.player_level++;
	global.player_exp_needed *= 2;
	global.player_exp = global.player_exp_needed - global.player_exp;
	global.bplayer_health += irandom_range(10,15)
	global.bplayer_maxdamage += irandom_range(2,4)
	global.bplayer_defense += irandom_range(1,3)
	global.bplayer_critchance += irandom_range(1,2)
	global.bplayer_speed += irandom_range(10,20)
}