/// @description Insert description here
// You can write your code in this editor


if(moving)
	sprite_index = Town_Walking
else
{
	sprite_index = World_Idle
	
}


if(zoom)
{
	
	var lerp_width = lerp(camera_get_view_width(cam), zoom_width, 0.1)
	var lerp_height = lerp(camera_get_view_height(cam), zoom_height, 0.1)
	

	var _x = camera_get_view_x(cam) - (lerp_width - camera_get_view_width(cam)) * 0.5;
	var _y = camera_get_view_y(cam) - (lerp_height - camera_get_view_height(cam)) * 0.5;

	
	camera_set_view_pos(cam,_x, _y);
	camera_set_view_size(cam, lerp_width, lerp_height)
}
else 
{
	
	var lerp_width = lerp(camera_get_view_width(cam), zoom_out_width, 0.1)
	var lerp_height = lerp(camera_get_view_height(cam), zoom_out_height, 0.1)
	
	
	var _x = camera_get_view_x(cam) - (lerp_width - camera_get_view_width(cam)) * 0.5;
	var _y = camera_get_view_y(cam) - (lerp_height - camera_get_view_height(cam)) * 0.5;

	
	camera_set_view_pos(cam,_x, _y);
	camera_set_view_size(cam, lerp_width, lerp_height)
}

