/// @description dks_input_copy()    
function dks_input_copy() 
{
	var txt, minpos, maxpos;
	minpos = min(cursor_pos, cursor_pos2);
	maxpos = max(cursor_pos, cursor_pos2);
	txt = string_copy(text, minpos+1, maxpos-minpos);
	clipboard_set_text(txt);
}