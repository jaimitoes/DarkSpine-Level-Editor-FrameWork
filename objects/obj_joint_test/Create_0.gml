///Create a basic joint physics test in simulation mode (useful to test physics, this object i not created in your final game)  
event_inherited();// Inherit deco data
// Create a physics initial structure 
dks_phyprops_create();
// Set to kinematic this joint test
phyprops[| physics.kine] = 1;
// Set like a physics sensor object this joint
phyprops[| physics.sensor] = 1;
// Create a circle fixture 
fixture_create_circle();
is_physics = true;
// This variable check if a joint is created
joint_created =false;
// Store the id of the joint
joint_id = noone;
// Set the alpha to 0
image_alpha = 0;
// 3d mouse
Mxd = global.mouse_xd;
Myd = global.mouse_yd;