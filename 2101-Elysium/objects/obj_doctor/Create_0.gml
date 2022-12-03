/// @description Insert description here
// You can write your code in this editor

is_open = false

global.shop = false

selected = 0

items = ds_list_create()
create_heal_options()
//ds_list_add(items, ["health potion", 10, "Gives 10 hp"])
//ds_list_add(items, ["Stamina potion", 30, "Restores 20 stamina"])

item_num = ds_list_size(items)

g_width = display_get_gui_width()
g_height = display_get_gui_height()

m_width = g_width * 0.3
m_marge = g_width * 0.1

preview = (g_width - (m_width + m_marge));


allow_key = true
