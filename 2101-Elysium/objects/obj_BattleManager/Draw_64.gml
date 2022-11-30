/// @description Insert description here
// You can write your code in this editor

//used for prototyping purposes 
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
	break;
	case battle_states.lose:
		draw_text(surface_get_width(application_surface) / 2, 10, "Player loss!")
	break;

}