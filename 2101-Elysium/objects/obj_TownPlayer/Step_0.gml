/// @description Insert description here
// You can write your code in this editor


if(!obj_merchant.is_open)
{
	if(keyboard_check(ord("A")))
	{
		image_xscale = 1;
		if(!place_meeting(x - Move_Speed,y, obj_Block))
			x -= Move_Speed;
		
	}

	if(keyboard_check(ord("D")))
	{
		image_xscale = -1;
		if(!place_meeting(x + Move_Speed,y, obj_Block))
			x += Move_Speed;
	}
}


