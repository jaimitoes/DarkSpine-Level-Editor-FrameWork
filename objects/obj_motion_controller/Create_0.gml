event_inherited();
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
//Get the id of the Deco creator
creator = obj_deco_creator;
with(creator)
{
	dks_destroy_tools();
}
// Get the id of the creator buffer and format responsible to draw the geometry interface
buffer_col = obj_deco_creator.buffer_col;
format_col = obj_deco_creator.format_col;
// Get the target id of the Deco creator
target = creator.target;
// Get the depth of the Deco creator object, substract 1 unit to get the correct draw order
depth = obj_deco_creator.depth-1;
// Store some customized colours.
dark_gray = make_colour_rgb(84,84,84);
red_pastel = make_colour_rgb(163,57,57);
orange_pastel = make_colour_rgb(217,128,41);
lime_pastel = make_colour_rgb(143,184,94);
yellow_pastel = make_colour_rgb(214,216,36);
node_color = make_color_rgb(57,163,149);
node_b1_color = make_color_rgb(227,174,63);
node_b2_color = make_color_rgb(167,67,142);
// Create a structure to store the default Tween Deco properties for our Deco objects
prop_set[0] = "x";//  X coordinate
prop_set[1] = "y";//  Y coordinate
prop_set[2] = "xs";// X scale
prop_set[3] = "ys";// Y scale
prop_set[4] = "an";//angle
prop_set[5] = "al";//alpha blending
prop_set[6] = "bl";//image blending
prop_set[7] = "z";//depth
prop_set[8] = "xr";//x_rotation
prop_set[9] = "yr";//y_rotation
//Storing the Default Tween Ease equations to calculate and create differents effects for our Deco objects.
// [[An update is planned for this section, adding a cubic bezier graph that we can control to create advanced customized transition effects, without the need to set
//...a custom Ease equation.]]
ease[0]= EaseLinear;
ease[1]= EaseInSine;
ease[2]= EaseOutSine;
ease[3]= EaseInOutSine;
ease[4]= EaseInCirc;
ease[5]= EaseOutCirc;
ease[6]=EaseInOutCirc;
ease[7]=EaseInCubic;
ease[8]=EaseOutCubic;
ease[9]=EaseInOutCubic;
ease[10]=EaseInExpo;
ease[11]=EaseOutExpo;
ease[12]=EaseInOutExpo;
ease[13]=EaseInQuad;
ease[14]=EaseOutQuad;
ease[15]=EaseInOutQuad;
ease[16]=EaseInQuart;
ease[17]=EaseOutQuart;
ease[18]=EaseInOutQuart;
ease[19]=EaseInQuint;
ease[20]=EaseOutQuint;
ease[21]=EaseInOutQuint;
ease[22]=EaseInBounce;
ease[23]=EaseOutBounce;
ease[24]=EaseInOutBounce;
ease[25]=EaseInBack;
ease[26]=EaseOutBack;
ease[27]=EaseInOutBack;
ease[28]=EaseInElastic;
ease[29]=EaseOutElastic;
ease[30]=EaseInOutElastic;
// Create the i temporary variable to use in some loops.
var i;
// Creating the key player reel using the button system, in this case we´re creating 8 buttons that controls the key player bar of our TweenBoard.
key_player = dks_button_reel_create("right",8,0,192,32, 32, 16,16,0,orange_pastel, dark_gray,dark_gray,orange_pastel,spr_button_32);
//This array check the current status of the player, like if is currently playing an animation.
k_play[7]= 0;
//Creating a Reel of buttons to Destroy the Tween Data inserted in the individual slots that controls the Tween properties of our Deco object.
key_dest = dks_button_reel_create("right",10,0,224,32, 32, 16,16,0,red_pastel, dark_gray,dark_gray,red_pastel, spr_button_32);
// This keys activate the slots properties, while one propertie key is deactivated, in the moment to insert data from the tween panel...
//...the Deco object don´t take in account the unselected slot. In that way, you can manage different objects only inserting the neccesary data for each one.
key_set = dks_button_reel_create("right",10,0,256,32, 32, 16,16,0,orange_pastel, dark_gray,dark_gray,orange_pastel, spr_button_32);
// THe key_type buttons is created to select and manage the default properties, by touching one of this keys, we are ready to start setting up the Tween values.
key_type = dks_button_reel_create("right",10,0,288,32, 32, 16,16,0,lime_pastel, dark_gray,dark_gray,lime_pastel, spr_button_32);
/// Making a loop to Add text identifying the default features for every key
for(i=0;i<10;i++)
{
 
 dks_button_add_text(key_dest, i, "*");
 dks_button_add_text(key_set, i, "||");
 dks_button_add_text(key_type, i, prop_set[i]);
 k_set[i] = 0;
 rep_mode[i][0]= TWEEN_MODE_ONCE;
 rep_mode[i][1]= TWEEN_MODE_BOUNCE;
 rep_mode[i][2]= TWEEN_MODE_PATROL;
 rep_mode[i][3]= TWEEN_MODE_LOOP;
 rep_mode[i][4]= TWEEN_MODE_REPEAT;
 rmode[i]= 0;
 tweener[i] =0;
}

