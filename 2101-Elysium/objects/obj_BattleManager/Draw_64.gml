/// @description Insert description here
// You can write your code in this editor

//used for prototyping purposes 

if(global.debug)
{
	var x_pos = (global.surface_width / 2) - 150
	var copy_prio = ds_priority_create()
	ds_priority_copy(copy_prio, turn_order)
	for(i = 0; i < ds_priority_size(copy_prio); i++)
	{
		var inst = ds_priority_find_max(copy_prio)
		draw_text(x_pos + (i * 150), 50, string(inst.my_name))
		ds_priority_delete_max(copy_prio)
	}
	
	if(ds_priority_empty(copy_prio))
		ds_priority_destroy(copy_prio)
	
}
switch(state)
{
	case battle_states.player_turn:
		draw_text(surface_get_width(application_surface) / 2, surface_get_height(application_surface) / 2, "Player Turn")
	break;
	case battle_states.enemy_turn:
		draw_text(surface_get_width(application_surface) / 2, surface_get_height(application_surface) / 2, obj_turn.my_name + " Turn")
	break;
	case battle_states.win:
		draw_text(surface_get_width(application_surface) / 2, 10, "Player Wins!")
		createPause()
		
		
		
		w = (global.surface_width / 2)- 150
		h =  (global.surface_height / 2) - 100
		draw_rectangle_color(w-100,h - 100, w+400,h+300,c_gray,c_gray,c_gray,c_gray, false)
		draw_text(w + 125, h - 100, "Victory!")
		draw_text(w - 50, h - 20, string(global.exp_gained))
		draw_text(w - 50, h, "Exp: ")
		draw_text(w - 50, h + 30, "Money Earned: " + string(global.gold_gained) + " Total: " + string(global.player_money))
		//lerp_exp = lerp(global.player_exp, global.player_exp_needed, 0.1);
		draw_text(w - 50, h + 60, "Items Found: ")
	
		if(lerp_exp >= global.player_exp_needed)
		{
			level_up()
		}
		
	
		draw_rectangle(w + 46, h, w + 46 + (300 * (lerp_val / global.player_exp_needed)), h+20, false)
		
		
		draw_rectangle_color(w+46, h, w + 346, h+20, c_black,c_black,c_black,c_black,true)
		if(lerp_gold == 0 && global.exp_gained == 0)
		{
			draw_text(w + 100, h + 500, "Press any key to continue")
		}
		
	break;
	case battle_states.lose:
		draw_text(surface_get_width(application_surface) / 2, 10, "Player loss!")
	break;

}


