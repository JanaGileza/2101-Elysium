// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.surface_width = surface_get_width(application_surface);
global.surface_height = surface_get_height(application_surface);
global.pausedScreen = lose_screen
global.pausedSurface = surface_create(global.surface_width,global.surface_height);

function chance_hit(perc)
{
	return irandom(101) < perc
}


function createPause(){
	

	//if(sprite_exists(global.pausedScreen))
	//{
	//	draw_surface(global.pausedSurface, 0, 0);
	//	draw_sprite(global.pausedScreen, -1, 0, 0)
	//}
	if(surface_exists(global.pausedSurface))
	{
		
		draw_surface(global.pausedSurface, 0, 0);
		draw_sprite(global.pausedScreen, -1, 0, 0)
		
	
		draw_set_alpha(0.5);
		draw_rectangle_color(0,0,room_width,room_height, c_black, c_black, c_black,c_black,false);
		draw_set_alpha(1);
	}

}