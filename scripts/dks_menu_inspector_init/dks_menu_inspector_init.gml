function dks_menu_inspector_init() 
{
	menu_b_inspector_info = dks_button_reel_create("down",19,128,64,128,24,64,14,4,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button_256);
	menu_b_inspector_int  = dks_button_reel_create("down",19,256,64,128,24,0,7,0,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	dks_button_add_text(menu_b_inspector_info,0,"X");
	dks_button_add_text(menu_b_inspector_info,1,"Y");
	dks_button_add_text(menu_b_inspector_info,2,"Z");
	dks_button_add_text(menu_b_inspector_info,3,"X ROTATION");
	dks_button_add_text(menu_b_inspector_info,4,"Y ROTATION");
	dks_button_add_text(menu_b_inspector_info,5,"Z IMAGE_ANGLE");
	dks_button_add_text(menu_b_inspector_info,6,"X SCALE");
	dks_button_add_text(menu_b_inspector_info,7,"Y SCALE");
	dks_button_add_text(menu_b_inspector_info,8,"Z SCALE");
	dks_button_add_text(menu_b_inspector_info,9,"ALPHA");
	dks_button_add_text(menu_b_inspector_info,10,"IMAGE SPEED");
	dks_button_add_text(menu_b_inspector_info,11,"TO OBJECT");

	text_question[question.Object_transform][0] = "Insert the name of the object to swap...";
	text_question[question.Object_transform][1] = dks_object_transform_set;
	text_question[question.DrawMethod][0] = "Insert the custom draw script..."; 
	text_question[question.DrawMethod][1] = dks_draw_method_custom;
	dks_button_add_text(menu_b_inspector_info,12,"BLEND MODE");

	dks_button_add_script(menu_b_inspector_int, 12,dks_blend_mode_set);
	dks_button_add_text(menu_b_inspector_info,13,"DRAW METHOD");
	dks_button_add_script(menu_b_inspector_info, 13,dks_draw_method_input);
	dks_button_add_script(menu_b_inspector_int,13,dks_draw_method_set);
	dks_button_add_text(menu_b_inspector_info,14,"VISIBLE");
	dks_button_add_text(menu_b_inspector_info,15,"ACTIVATED");
	dks_button_add_text(menu_b_inspector_info,16,"INGAME VISIBLE");
	dks_button_add_text(menu_b_inspector_info,17,"USER EVENT");
	dks_button_add_text(menu_b_inspector_info,18,"OBJECT EXECUTE");
}