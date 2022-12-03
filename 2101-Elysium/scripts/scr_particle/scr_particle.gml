// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

var _p = part_type_create()

part_type_shape(_p, pt_shape_sphere)
part_type_life(_p, 20, 40);

part_type_alpha3(_p,0, 1, 0);
part_type_color2(_p, c_white, c_red)
part_type_size(_p, 0.2,0.1,0, 0)

part_type_speed(_p, 2, 4, 0, 0)
part_type_direction(_p, 0, 360, 0 , 0)
global.ptBasic = _p;