/// @description Insert description here
// You can write your code in this editor

	if(target.defense_up)
		damage = damage / 2;
		
		
	target.hp -= damage;

	if(is_end)
	{
		parent.my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true;
	}
	
	

			
	//destroy_buttons()
	//create_main_buttons()
	//obj_UI_Box.reset_UI_Box()