///Under construction, set a series of virtual buttons to manage the adjustments of certains values of the scrach bars
key_minus = dks_button_reel_create("down",12,0,320,32,32,16,16,0,orange_pastel, dark_gray,dark_gray, orange_pastel, spr_button_32);
key_plus  = dks_button_reel_create("down",12,288,320,32,32,16,16,0,orange_pastel, dark_gray,dark_gray, orange_pastel, spr_button_32);
// Add text to the current series of buttons
for(i=0;i<12;i++)
{
 dks_button_add_text(key_minus, i, "-");
 dks_button_add_text(key_plus, i, "+");
 par_xoffset[i]=0;
}
// ScrachPad bars, set analogics buttons to manage the different properties of our tweens. 
bar = dks_button_reel_create("down",12,32,320,256,32,96,14,1,orange_pastel, orange_pastel,dark_gray, dark_gray, spr_button_256);
// Set the texts of the default bar properties to set a new Tween to your Deco object.
dks_button_add_text(bar, 2,"       Delay:");
dks_button_add_text(bar, 3,"        Dura:");
dks_button_add_text(bar, 4,"   Start Val:");
dks_button_add_text(bar, 5,"   Final Val:");
dks_button_add_text(bar, 6,"   Hue Start:");
dks_button_add_text(bar, 7,"   Sat Start:");
dks_button_add_text(bar, 8,"   Val start:");
dks_button_add_text(bar, 9,"     Hue End:");
dks_button_add_text(bar, 10,"    Sat End:");
dks_button_add_text(bar, 11,"    Val End:");
// Reset the default colors of the Tween Blend properties: In this case, we will update dinamically this buttons to exclusively manage the Tween Blending properties.
dks_button_add_colour(bar, 6, dark_gray, dark_gray,orange_pastel, orange_pastel);
dks_button_add_colour(bar, 7, dark_gray, dark_gray,orange_pastel, orange_pastel);
dks_button_add_colour(bar, 8, dark_gray, dark_gray,orange_pastel, orange_pastel);
dks_button_add_colour(bar, 9, dark_gray, dark_gray,orange_pastel, orange_pastel);
dks_button_add_colour(bar, 10, dark_gray, dark_gray,orange_pastel, orange_pastel);
dks_button_add_colour(bar, 11, dark_gray, dark_gray,orange_pastel, orange_pastel);
// Key_get is the creation of 2 buttons to manage the insertion and extraction of Tween Data from our Deco Objects
key_get = dks_button_reel_create("right",2,32,696,128, 32, 64,12,0,lime_pastel, dark_gray,dark_gray,lime_pastel, spr_button_128x24);
dks_button_add_text(key_get, 0, "insert_data");
dks_button_add_text(key_get, 1, "get data");
// Now we are going to make a quick access to manage the tween properties, creating 1 input box for each bar property.
button_input_bar = dks_button_reel_create("down",10,bar[2][0]+140,bar[2][1],96,32,0,0,0,orange_pastel, orange_pastel,dark_gray, orange_pastel,spr_button_128x24);
// Create a set of buttons in case of sequences
button_sequence_info = dks_button_reel_create("down",6, 132,4,128,24,64,12,0,orange_pastel, orange_pastel, dark_gray, orange_pastel, spr_button_256);
dks_button_add_text(button_sequence_info, 0, "Ease:");
dks_button_add_text(button_sequence_info, 1, "Delay:");
dks_button_add_text(button_sequence_info, 2, "Duration:");
dks_button_add_text(button_sequence_info, 3, "CallStart:");
dks_button_add_text(button_sequence_info, 4, "CallEnd:");
dks_button_add_text(button_sequence_info, 5, "CallStop:");
button_sequence_input = dks_button_reel_create("down",6, 230,4,128,24,8,0,0,orange_pastel, orange_pastel, dark_gray, orange_pastel, spr_button);
node_input = -1;
input_node_created = 0;
/// Create a set of buttons giving the possibility to add arguments hover the callback scripts
button_argument_add = dks_button_reel_create("right", 3, 390, 4, 256, 24, 140, 12, 0, lime_pastel, dark_gray, dark_gray, lime_pastel, spr_button_256);
dks_button_add_text(button_argument_add, 0, "CallStart add arguments");
dks_button_add_text(button_argument_add, 1, "CallEnd add arguments");
dks_button_add_text(button_argument_add, 2, "CallStop add arguments");
button_argument_del = dks_button_create(button_argument_add[0][2]-31, button_argument_add[0][3]-23,24,24,16,12 ,dark_gray, red_pastel, red_pastel, dark_gray, spr_button_24);
button_argument_del = dks_button_add(button_argument_del, button_argument_add[1][2]-31, button_argument_add[1][3]-23,24,24,16,12, dark_gray, red_pastel, red_pastel, dark_gray, spr_button_24);
button_argument_del = dks_button_add(button_argument_del, button_argument_add[2][2]-31, button_argument_add[2][3]-23,24,24,16,12, dark_gray, red_pastel, red_pastel, dark_gray, spr_button_24);
dks_button_add_text(button_argument_del, 0, "X");
dks_button_add_text(button_argument_del, 1, "X");
dks_button_add_text(button_argument_del, 2, "X");
button_callStart_info = 0;
button_callEnd_info = 0;
button_callStop_info = 0;
button_callStart_input = 0;
button_callEnd_input = 0;
button_callStop_input = 0;
callstart_input = -1;
callend_input = -1;
callstop_input = -1;
show_arguments = 1;
button_column_copy = dks_button_create(button_argument_add[0][0], button_argument_add[0][1], 24, 24, 16, 12 , dark_gray, yellow_pastel, yellow_pastel, dark_gray, spr_button_24);
button_column_copy = dks_button_add(button_column_copy, button_argument_add[1][0]+2, button_argument_add[1][1], 24, 24, 16, 12 ,dark_gray, yellow_pastel, yellow_pastel, dark_gray, spr_button_24);
button_column_copy = dks_button_add(button_column_copy, button_argument_add[2][0]+2, button_argument_add[2][1], 24, 24, 16, 12 ,dark_gray, yellow_pastel, yellow_pastel, dark_gray, spr_button_24);
button_column_paste = dks_button_create(button_column_copy[0][2], button_column_copy[0][3]-24, 24, 24, 16, 12, dark_gray, yellow_pastel, yellow_pastel, dark_gray, spr_button_24);
button_column_paste = dks_button_add(button_column_paste, button_column_copy[1][2]+2, button_column_copy[1][3]-24, 24, 24, 16, 12 ,dark_gray, yellow_pastel, yellow_pastel, dark_gray, spr_button_24);
button_column_paste = dks_button_add(button_column_paste, button_column_copy[2][2]+2, button_column_copy[2][3]-24, 24, 24, 16, 12 ,dark_gray, yellow_pastel, yellow_pastel, dark_gray, spr_button_24);
dks_button_add_text(button_column_copy,0,"C");
dks_button_add_text(button_column_copy,1,"C");
dks_button_add_text(button_column_copy,2,"C");
dks_button_add_text(button_column_paste,0,"P");
dks_button_add_text(button_column_paste,1,"P");
dks_button_add_text(button_column_paste,2,"P");
column_copy = "null";
script_copy = "null";

