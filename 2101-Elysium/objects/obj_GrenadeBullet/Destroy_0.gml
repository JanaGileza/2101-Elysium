if(instance_exists(target))
{
	
		
	if(chance_hit(parent.crit_chance))
		damage = damage + (damage * parent.crit_multi)
	
	damage = damage / parent.defense_reduction * 3
	target.hp -= damage
	global.total_damage += damage
	if(target == obj_protoplayer)
	{
		explosion_x = irandom_range(x-65 , (x -80) )//(x , (x - target.sprite_width+200) )
		explosion_y = irandom_range(y-50 , (y ) )//(x , (x - target.sprite_width+100) )
	}
	else
	{
		explosion_x = irandom_range(x-100 , (x-80) )//-200
		explosion_y = irandom_range(y +0, (y -80))
	}
	if(is_end)
	{
		var text_box = instance_create_layer(obj_protoplayer.x + 200,obj_protoplayer.y + 275,"Instances", obj_UI_TextBox)
		text_box.msg = string(parent.my_name) + " dealt " + string(global.total_damage) + " to " + string(target.my_name)
		global.total_damage = 0
		parent.my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true;
	}
	
	var temp_struct = 
	{
		my_sprite : explosion_type,
		expand_sprite : true
	}
	
	instance_create_layer(explosion_x, explosion_y, "Instances", obj_explosion, temp_struct)
}
else
{
		parent.my_turn = false
		obj_BattleManager.next_turn = true
		obj_BattleManager.process_next_turn = true;
}	
	