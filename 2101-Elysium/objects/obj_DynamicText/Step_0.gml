/// @description Insert description here
// You can write your code in this editor

if(!activate_text)
	exit;
	
y = lerp(y, y_position_final, 0.02);
//alpha_val = lerp(0, 2, 0.1);

if(alpha_val < 1)
{
	alpha_val += 1 / room_speed;
}


if(cue_end)
{
	instance_destroy();
}
