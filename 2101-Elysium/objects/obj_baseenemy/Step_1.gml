/// @description Insert description here
// You can write your code in this editor
if(my_turn)
{
	if(str_buffed && turn_length_s > 0)
	{
		if(!str_already_buff)
		{
			str_already_buff = true
			base_damage *= 2
			min_damage *= 2;
		}
		 //turn_length_s--
	}
	else
	{
		str_buffed = false;
		a_add = 0
		if(str_already_buff)
		{
			str_already_buff = false
			base_damage = base_max
			min_damage = base_min
		}
	}

	if(def_buffed &&  turn_length_d > 0)
	{
		if(!def_already_buff)
		{
			def_already_buff = true
			defense_reduction *= 2;
		}
		//turn_length_d--
	}
	else
	{
		def_buffed = false;
		d_add = 0;
		if(def_already_buff)
		{
			defense_reduction = base_def;
		}
	}
}







