/// @description dks_input_set_colors(id, text color, text alpha, cursor color, cursor alpha, cursor text color)
/// @param id
/// @param  text color
/// @param  text alpha
/// @param  cursor color
/// @param  cursor alpha
/// @param  cursor text color
function dks_input_set_colors(argument0, argument1, argument2, argument3, argument4, argument5, argument6) 
{
	argument0.font_color = argument1;
	argument0.font_alpha = argument2;
	argument0.cursor_col = argument3;
	argument0.cursor_al = argument4;
	argument0.cursor_text_col = argument5;
	argument0.cursor_text_al = argument6;
}