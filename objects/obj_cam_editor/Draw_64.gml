/// @description CAMERA DEBUG
// By pressing F11 in 3D mode
if(show_camera_debug)
{
 projmatgui2D = camera_get_proj_mat(Cam);
 projmatgui3D = camera_get_proj_mat(Cam3D);
 viewmatgui2D = camera_get_view_mat(Cam);
 viewmatgui3D = camera_get_view_mat(Cam3D);
 worldmat = matrix_get(matrix_world);	
 draw_set_halign(fa_right);
 draw_set_valign(fa_middle);
 var w = display_get_gui_width()-4;
 draw_text(w, 20, "2D Projection matrix = " + string(projmatgui2D));
 draw_text(w, 40, "2D View matrix = "       + string(viewmatgui2D));
 draw_text(w, 60, "3D Projection matrix = " + string(projmatgui3D));
 draw_text(w, 80, "3D View matrix = "       + string(viewmatgui3D)); 
 draw_text(w, 120, "Camera X =" + string(Cx));
 draw_text(w, 140, "Camera Y =" + string(Cy));
 draw_text(w, 160, "Camera Width =" + string(Cw));
 draw_text(w, 180, "Camera Height =" + string(Ch));
 draw_text(w, 200, "Fov =" + string(fov));
 draw_text(w, 220, "Object X =" + string(x));
 draw_text(w, 240, "Object Y =" + string(y));
 draw_text(w, 260, "Mouse X =" + string(Mxd));
 draw_text(w, 280, "Mouse Y =" + string(Myd));
 draw_text(w, 300, "matrix_world = " + string(worldmat));
 if(target != noone)
 {
  draw_text(w, 320, "Target X = " + string(target.x));
  draw_text(w, 340, "Target Y = " + string(target.y));
 }
 draw_text(w, 360, "Camera depth = " + string(depth));
 draw_text(w, 380, "Camera Z = " + string(z));
 draw_text(w, 400, "Creator depth = " + string(obj_deco_creator.depth)); 
 draw_text(w, 420, "Aspect = " + string(aspect));
 draw_text(w, 440, "Total Fov = " + string(Fov));
 draw_text(w, 460, "Mouse XD = " + string(global.mouse_xd));
 draw_text(w, 480, "Mouse YD = " + string(global.mouse_yd));
 draw_text(w, 500, "Device gui X = " + string(Dx));
 draw_text(w, 520, "Device gui Y = " + string(Dy));
}