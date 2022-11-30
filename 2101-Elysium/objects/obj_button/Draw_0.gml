/// @description Insert description here
// You can write your code in this editor


//making sure to draw self when needed
if(room == Battle_Room || room == Boss_Battle_Room)
{
	if(obj_protoplayer.my_turn)
	{
		draw_self()
	}
}
else
	draw_self()