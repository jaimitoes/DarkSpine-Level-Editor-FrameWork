/// @description PERSPECTIVE VIEW
if(global.start_3d)
{
 var v = matrix_build(0, 0, -z-16000+Cw, y_rotation, x_rotation, z_rotation, 1, 1, 1);
 var p = matrix_build_projection_perspective_fov( Fov, aspect, 0, 31999);
 var m = camera_get_view_mat(Cam);
 var f = matrix_multiply(v,m);
 camera_set_view_mat(Cam3D, f);
 camera_set_proj_mat(Cam3D, p);
 camera_apply(Cam3D);
 vcam = camera_get_view_mat(Cam3D);
 pcam = camera_get_proj_mat(Cam3D);
}
else
{
 vcam = camera_get_view_mat(Cam);
 pcam = camera_get_proj_mat(Cam);	
}