/// @description Scripts[dks_input_...]

draw_cursor = 1;
font = fontGGUI;
font_color = c_white;
font_alpha = 1;
xoffset = 2;
yoffset = 2;
cursor_col = c_black;
cursor_al = 1;
cursor_anim = 0;
cursor_anim_speed = 30;
cursor_wid = 3;
cursor_time = cursor_anim_speed;
cursor_text_col = font_color;
cursor_text_al = 1;
cursor_radius = 10;
cursor_offset = 10;
arrow_sprite = spr_cam;    
width = 32*image_xscale;
height = 32*image_yscale;
active = 0;
text = "";
cursor_pos = string_length(text);
cursor_pos2 = string_length(text);
cursor_drag = 0;
cursor_hand = 0;
cursor_hover = 0;
cursor_hand_drag = 0;
cursor_time = 30;
dclick_timer = -1;
dclick_delay = 30;
dclick_x = device_mouse_x_to_gui(0);
hold_timer = -1;
hold_delay = 35;
hold_x = device_mouse_x_to_gui(0);
scroll = 0;
scroll_max = 0;
surf = surface_create(width-(xoffset*2), height-(yoffset*2));
menu_enabled = 0;
menu_sets[0][0] = "Select";
menu_sets[1][0] = "Select All";
menu_sets[2][0] = "Copy";
menu_sets[3][0] = "Paste";
menu_sets[4][0] = "Cut";
menu_length = array_length(menu_sets);
scratch_pad = 11;
menu_yoffset = 18;
menu_select = -1;
dks_input_menu_update();
history0 = ds_stack_create();
history1 = ds_stack_create();
ds_stack_push(history0, text);
dks_input_menu_resize();




