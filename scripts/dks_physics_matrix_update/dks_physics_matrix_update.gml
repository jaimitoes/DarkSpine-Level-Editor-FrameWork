/// @description dks_physics_matrix_update();
function dks_physics_matrix_update() 
{
	mtx = 0;
	mtx = matrix_build(phy_com_x,phy_com_y,depth,x_rotation,y_rotation,phy_rotation,image_xscale,image_yscale,z_scale);
}