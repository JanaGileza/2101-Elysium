// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.surface_width = surface_get_width(application_surface);
global.surface_height = surface_get_height(application_surface);
global.pausedScreen = spr_background
global.pausedSurface = surface_create(global.surface_width,global.surface_height);

function chance_hit(perc)
{
	return irandom(101) < perc
}


function createPause()
{
	

	if(surface_exists(global.pausedSurface))
	{
		
		draw_surface(global.pausedSurface, 0, 0);
		draw_sprite(global.pausedScreen, -1, 0, 0)
		
	
		draw_set_alpha(0.5);
		draw_rectangle_color(0,0,room_width,room_height, c_black, c_black, c_black,c_black,false);
		draw_set_alpha(1);
	}

}

function boss_skill_chance()
{
	var prob = irandom(99);
	
	//if(prob <= 9)
	//{
	//	return 3;
	//}
	
	if(prob > 9 && prob <= 29)
	{
		return 1;
	}
	
	if(prob > 29 && prob <= 59)
	{
		return 2;
	}
	
	return 0;

}


function reset_game()
{
	
}