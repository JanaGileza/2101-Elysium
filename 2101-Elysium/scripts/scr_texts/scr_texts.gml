// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro GAMESTART 201
#macro GAMEOVER 202
#macro GAMEWON  203


function receive_text(state)
{
	return_text = ""
	switch(state)
	{
		case GAMESTART:
			return_text =  "A war has erupted in a galaxy not too far from our own, Galaxy 2101, an alien species starting a war soon after landing on the planet Elysium." + "\n" + "With the world around them crumbling as they know it, our hero finds themselves tasked with preventing the demise of humankind from these new alien enemies, using all the resources they can and fighting with all their might. While Elysium may not be as stable right now as it was prior to the alien landing, capitalism on the planet is still finding a way to thrive, with various merchants being able to help the hero gain different tools and armor to help them on their journey." + "\n" + "With the weight of the world on our hero's shoulders, we head to war-stricken Elysium"
			//return_text = "A war has erupted in a galaxy not too far from our own, Galaxy 2101, an alien species starting a war soon after landing on the planet Elysium.\n With the world around them crumbling as they know it, our hero finds themselves tasked with preventing the demise of humankind from these new alien enemies, using all the resources they can and fighting with all their might. While Elysium may not be as stable right now as it was prior to the alien landing, capitalism on the planet is still finding a way to thrive, with various merchants being able to help the hero gain different tools and armor to help them on their journey.\n With the weight of the world on our hero's shoulders, we head to war-stricken Elysium"
		break;
		case GAMEOVER:
			return_text = "Eli? Eli!?....ELIII!!!"
		break;
		case GAMEWON:
			return_text = "And so, our hero saved the world, successfully defeating the aliens and restoring peace and humanity to the planet." + "\n" + "While there is still much to do and fix, our hero works together with the other survivors to re-establish society, create new and strong alien alliances, and make the world a more peaceful place to be." + "\n" + "THE END."
		break
	}
	
	return return_text;
}

function string_wrap(str, width)
{
	var str_length = string_length(str)
	var last_space = 1;
	
	var count = 1;
	var substr;
	
	repeat(str_length)
	{
		substr = string_copy(str, 1, count)
		if(string_char_at(str, count) == " ") 
			last_space = count - 1
			
		if(string_width(substr) > width)
		{
			str = string_delete(str, last_space, 1);
			str = string_insert("\n", str, last_space)
			count += 1
		}
		
		count++
	}
	
	return str;
}