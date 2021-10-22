event_inherited();
//Get the id of the selected Deco object from the Creator object
obj_deco_creator.target = id;

// Set the custom tween variable
t_var1= 0;
// Get the creator id
creator = obj_deco_creator;
// Set the depth in the same value as the creator object
depth = creator.depth;
// Check if the rectangle area selector is drawn
gui_rectangle = 0;
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
Dx = device_mouse_x_to_gui(0);
Dy = device_mouse_y_to_gui(0);
Dxoff = Dx;
Dyoff = Dy;
// Set the offset relative of a set of variables stored in the following script:
dks_set_offset(id,Mxd, Myd);









