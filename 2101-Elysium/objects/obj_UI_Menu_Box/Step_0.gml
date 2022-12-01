/// @description Insert description here
// You can write your code in this editor


//making sure to only create the buttons once, to prevent overlap
if(create_once)
{
	create_once = false
	create_world_decision_buttons(x - 195, y)
}

//checking to make sure a button has been completely pressed before acting
if(button_pressed )
{
	switch(decision_made)
	{
		case 0:
			if(!obj_GameManager.enter_point)
			{
				obj_GameManager.goto_point = obj_GameManager.current_point.contained_room
				obj_GameManager.enter_point = true
			}
			
		break;
		case 1:
			destroy_buttons()
			instance_destroy()
		break;
		
	}
	
	
}

