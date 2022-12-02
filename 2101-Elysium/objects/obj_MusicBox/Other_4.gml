/// @description Insert description here
// You can write your code in this editor


current_room = room;

if( current_room == Credit_Screen || current_room == Howto_Screen)
{
	current_room = Title_Screen;
	same_room = true;
}




switch(current_room)
{
	case World_Map:
	if(!audio_is_playing(snd_worldtown))
	{
		audio_stop_all()
		audio_play_sound(snd_worldtown, 0 , 1)
		same_room = false;
	}
	break;
	
	case Town_Map:
	if(!audio_is_playing(snd_town))
	{
		audio_stop_all()
		audio_play_sound(snd_town, 0 , 1)
		same_room = false;
	}
	break;
	
	case Battle_Room:
	if(!audio_is_playing(snd_normalbattle))
	{
		audio_stop_all()
		audio_play_sound(snd_normalbattle, 0 , 1)
		same_room = false;
	}
	break;
	
	case Boss_Battle_Room:
	if(!audio_is_playing(snd_bossbattle))
	{
		audio_stop_all()
		audio_play_sound(snd_bossbattle, 0 , 1)
		same_room = false;
	}
	break;
	
	case Title_Screen:
	if(!audio_is_playing(snd_titlescreen))
	{
		if(!same_room)
		{
			audio_stop_all()
			audio_play_sound(snd_titlescreen, 0 , 1)
		}
		
	}
	break;
	
	
	default:
	if(!audio_is_playing(snd_worldtown))
	{
		audio_stop_all()
		audio_play_sound(snd_worldtown, 0, 1);
		same_room = false;
	}
	break;
}



