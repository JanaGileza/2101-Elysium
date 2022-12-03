/// @description Insert description here
// You can write your code in this editor

if(str_buffed || def_buffed)
{
	buff_counter += (0.01 * buff_multi);

	if(buff_counter >= 0.8 || buff_counter <= 0)
	{
		buff_multi *= -1;
	}
	
	if(str_buffed)
	{
		a_add = buff_counter;
	}
	
	if(def_buffed)
	{
		d_add = buff_counter;
	}
}