// This variable identifies the property that we are currently handling.
current_set= 0;
// This variable prevents errors while we are managing the key player, if a targeted tween is playing, you must to stop this to turn this variable true.
can_play = 1;
// Set the Default values to all properties parameters while we start the Tween Panel
for (var i =0;i<10;i++)//propiedades
{ 
  param[i][0] = ease[0];
  for  (var j =1;j<12;j++)//barras
 {
  param[i][j]= 0;
 }

}
// The variable k_play are booleans that controls the Key player set of buttons, the green set of buttons is responsible to play all Tween in the world...
//... while the orange one is responsible to play the individual targeted Deco Object
k_play[0]= 1;

/*Set to false the physics properties
is_physics = false;
// Set the Defalut transformations
x_rotation = 0;
y_rotation = 0;
bind_target = noone;
*/
dks_set_offset(id,Mxd, Myd);
// Set the ghosting properties to manage dinamically our Deco objects, creating a temporally familly of nodes that controls our target at default Start to its final sequence.
// In that way, the temp ghosted objects copy all the current data stored into a Deco object to reproduce the best fidelity from the editor.
// Get the temporary value to check if the selected Deco Object is a parent and if is currently managing a family.
var par = target.parent;
// UnParenting our targeted object to make a copy of your properties
target.parent = 0;
//Creating the ghosthed sequenced objects
dks_object_copy(target);
with(target)
{
 other.tween_node[0] = dks_object_paste(x,y, object_index);
 other.tween_node[1] = dks_object_paste(x,y, object_index);
}
tween_sequence = 0;
//Set the default data for the ghosted objects and setting a special draw method to it.
tween_node[0].start_color = c_red;
tween_node[1].start_color = c_lime;
tween_node[0].Dmethod = tween_node[0].draw_method;
tween_node[1].Dmethod = tween_node[1].draw_method;
tween_node[0].draw_method = dks_draw_tween_node;
tween_node[1].draw_method = dks_draw_tween_node;
// Reseting the previous value of our Deco object telling us if is a parent or not.
target.parent = par;

