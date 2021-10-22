function dks_callend_button_create() {
	var txt = 0;
	var s = array_length(node_target.callend_arg);
	button_callEnd_info = dks_button_reel_create("down", s, 390+258, 30, 256, 24, 40, 12, 0 , lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);
	button_callEnd_input = dks_button_reel_create("down", s, 490+258, 30, 256, 24, 0, 0, 0 , lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);
	for (var i =0; i<s; i++)
	{
		dks_button_add_text(button_callEnd_info, i, "argument"+ string(i));	
		txt[i] = node_target.callend_arg[i];	
	}
	callend_input = dks_input_list_create(button_callEnd_input, txt,show_arguments);


}
