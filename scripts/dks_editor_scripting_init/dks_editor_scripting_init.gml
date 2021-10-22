///For the moment limited to 15 variables per object
function dks_editor_scripting_init() 
{
	// The map stores a set of lists, keyed using the same name of our custom objects
	// This data its only called one time in the compilation
	// These data do not interfere in the final version of your video game, they are only informative data to extend the customization section of our objects.
	var_map = ds_map_create();
	///TWEEN PATHS
	dks_editor_scripting_add(obj_tween_path,"Ease","Mode","Duration","Ob Collider","TweenTarget","Destroy");
	dks_editor_scripting_add(obj_tween_path_particles,"Ease","Mode","Duration","Ob Collider","TweenTarget","Destroy");
	dks_editor_scripting_add(obj_tween_path_creator,"Ease","Mode","Duration","Ob Collider","TweenTarget","Destroy","Ob Spawn");
	dks_editor_scripting_add(obj_tween_path_creator_depth,"Ease","Mode","Duration","Ob Collider","TweenTarget","Destroy","Ob Spawn","Z Active","NewDepth");
	//TWEEN WITH THE COORDINATES FROM A HIERARCHY OF OBJECTS
	dks_editor_scripting_add(obj_tween_objects,"Ease","Delay","Duration","Loop");
	//TEXT
	///OBj draw text (you can select a draw method script);
	dks_editor_scripting_add(obj_draw_text,"CurrentFont","PreviousFont", "Text", "3D");
	//CAMERA
	//cam target
	dks_editor_scripting_add(cam_target,"ZoomSpeed","3D Cam","View_wview","View_hview","X-offset","Y-offset","Room Limit","Depth","Lerp SpeedX","Lerp SpeedY","FieldOfView");
	///Cam target set
	dks_editor_scripting_add(obj_cam_set,"View Width","3D Cam");
	///CHARACTERS
	//Player hero
	dks_editor_scripting_add(obj_hero,"Force Left","Force Right","Max Jump","Max LeftSpeed","Max RightSpeed","Max DashLeft","Max DashRight","Fall inPixels","ImageSpeed","State");
	//Ingame triggers
	/// Layer jump
	dks_editor_scripting_add(obj_layer_jump,"ActiveGroup","JumpForce","Z Position","Object TimeStep","Camera TimeStep","Camera_Delay");
	///Level warping
	dks_editor_scripting_add(obj_level_warp, "Level Folder", "Level Name");
	// shader backround
	dks_editor_scripting_add(obj_back_move,"Speed X", "Speed Y");
	//shader shockwave
	dks_editor_scripting_add(obj_shader_shockwave,"WaveTime","ResolutionX","ResolutionY","Amplitude","Speed","Refraction","Width","Pos X","Pos Y");
	//shader mosaic
	dks_editor_scripting_add(obj_shader_mosaic,"Pixels","PosX","PosY","ResolutionX","ResolutionY");
	//shader wave
	dks_editor_scripting_add(obj_shader_wave, "Pos X","Pos Y","Res X","Res Y","WaveSpeed","WaveAmount","Speed");
	//shader wave move
	dks_editor_scripting_add(obj_wave_move, "Pos X","Pos Y","Res X","Res Y","WaveSpeed","WaveAmount","Speed","Uv speedX","Uv speedY");
	//shader greyscale
	dks_editor_scripting_add(obj_shader_greyscale,"Fade");
	//shader LED
	dks_editor_scripting_add(obj_shader_led, "Led Size","Brightness","Res X","Res Y");
	//shader Magnify
	dks_editor_scripting_add(obj_shader_magnify,"Res X","Res y","Radius","Zoom Min","Zoom Max");
	//shader Ripple
	dks_editor_scripting_add(obj_shader_ripple,"Time","Res X","Res Y","Amount","Distorsion","Wave Speed");
	//shader Refraction
	dks_editor_scripting_add(obj_shader_refraction,"Res X","Res Y","Amount","Normal Tex");
	///Shader Radial blur
	dks_editor_scripting_add(obj_shader_radial_blur,"Res X","Res Y","BlurOffset","Brightness");
	//Ambient light
	dks_editor_scripting_add(obj_ambient,"Blend Source","Blend Dest","Draw Repeat");
	///Vertex light simple
	dks_editor_scripting_add(obj_vertex_light,"Fade ScaleX","Fade ScaleY","Blend Source","Blend Dest");
	///vertex light extended
	dks_editor_scripting_add(obj_vertex_light_ext,"Fade ScaleX","Fade ScaleY","Hspeed","Vspeed","Blend Source","Blend Dest");
	/// Particle family
	dks_editor_scripting_add(obj_particle_system,"Burst Script");
	/// Blend extended
	dks_editor_scripting_add(obj_blend_mode,"BlendSource","BlendDest");
	/// Platform component
	dks_editor_scripting_add(obj_platform,"Object Follow ","Parent Follow");
}