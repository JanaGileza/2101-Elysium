/// @description Insert description here
// You can write your code in this editor
draw_set_font(Text_Box_Battle)
gamestart = true
global.gameWon = false;
global.gameLost = false;
global.player_money = 100

players_current_hp = 100
players_current_mp = 100

global.debug = false;
global.godMode = false;

global.gameState = GAMEWON;
//global.changing = false;
//global.currentRoom = World_Map

global.player_inv = ds_list_create()
global.shop = false

global.TotalMap = ds_list_create()
global.grid = mp_grid_create(0, 0, room_width / 32, room_height / 32, 32, 32);

player_skills = ds_list_create()

ds_list_add(player_skills, skill_stuct("Burst Shot", burst_shot, 10))
ds_list_add(player_skills, skill_stuct("Charge Shot", charge_shot, 50))
ds_list_add(player_skills, skill_stuct("Grenade Toss", grenade_toss, 0))


//make sure to set keep track of all map points
//with(obj_MapPoints)
//{
//	ds_list_add(global.TotalMap, id)
//}

completed_points = ds_list_create()

player = noone

gamestart = false
current_point = noone
start_battle = false
battle_concluded = false
saved_point = current_point
enter_point = false
multi = 0
player_escaped = false
player_loss = false

goto_point = noone
changing_room = false

boss_started = false

