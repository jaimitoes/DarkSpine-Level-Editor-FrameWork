/// @description dks_input_paste()    
function dks_input_paste() 
{
	//add text from clipboard
	var txt;
	txt = clipboard_get_text()
	text = string_insert(txt, text, cursor_pos+1);
	cursor_pos += string_length(txt);
	cursor_pos2 = cursor_pos;
}