// All the parameters values of our Tween Panel are setted into local coordinates, giving us the possibility translate or modify our deco object...
///...what we are doing is to associate the current properties of our Deco object with the setted parametters of our Tween Panel.
tween_node[0].x = target.x+other.param[0][4];
tween_node[0].y = target.y+other.param[1][4];
tween_node[0].image_xscale = target.image_xscale +other.param[2][4];
tween_node[0].image_yscale = target.image_yscale +other.param[3][4]; 
tween_node[0].image_angle = target.image_angle + other.param[4][4];
tween_node[0].image_alpha = target.image_alpha + other.param[5][4];
tween_node[0].depth = target.depth + other.param[7][4];
tween_node[0].x_rotation = target.x_rotation + other.param[8][4];
tween_node[0].y_rotation = target.y_rotation + other.param[9][4];

tween_node[1].x = target.x+other.param[0][5];
tween_node[1].y = target.y+other.param[1][5];
tween_node[1].image_xscale = target.image_xscale +other.param[2][5];
tween_node[1].image_yscale = target.image_yscale +other.param[3][5];
tween_node[1].image_angle = target.image_angle + other.param[4][5];
tween_node[1].image_alpha = target.image_alpha + other.param[5][5];
tween_node[1].depth = target.depth + other.param[7][5];
tween_node[1].x_rotation = target.x_rotation + other.param[8][5];
tween_node[1].y_rotation = target.y_rotation + other.param[9][5];
// This variable tell us if a Tween ghosted node is selected...
node_target = noone;
last_node = noone;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Store all user event into an array
Ev[0] = ev_user0; 
Ev[1] = ev_user1; 
Ev[2] = ev_user2; 
Ev[3] = ev_user3; 
Ev[4] = ev_user4; 
Ev[5] = ev_user5; 
Ev[6] = ev_user6; 
Ev[7] = ev_user7; 
Ev[8] = ev_user8; 
Ev[9] = ev_user9; 
Ev[10] = ev_user10; 
Ev[11] = ev_user11; 
Ev[12] = ev_user12; 
Ev[13] = ev_user13; 
Ev[14] = ev_user14; 
Ev[15] = ev_user15; 
vcam = obj_deco_creator.vcam;
pcam = obj_deco_creator.pcam;
Dw = creator.Dw;
Dh = creator.Dh;
dks_tweener_get_data(target);