/// @description Insert description here
// You can write your code in this editor

if(my_turn )
{

	if(chance_hit(buff_chance))
	{

		if(ds_list_size > 1)
		{
			var size = ds_list_size(obj_BattleManager.enemy_list)
			var random_comrade = irandom_range(0, size - 1)
		}
		else
			var random_comrade = 0
		show_message(random_comrade)
		var comrade = ds_list_find_value(obj_BattleManager.enemy_list, random_comrade)
		if(chance_hit(75))
		{
			comrade.str_buffed = true;
			comrade.turn_length_s += 3;
			var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
			text_box.msg = string(my_name) + " gave a power boost to " + string(comrade.my_name) 
		}
		else
		{
			comrade.def_buffed = true;
			comrade.turn_length_d += 3;
			var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
			text_box.msg = string(my_name) + " gave a defense boost to " + string(comrade.my_name) 
		}
		
		my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true
	}
	else
	{
		if(shoot_once)
		{
			shoot_once = false
			basic_shot(id, obj_protoplayer, Bullet_5, true, Impact_5)
			my_turn = false
		}
	}
}
else
	shoot_once = true;
if(hp <= 0)
	instance_destroy()





