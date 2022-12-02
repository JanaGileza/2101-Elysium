/// @description Insert description here
// You can write your code in this editor

var _inst = instance_create_layer(global.surface_width / 2, global.surface_height / 2, opening_narration, obj_dialogue);
with(_inst) {
	draw_set_font(fnt_dialogue);
	draw_set_color(c_green);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text_ext(900, 504, "A war has erupted in a galaxy not too far from our own, Galaxy 2101, an alien species starting a war soon after landing on the planet Elysium." + "\n" + "With the world around them crumbling as they know it, our hero finds themselves tasked with preventing the demise of humankind from these new alien enemies, using all the resources they can and fighting with all their might. While Elysium may not be as stable right now as it was prior to the alien landing, capitalism on the planet is still finding a way to thrive, with various merchants being able to help the hero gain different tools and armor to help them on their journey." + "\n" + "With the weight of the world on our hero's shoulders, we head to war-stricken Elysium", 32, 1000);
	
	
}