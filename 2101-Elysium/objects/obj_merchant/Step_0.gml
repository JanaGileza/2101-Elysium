/// @description Insert description here
// You can write your code in this editor


if(!is_open && place_meeting(x,y, obj_TownPlayer))
{
	obj_TownPlayer.interact = true
	
	if(keyboard_check(ord("E")))
	{
		is_open = true
		global.shop = true;
	}
}
else 
{
	obj_TownPlayer.interact = false;
	if(is_open && keyboard_check(vk_escape))
	{
		
		is_open = false;
		global.shop = false;
	}
}


if(is_open)
{
	if(allow_key)
	{
		allow_key = false;
		alarm[0] = 0.3 * room_speed
 		if(keyboard_check(vk_down) || keyboard_check(ord("S")))
		{
			selected++;
			if(selected >= item_num)
				selected = 0
		}
	
		if(keyboard_check(vk_up) || keyboard_check(ord("W")))
		{
			selected--;
			if(selected < 0)
				selected = item_num - 1;
		}
	}
	
	var item_slot = ds_list_find_value(items, selected)
	var item_name = item_slot.my_name
	var item_price = item_slot.my_cost
	
	if(keyboard_check_pressed(vk_enter))
	{
		if(obj_GameManager.player_money >= item_price)
		{
			ds_list_add(global.player_inv, item_slot)
			
			obj_GameManager.player_money -= item_price;
		}
	}
}



