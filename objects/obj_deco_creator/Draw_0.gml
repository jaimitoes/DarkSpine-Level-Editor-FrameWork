//Draw the room size edges...
draw_line_width(0,0,room_width,0,20);
draw_line_width(0,0,0,room_height,20);
draw_line_width(0,room_height,room_width,room_height,20);
draw_line_width(room_width,0,room_width,room_height,20);
// If the editor mode are setted to CREATE, the creator object shows the current sprite selected from the sprite menu.
// 
switch(modo)
{
 case mode.create:     draw_self();break;
 case mode.ffd_create: draw_self();break;
}
/*
vertex_begin(buffer_col,format_col);
var vec = dks_cord_screen_to_vertex(Dx, Dy,vcam,pcam,Dw,Dh);
var xx = vec[3] - vec[5]*vec[0];
var yy = vec[4] + vec[5]*vec[1];
var zz = vec[5] + vec[5]*vec[2];
show_debug_message("DX: "+string(xx));
show_debug_message("DY: "+string(yy));
show_debug_message("DZ: "+string(zz));
scr_vertex_add_point_col(buffer_col, xx, yy, zz, c_red,1);
var m = matrix_build(0,0,depth, obj_cam_editor.y_rotation, -obj_cam_editor.x_rotation,0,1,1,1);
var m1 = matrix_transform_vertex(m,xx,yy,depth);
scr_vertex_add_point_col(buffer_col, m1[0],  m1[1], depth, c_lime,1);
vertex_end(buffer_col);
vertex_submit(buffer_col,pr_linelist,-1);
*/