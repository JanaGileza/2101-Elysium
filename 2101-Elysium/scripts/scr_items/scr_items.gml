// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro HEAL_HP 100
#macro HEAL_MP 101
#macro ELE_DAM 102

function items_struct(_myName, _myCost, _myType, _myDesc)constructor
{
	my_name = _myName;
	my_cost = _myCost;
	my_type = _myType;
	my_desc = _myDesc;
	my_total = 0;
}


function create_items()
{
	ds_list_add(obj_merchant.items, new items_struct("health potion", 10, HEAL_HP, "Heals 10 HP"))
	ds_list_add(obj_merchant.items, new items_struct("stamina potion", 30, HEAL_MP, "Heals 10 MP"))
}

function item_execute(item)
{
	switch(item.my_name)
	{
		case "health potion":
		{
			if(obj_protoplayer.hp <= obj_protoplayer.hp_max)
				obj_protoplayer.hp += 10;
			else
				return false
		}
		break;
		case "stamina potion":
			if(obj_protoplayer.mana <= obj_protoplayer.mana_max)
				obj_protoplayer.mana += 10;
			else
				return false
		break;
	}
	
	return true;
}