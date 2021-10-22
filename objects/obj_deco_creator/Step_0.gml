/// @description Check to avoid non updated properties
Dx = device_mouse_x_to_gui(0);
Dy = device_mouse_y_to_gui(0);
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
if keyboard_check_pressed(vk_anykey)
{
 switch(keyboard_key)
 { 
  // Normally, on big levels, you can create and delete object...
  //Each action can affect the performance in fps of our level, 
  //since we alter the drawing order according to the image that we have assigned, 
  //this script rearranges the sequence so that our gpu suffers as little as possible when drawing.
  case vk_f1 : dks_pipeline_optimize();break;// 
  /// F2 are stored on our Editor Camera, with this key, you can switch between a 2d or 3d perspective;
  case vk_f3 : show_interface = !show_interface;break;
  /// F4 are stored on our Editor Camera, with this key, we can set the defaut 2d perspective while you unlock the camera rotation;
  /// Show the collider presets and wireframe buffer from the targeted deco object;
  case vk_f5 : global.show_collision = !global.show_collision;break;
  /// Show the collider presets and wireframe buffer from all deco objects;
  case vk_f6 : global.all_collision  = !global.all_collision;break;
  /// Standard YoyoGames debug overlay;
  case vk_f12 : debug_overlay = !debug_overlay;show_debug_overlay(debug_overlay);break;
  /// Exit from the editor saving the current level state on a temporary workspace Json file...
  case vk_escape: 
  if modo != mode.animator
  {
   //create a variable selecting an Enumerated question.
   var quest = text_question[question.Close_program][0];
   var st_wid = string_width(quest + "?");
   //Set the position of the imput panel and set the text variable information, you have extra text input data on the argument9 if you want to add extra info...
   //This Text Question system stored on a 2D array have the abillity to execute the data stored on the second value of every row, in all cases, the value 1.
   dks_question(window_get_width()/2-256, window_get_height()/2-256, st_wid,256,dark_gray,node_color,node_color,dark_gray,quest,"?");
  } 
  else
  {
	dks_editor_go_to_edit_mode();exit;  
  }
 }
}

// Check the previous mode, if this does not match with the current mode, the interface and deco objects Data are updated.
if(last_modo != modo)
{
 menu_setters = setter.closed;
 last_modo = modo;
 dks_check_deco_prop();
 last_setter = menu_setters;
}
// Check the previous setter, if this does not match with the current tool, the interface and deco objects Data are updated.
if (last_setter != menu_setters)
{
 last_setter = menu_setters;
 dks_check_deco_prop();
}
/// check nearest  accesible deco object.
near = dks_mouse_deco_meeting(Dx, Dy, obj_deco);

// Update the offset between our mouse and the targeted object.
if mouse_check_button_pressed(mb_left)
{
 dks_set_offset(id, Mxd, Myd);
}
// The Question panel system, 0 close the panel and cancel the action, 1 execute the script associated to the current panel 2D array and row 1.
if instance_exists(obj_question)
{
 //Left click to interact with the panel
 if mouse_check_button_released(mb_left)
 {
  var press = dks_button_press(obj_question.button_question);
  switch(press)
  {
   case 0 : with(obj_question){instance_destroy()};break;
   case 1 : dks_question_execute();break;
  }
 }
 // By pressing the ENTER key, we do the same action as before, executing the associated script in the current panel.
 if keyboard_check_pressed(vk_enter)
 {
  dks_question_execute();
 }
 switch(menu_setters)
 {
  case setter.level: script_execute(script_mode[modo]);break;
 }
}
else
{
 // If a question panel does not exists, this automatic state machine execute the current mode, this is very efficent and allows you to extend the DarkSpine tool.
 script_execute(script_mode[modo]);
}





