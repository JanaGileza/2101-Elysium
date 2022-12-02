/// @description Insert description here
// You can write your code in this editor

var _inst = instance_create_layer(x, y, ending_narration, obj_dialogue);
with(_inst) {
	draw_set_font(fnt_dialogue);
	draw_set_color(c_green);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_ext(683, 384, "And so, our hero saved the world, successfully defeating the aliens and restoring peace and humanity to the planet." + "\n" + "While there is still much to do and fix, our hero works together with the other survivors to re-establish society, create new and strong alien alliances, and make the world a more peaceful place to be." + "\n" + "THE END.",32, 1000);
}

