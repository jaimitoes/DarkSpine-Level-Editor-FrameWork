/// @description dks_input_create(button array2D, array pos, marginx, marginy, text, font)
/// @param buttonArray2D
/// @param  arrayPos
/// @param  marginx
/// @param  marginy
/// @param  text
/// @param  font
function dks_input_create(argument0, argument1, argument2, argument3, argument4, argument5)
{
	var a = argument0;
	var i = argument1;
 var o = instance_create_depth(a[i][0] + a[i][4], a[i][1] + a[i][5], depth-1, obj_input);
	with(o)
	{
	 var col1 = a[i][8];
	 var col2 = a[i][9];
	 width = a[i][2] -a[i][0];
	 height= a[i][3] -a[i][1];
	 xoffset = argument2;
	 yoffset = argument3;
	 text = argument4;
	 font = argument5;
	 font_color = col1;
	 cursor_col = col1;
	 cursor_text_col = col2;
	 surface_resize(surf, width, height);
	 ds_stack_push(history0, text);
	 ds_stack_clear(history1);
	}
	return o;
}
