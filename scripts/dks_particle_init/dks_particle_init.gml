function dks_particle_init() 
{
	button_create_particle = dks_button_reel_create("right", 2, 128,0,128,32,64,16,4,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	dks_button_add_text(button_create_particle, 0, "Create Particle");
	dks_button_add_text(button_create_particle, 1, "Destroy Particle");
	//////////////////////////////////////////////////////////////////////////////////Fa-left fa-top 
	///Particle_setters
	var text;
	text[0] ="SPRITE       animated:             strech:        random:";
	text[1] ="SIZE                      min:          max:            increase:           wiggle:"; 
	text[2] ="COLOR3               start:                    halfway:                      ending:";
	text[3] ="ALPHA3               start:                    halfway:                      ending:";
	text[4] ="SPEED                  min:          max:            increase:           wiggle:";   
	text[5] ="DIRECTION           min:          max:            increase:           wiggle:";
	text[6] ="GRAVITY         amount:                        direction:";   
	text[7] ="ORIENTATION   min:       max:          increase:          wiggle:          relative:";    
	text[8] ="BLEND           additive:                  LIFE            min:               max:"; 
	text[9] ="PARTICLES           num:             ADD PART     step:             death:"; 
	text[10]="EMITTER       enabled:        shape:                      distribution:"; 
	text[11]="REGION       xMin:              xMax:                yMin:                yMax:"; 
	//SPRITE
	button_part_sprite_info = dks_button_create( 128,64,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_sprite_info,0,text[0]);
	button_part_sprite_int = dks_button_create(278,64,12,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_sprite_int = dks_button_add(button_part_sprite_int,      368,64,12,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_sprite_int = dks_button_add(button_part_sprite_int,      456,64,12,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	//////////////////////////////////////////////////////////////////SIZE
	button_part_size_info = dks_button_create( 128,88,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_size_info,0,text[1]);
	button_part_size_int = dks_button_create(282,88,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_size_int = dks_button_add(button_part_size_int,     350,88,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_size_int = dks_button_add(button_part_size_int,     452,88,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_size_int = dks_button_add(button_part_size_int,     544,88,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	///////////////////////////////////////////////////////////////////COLOR3
	button_part_color3_info = dks_button_create( 128,112,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_color3_info,0,text[2]);
	button_part_color3_int = dks_button_create(282,112,80,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_color3_int = dks_button_add(button_part_color3_int,     416,112,80,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_color3_int = dks_button_add(button_part_color3_int,     548,112,80,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	///////////////////////////////////////////////////////////////////ALPHA
	button_part_alpha3_info = dks_button_create( 128,136,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_alpha3_info,0,text[3]);
	button_part_alpha3_int = dks_button_create(282,136,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_alpha3_int = dks_button_add(button_part_alpha3_int,     416,136,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_alpha3_int = dks_button_add(button_part_alpha3_int,     548,136,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);

	//////////////////////////////////////////////////////////////////
	button_part_speed_info = dks_button_create( 128,160,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_speed_info,0,text[4]);
	button_part_speed_int = dks_button_create(282,160,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_speed_int = dks_button_add(button_part_speed_int,     350,160,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_speed_int = dks_button_add(button_part_speed_int,     452,160,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_speed_int = dks_button_add(button_part_speed_int,     544,160,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	//////////////////////////////////////////////////////////////////7
	button_part_direction_info = dks_button_create( 128,184,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_direction_info,0,text[5]);
	button_part_direction_int = dks_button_create(282,184,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_direction_int = dks_button_add(button_part_direction_int,     354,184,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_direction_int = dks_button_add(button_part_direction_int,     456,184,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_direction_int = dks_button_add(button_part_direction_int,     544,184,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	//////////////////////////////////////////////////////////////////////////
	button_part_gravity_info = dks_button_create( 128,208,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_gravity_info,0,text[6]);
	button_part_gravity_int = dks_button_create(282,208,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_gravity_int = dks_button_add(button_part_gravity_int,     440,208,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	/////////////////////////////////////////////////////////////////////
	button_part_orientation_info = dks_button_create( 128,232,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_orientation_info,0,text[7]);
	button_part_orientation_int = dks_button_create(272,232,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_orientation_int = dks_button_add(button_part_orientation_int,     332,232,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_orientation_int = dks_button_add(button_part_orientation_int,     428,232,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_orientation_int = dks_button_add(button_part_orientation_int,     510,232,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_orientation_int = dks_button_add(button_part_orientation_int,     604,232,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);



	/////////////////////////////////////////////////////////////////////////////
	button_part_blend_info = dks_button_create( 128,256,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_blend_info,0,text[8]);
	button_part_blend_int = dks_button_create(280,256,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_life_int =  dks_button_create(452,256,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_life_int =  dks_button_add(button_part_life_int,      542,256,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);


	//////////////////////////////////////////////////////////////////////////////


	button_part_numbs_info = dks_button_create( 128,280,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_numbs_info,0,text[9]);
	button_part_numbs_int = dks_button_create(280,280,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_step_int =  dks_button_create(452,280,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_death_int = dks_button_create(542,280,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	///////////////////////////////////////////////////////////////
	button_part_emitter_info = dks_button_create( 128,304,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_emitter_info,0,text[10]);
	button_part_emitter_int = dks_button_create(276,304,36,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_emitter_int = dks_button_add(button_part_emitter_int,     348,304,90,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_emitter_int = dks_button_add(button_part_emitter_int,     520,304,90,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	//////////////////////////////////////////////


	button_part_region_info = dks_button_create( 128,328,512,24,8,2,dark_gray,dark_gray,lime_pastel,lime_pastel,spr_button_512);
	dks_button_add_text(button_part_region_info,0,text[11]);
	button_part_region_int = dks_button_create(250,328,56,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_region_int = dks_button_add(button_part_region_int,     344,328,56,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_region_int = dks_button_add(button_part_region_int,     446,328,56,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	button_part_region_int = dks_button_add(button_part_region_int,     548,328,56,24,0,1,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	////particle color
	prt_color1[0] = 0;
	prt_color1[1] = 0;
	prt_color1[2] = 255;
	prt_color1[3] = c_white;

	prt_color2[0] = 0;
	prt_color2[1] = 0;
	prt_color2[2] = 255;
	prt_color2[3] = c_white;

	prt_color3[0] = 0;
	prt_color3[1] = 0;
	prt_color3[2] = 255;
	prt_color3[3] = c_white;

	slider_particle_color1 = dks_button_reel_create("down", 3, 140,354,255,32,0,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_256);
	slider_particle_color1 = dks_button_add(slider_particle_color1,140+258,356,128,96,0,0,c_white,c_white,c_white,c_white,-1);
	slider_particle_color2 = dks_button_reel_create("down", 3, 140,454,255,32,0,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_256);
	slider_particle_color2 = dks_button_add(slider_particle_color2,140+258,456,128,96,0,0,c_white,c_white,c_white,c_white,-1);
	slider_particle_color3 = dks_button_reel_create("down", 3, 140,554,255,32,0,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_256);
	slider_particle_color3 = dks_button_add(slider_particle_color3,140+258,556,128,96,0,0,c_white,c_white,c_white,c_white,-1);
}