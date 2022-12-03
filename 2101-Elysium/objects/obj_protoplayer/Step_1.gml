/// @description Insert description here
// You can write your code in this editor

if(leveled_up)
{
	hp_max = global.bplayer_health
	mana_max = global.bplayer_mana
	base_damage = global.bplayer_maxdamage
	min_damage = base_damage - 3
	defense_reduction = global.bplayer_defense
	crit_chance = global.bplayer_critchance 
	crit_multi = global.bplayer_critmulti
	leveled_up = false;
}

if(global.godMode)
{
	hp = hp_max
	mana = mana_max
}




