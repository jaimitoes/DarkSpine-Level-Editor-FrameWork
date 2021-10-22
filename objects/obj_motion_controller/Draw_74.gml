// Draw interface data representing lines from the start value of a translation to the end.
vertex_begin(buffer_col,format_col);
var vec = dks_cord_object_to_screen(tween_node[0], vcam, pcam, Dw, Dh);
if(vec[0] != -1)
{
 scr_vertex_add_point_col(buffer_col, vec[0], vec[1],depth, c_red, 1);
} 
vec = dks_cord_object_to_screen(tween_node[1],vcam,pcam,Dw,Dh);
if(vec[0] != -1)
{
 scr_vertex_add_point_col(buffer_col, vec[0], vec[1], depth, c_lime, 1);
} 
if is_array(target.tweenS)
{
 var s = array_length(tween_sequence);
 for(var i = 0; i<s; i++)
 {
  vec = dks_cord_object_to_screen(tween_sequence[i],vcam,pcam,Dw,Dh);
  if(vec[0] != -1)
  {
   scr_vertex_add_point_col(buffer_col, vec[0], vec[1], depth, c_yellow, 1);
  } 
 }
}
vertex_end(buffer_col);
vertex_submit(buffer_col, pr_linestrip, -1);