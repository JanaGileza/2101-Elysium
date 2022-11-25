// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nine_slice(_x,_y,w,h,spr, sub_spr)
{



	var cellSize = sprite_get_width(spr)/3;
	var mainW = w - cellSize*2;
	var mainH = h - cellSize*2;
	var mainScaleW = mainW/cellSize;
	var mainScaleH = mainH/cellSize;

	/*Corners
	 Top Left */
	draw_sprite_part(spr, sub_spr, 0, 0, cellSize, cellSize, _x, _y);
    
	//Top Right
	draw_sprite_part(spr, sub_spr, cellSize*2, 0, cellSize, cellSize, (_x + w) - cellSize, _y);
    
	//Bottom left
	draw_sprite_part(spr, sub_spr, 0, cellSize*2, cellSize, cellSize, _x, (_y + h) - cellSize);
    
	//Bottom Right
	draw_sprite_part(spr, sub_spr, cellSize*2, cellSize*2, cellSize, cellSize, (_x + w) - cellSize, (_y + h) - cellSize);

	/*Middle
	 Center*/
	draw_sprite_part_ext(spr, sub_spr, cellSize, cellSize, cellSize, cellSize, _x + cellSize, _y + cellSize, mainScaleW, mainScaleH, -1, 1);

	//Top
	draw_sprite_part_ext(spr, sub_spr, cellSize, 0, cellSize, cellSize, _x + cellSize, _y, mainScaleW, 1, -1, 1);
        
	//Bottom
	draw_sprite_part_ext(spr, sub_spr, cellSize, cellSize*2, cellSize, cellSize, _x + cellSize, (_y + h) - cellSize, mainScaleW, 1, -1, 1);
        
	//Left
	draw_sprite_part_ext(spr, sub_spr, 0, cellSize, cellSize, cellSize, _x, _y + cellSize, 1, mainScaleH, -1, 1);
        
	//Right
	draw_sprite_part_ext(spr, sub_spr, cellSize*2, cellSize, cellSize, cellSize, (_x + w) - cellSize, _y + cellSize, 1, mainScaleH, -1, 1);
}