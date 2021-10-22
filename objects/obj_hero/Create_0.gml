/// @description Player inherit parent data
event_inherited();
//button variables
game_pad = 0;///Custom gamePad check
if (os_type = os_android) //You can change this to add more operating systems (gamepad_script can assigned depending of the Os)
{
 //Gamepad offset relative to Gui Layer	
 Mx_off = 0;
 My_off = 0;
 //Distance in pixels from the first press and umpress
 Mx_dist = 0;
 My_dist = 0;
 // Store the current Display size
 Dw = display_get_gui_width();
 Dh = display_get_gui_height();
 // Store a half screen checking for the gamePad
 Dwh = Dw/2;
 // Jump button
 b_virtual_jump = dks_button_create(Dw-320,Dh-320,256,256,0,0,c_white,c_lime,c_white,c_lime,spr_bone);
 // Attack button
 b_virtual_attack = dks_button_create(Dw-640,Dh-320,256,256,0,0,c_white,c_orange,c_white,c_orange,spr_bone);
 // Load the default gamepad method depending on the operating system
 gamepad_script = dks_pad_android;
}
else
{
 gamepad_script = dks_pad_windows;// Load the default gamepad method depending on the operating system
}


if gamepad_is_connected(0) 
{
 game_pad = 1;// This variable store if a gamepad is active
}
// first execution gamepad method, this script is continually updated on the step event
script_execute(gamepad_script);

enum State// Array State machine
{
 null,
 idle,
 idle2,
 walk,
 run,
 fall,
 attack1,
 attack2,
 attack3,
 air_attack1,
 air_attack2,
 air_attack3,
 air_attack4,
 cast,
 cast_loop,
 climb,
 corner_climb,
 corner_grab,
 corner_jump,
 crouch,
 die,
 item,
 get_sword,
 save_sword,
 jump1,
 jump2,
 hurt,
 slide,
 slide_begin,
 slide_end,
 slide_wall,
 path
 
 
 
}
// Store the states on scripts
array_state[State.null] = dks_null;
array_state[State.idle] = scr_hero_idle;
array_state[State.idle2] = scr_hero_idle2;
array_state[State.walk] = scr_hero_walk;
array_state[State.run] = scr_hero_run;
array_state[State.fall] = scr_hero_fall;
array_state[State.attack1] = scr_hero_attack1;
array_state[State.attack2] = scr_hero_attack2;
array_state[State.attack3] = scr_hero_attack3;
array_state[State.air_attack1] = scr_hero_air_attack1;
array_state[State.air_attack2] = scr_hero_air_attack2;
array_state[State.air_attack3] = scr_hero_air_attack3;
array_state[State.air_attack4] = scr_hero_air_attack4;
array_state[State.cast] = scr_hero_cast;
array_state[State.cast_loop] = scr_hero_cast_loop;
array_state[State.climb] = scr_hero_climb;
array_state[State.corner_climb] = scr_hero_corner_climb;
array_state[State.corner_grab] = scr_hero_corner_grab;
array_state[State.corner_jump] = scr_hero_corner_jump;
array_state[State.crouch] = scr_hero_crouch;
array_state[State.die] = scr_hero_die;
array_state[State.item] = scr_hero_item;
array_state[State.get_sword] = scr_hero_get_sword;
array_state[State.save_sword] = scr_hero_save_sword;
array_state[State.jump1] = scr_hero_jump1;
array_state[State.jump2] = scr_hero_jump2;
array_state[State.hurt] = scr_hero_hurt;
array_state[State.slide] = scr_hero_slide;
array_state[State.slide_begin] = scr_hero_slide_begin;
array_state[State.slide_end] = scr_hero_slide_end;
array_state[State.slide_wall] = scr_hero_slide_wall;
array_state[State.path] = scr_hero_path;
//////////////////////////////////////
current_state = State.fall; // This variable is executed in real time on the step event, choosing the current state script from the "array_state"
weapon = -1; // THis variable store the current weapon to use.
combo_time = 0; // This variable controls the timer for the combo actions/animations.
//variables
can_jump = 2; // The number of times our player can jump while a jump state is executed
//bind_target = noone; 
// Get the display size
dw = display_get_width();
dh = display_get_height();
//This variable controls the image scale for the draw event, very usefull to use in the case of manage a Spine sprite or 3D images...
//...without interfering with the collision system
xscale = 1;
image_speed =2;
///Editor variables (Custom component System, manage variables from the editor)
val[9] = 0;
phy_left = -300; // Walk left
phy_right = 300; // Walk right
max_jump = -70; // Max jump force
phy_max_left = -20; // Max left Speed
phy_max_right = 20; // Max right Speed
dash_max_left = -600; // Dash state left speed
dash_max_right = 600; // Dash state right speed
falling = 40; // Fall Speed
img_speed = 1;// Custom image speed variable
last_colx = 0;// Store the orientation of the last time our player collided
///particle system
//foliage
// Custom particle system to generate different kind of textures depending of the terrain sprite asset.
hero_part = part_system_create(); // Creating the particle system
part_ground[0] = part_type_create(); // Store the particle types on a array
part_type_sprite(part_ground[0],part_foliage,0,0,0);
part_type_size( part_ground[0],0.2,0.5,0.001,0);
//part_type_colour3( pt,a[7],a[8],a[9]);
part_type_alpha3( part_ground[0],0.5,1,0);
part_type_speed( part_ground[0],0,1,0,1);
part_type_direction( part_ground[0],140,180,-1,1);
part_type_gravity( part_ground[0],0.02,180);
part_type_orientation( part_ground[0] ,0,360,1,0,0);
//part_type_blend( part_ground[0],a[28]);
part_type_life( part_ground[0],20,40);
//part_type_scale(part_ground[0], 1,1);
//dust

