// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro HEAL_HP 100
#macro HEAL_MP 101
#macro ELE_DAM 102

function items_struct(_myName, _myCost, _myType, _myDesc, _mysprite)constructor
{
	my_name = _myName;
	my_cost = _myCost;
	my_type = _myType;
	my_desc = _myDesc;
	my_sprite = _mysprite
	my_total = 0;
}


function create_items()
{
	ds_list_add(obj_merchant.items, new items_struct("health potion", 10, HEAL_HP, "Heals 10 HP", spr_healthpotion))
	ds_list_add(obj_merchant.items, new items_struct("stamina potion", 30, HEAL_MP,  "Heals 10 MP", spr_manapotion))
	ds_list_add(obj_merchant.items, new items_struct("Grenade", 50, ELE_DAM, "Grenade that does great damage", spr_grenade))
	ds_list_add(obj_merchant.items, new items_struct("No Thanks", 0, HEAL_HP, "No? Well See ya...", spr_blank))
}

function create_heal_options()
{
	ds_list_add(obj_doctor.items, new items_struct("Heal", 100, HEAL_HP, "I can heal you for a small fee.", spr_healthpotion))
	ds_list_add(obj_doctor.items, new items_struct("No Thanks", 0, HEAL_HP, "No? Well Goodbye..", spr_blank))
}

function item_execute(item)
{
	switch(item.my_name)
	{
		case "health potion":
		{
			if(obj_protoplayer.hp < obj_protoplayer.hp_max)
			{
				var heal_amount = 10 * global.player_level;
				if(heal_amount > 50)
					heal_amount = 50;
				obj_protoplayer.hp += heal_amount;
				if(obj_protoplayer.hp > obj_protoplayer.hp_max)
					obj_protoplayer.hp = obj_protoplayer.hp_max;
			}
			else
				return false
		}
		break;
		case "stamina potion":
			if(obj_protoplayer.mana < obj_protoplayer.mana_max)
			{
				var mana_amount = 10 * global.player_level;
				if(mana_amount > 50)
					mana_amount = 50;
					
				obj_protoplayer.mana += mana_amount;
				
				if(obj_protoplayer.mana > obj_protoplayer.mana_max)
					obj_protoplayer.mana = obj_protoplayer.mana_max;
			}
			else
				return false
		break;
	}
	
	return true;
}