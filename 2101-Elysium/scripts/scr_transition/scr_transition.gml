// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.changing = false;
global.currentRoom = room;

function transition_type(Type)
{
	
	if(layer_exists("transition"))
	{
		layer_destroy("transition")
	}
	
	t_layer = layer_create(-999, "transition")
	layer_sequence_create(t_layer, 0 , 0, Type);
}


function start_transition(_goto, into, outof)
{
	//if(instance_exists(obj_GameManager.current_point))
	//{
	//	if(obj_GameManager.current_point.inbattle)
	//		obj_GameManager.current_point.inbattle = false;
	//}
	
	if(!global.changing)
	{
		
		global.changing = true;
		global.currentRoom = _goto;
		
		
		transition_type(into);
		
		
		layer_set_target_room(_goto);
		
		transition_type(outof);
		
		layer_reset_target_room();
		
		return true
	}
	else
		return false;

}

function room_changed()
{
	
	layer_sequence_destroy(self.elementID);
	//if(instance_exists(obj_GameManager))
	//	obj_GameManager.changing_room = true;
	room_goto(global.currentRoom);
	
}



function change_complete()
{
	layer_sequence_destroy(self.elementID);
	global.changing = false;
	
}
