/// @description Main, contains player state machine
// You can write your code in this editor

//experimental on choosing target by clicking on the enemy
if(mouse_check_button(mb_left))
{
	if(position_meeting(mouse_x,mouse_y, obj_baseenemy))
	{
		player_target = instance_position(mouse_x,mouse_y, obj_baseenemy)
	}
}

//if its not the players turn just exit
if(!my_turn)
{
	exit;
}

//if we are going to base basic attacks off of fire_rate
if(buff_fire_rate)
{
	buff_fire_rate = false;
	alarm[1] = 0.5 * room_speed;
	fire_rate = 0.1
	basic_fire = true
}

/*
The meat and potatoes of the player, the finite state for the player. The player will have 6 or more states
the main functions that performs is attacking, defending, utilizing skills/items and escaping if needed

Attack = create a bullet and aim it towards the target. For right now have bullet to end the player turn
to ensure that the turn ends when the animation is over. (Will need to change later)

Defend = Simply apply something to subtract incoming damage

Skill = Needs to be dynamic, it will fill depending on the players weapon but as of right now the weapon will
come later to put restraints on player to progress through game smoothly.

Items = same as skill, needs to be dynamic but instead will give aid to the player in some ways or the other

Escape = Just send player back to the world_map for now.
*/
switch(state)
{
	case player_state.attack:
	{
		//checking if the player isnt targetting anyone
		if(player_target != noone)
		{
			if(basic_fire)
			{
				basic_fire = false;
				alarm[0] = fire_rate * room_speed
				
				//a struct to fill the bullet info
				bullet_struct = 
				{
					this_sprite : Bullet_1,
					parent : id,
					target : player_target
				}
	
				bullet = instance_create_layer(x,y,"Instances", obj_BaseBullet, bullet_struct)
			}
			//need to reset target to prevent target choice to be rolled over.
			player_target = noone
		}
	}
	break;
	case player_state.skill:
	break;
	case player_state.defend:
	break;
	case player_state.item:
	break;

}

//for testing purposes
if(keyboard_check_pressed(vk_space))
{
	if(fire_rate > 0.1)
	{
		fire_rate -= 0.1;
	}
}
