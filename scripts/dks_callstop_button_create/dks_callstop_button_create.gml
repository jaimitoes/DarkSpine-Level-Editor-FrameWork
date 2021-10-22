function dks_callstop_button_create() {
	var txt = 0;
	var s = array_length(node_target.callstop_arg);
	button_callStop_info = dks_button_reel_create("down", s, 390+516, 30, 256, 24, 40, 12, 0 , lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);
	button_callStop_input = dks_button_reel_create("down", s, 490+516, 30, 256, 24, 0, 0, 0 , lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);
	for (var i =0; i<s; i++)
	{
		dks_button_add_text(button_callStop_info, i, "argument"+ string(i));	
		txt[i] = node_target.callstop_arg[i];	
	}
	callstop_input = dks_input_list_create(button_callStop_input, txt,show_arguments);


}
