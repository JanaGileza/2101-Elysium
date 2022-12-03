/// @description Insert description here
// You can write your code in this editor

switch(state)
		{
			case player_state.idle:
				image_speed = 0.2
				sprite_index = Battle_Idle
			break;
			case player_state.attack:
				image_speed = 0.9
				sprite_index = Battle_Shoot
			break;
			case player_state.charging:
				image_speed = 0.9
				sprite_index = Battle_Charge
			break;

		}
		
		
