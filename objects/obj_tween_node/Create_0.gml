/// This object is called from the object "obj_motion_controller" and is responsible to draw the ghosted...
//...tween from a Deco object while this one contains tween data. [This object is controlled from the "obj_motion_controller" object.
event_inherited();
// Get the id of the Motion controller object
creator = obj_motion_controller;
// Get the id of the colour shader script
shader = shd_colour;
// Get the uniform shader
u_color = shader_get_uniform(shader,"u_color");
// Set the target to be the same as Creator object
target = creator.target;
// Set the default colour channels values
R = 0.5;
G = 0.5;
B = 0.5;
// Set a simple timer
time = 60;
// Get the current colour blending
start_color = c_white;
//node variables
ease = "EaseLinear";
delay = 0;
duration = 1;
callstart = "null";
callend = "null";
callstop = "null";
callstart_arg = 0;
callend_arg = 0;
callstop_arg = 0;