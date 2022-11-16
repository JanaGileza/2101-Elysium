/// @description Insert description here
// You can write your code in this editor

if(position_meeting(mouse_x, mouse_y, id) )
{
	if(mouse_check_button(mb_left))
	{
		selected = true;
	}
	if(!selected && !in_zone)
		hovered = true;
	
}
else
{
	temp = instance_position(mouse_x,mouse_y,all)
	temp_check = collision_rectangle(x,y, x, y + 100, temp, 0, 1 )
	if(temp_check == noone)
		hovered = false;
}



if(mouse_check_button_released(mb_left) && selected)
{
	selected = false;
	
	if(position_meeting(mouse_x, mouse_y, destination_zone))
		in_zone = true;
	else
		in_zone = false;
}

if(selected)
{
	x = lerp(x,mouse_x, 0.2)
	y = lerp(y,mouse_y,0.2)
}


if(!selected && !in_zone )
{
		x = lerp(x,start_x, 0.2)
		y = lerp(y,start_y,0.2)
}

if(hovered)
	y -= 20;
if(mouse_check_button_released(mb_right))
{
	super_charged = !super_charged
}