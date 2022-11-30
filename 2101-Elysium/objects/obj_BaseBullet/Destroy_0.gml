/// @description Insert description here
// You can write your code in this editor

if(instance_exists(target))
{
	if(target.defense_up)
		damage = damage / 2;
		
		
	target.hp -= damage;
	global.total_damage += damage

	if(is_end)
	{
		var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
		text_box.msg = string(parent.my_name) + " dealt " + string(global.total_damage) + " to " + string(target.my_name)
		global.total_damage = 0
		parent.my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true;
	}
}
else
{
		parent.my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true;
}	
	

			
	//destroy_buttons()
	//create_main_buttons()
	//obj_UI_Box.reset_UI_Box()