part_ground[1] = part_type_create();
part_type_sprite(part_ground[1],spr_part_dust,0,0,0);
part_type_size( part_ground[1],0.5,1,0.01,0);
//part_type_colour3( pt,a[7],a[8],a[9]);
part_type_alpha3( part_ground[1],0.5,1,0);
part_type_speed( part_ground[1],0,1,0,1);
part_type_direction( part_ground[1],45,90,-1,1);
part_type_gravity( part_ground[1],0.02,90);
part_type_orientation( part_ground[1] ,0,360,1,0,0);
//part_type_blend( part_ground[0],a[28]);
part_type_life( part_ground[1],20,40);
part_ground[2] = part_ground[1];
//wall slide

part_ground[3] = part_type_create();
part_type_sprite(part_ground[3],spr_part_dust,0,0,0);
part_type_size( part_ground[3],0.5,1,0.05,0);
//part_type_colour3( pt,a[7],a[8],a[9]);
part_type_alpha3( part_ground[3],0.5,1,0);
part_type_speed( part_ground[3],0,0.5,0.01,0);
part_type_direction( part_ground[3],0,0,0,1);
part_type_gravity( part_ground[3],0.01,180);
part_type_orientation( part_ground[3] ,0,360,1,0,0);
//part_type_blend( part_ground[0],a[28]);
part_type_life( part_ground[3],20,40);

part_coin = part_type_create();
part_type_sprite(part_coin,spr_pixel_coin,1,1,0);
part_type_size( part_coin,1.5,1.5,-0.1,0);
//part_type_colour3( pt,a[7],a[8],a[9]);
part_type_alpha3( part_coin,0.5,1,0);
part_type_speed( part_coin,0,5,0.1,0);
part_type_direction( part_coin,0,360,1,0);
part_type_gravity( part_coin,0,0);
part_type_orientation( part_coin ,0,0,0,0,0);
part_type_blend( part_coin,1);
part_type_life( part_coin,10,20);
// Store the current particle to spawn depending on the terrain
spawn_part = part_ground[0];
// Mouse x and y custom variables
Mx = 0;
My = 0;
//show the left joystick on the Gui while we touch the screen...
show_stick = 0;
grounded = 0;

