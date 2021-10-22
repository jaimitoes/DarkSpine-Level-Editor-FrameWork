/// @description dks_draw_vertex_rectangle(x1, y1, x2, y2, outline width)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  outline width
function dks_draw_vertex_rectangle(argument0, argument1, argument2, argument3, argument4) 
{
	var x1, y1, x2, y2, h;
	x1 = min(argument0, argument2);
	y1 = min(argument1, argument3);
	x2 = max(argument0, argument2);
	y2 = max(argument1, argument3);
	h = (argument4/2);
	//draw rectangle
	draw_primitive_begin(pr_trianglestrip)
	draw_vertex(x1-h, y1-h);
	draw_vertex(x1+h, y1+h);
	draw_vertex(x2+h, y1-h);
	draw_vertex(x2-h, y1+h);
	draw_vertex(x2+h, y2+h);
	draw_vertex(x2-h, y2-h);
	draw_vertex(x1-h, y2+h);
	draw_vertex(x1+h, y2-h);
	draw_vertex(x1-h, y1-h);
	draw_vertex(x1+h, y1+h);
	draw_primitive_end();
}