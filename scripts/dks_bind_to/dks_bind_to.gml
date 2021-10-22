/// @description dks_bind_to(bind_target, bind_xoffset, bind_yoffset)
/// @param bind_target
/// @param  bind_xoffset
/// @param  bind_yoffset
function dks_bind_to(argument0, argument1, argument2) 
{
	var mtp=argument0.mtx;
	var xoff = argument1; 
	var yoff = argument2;
	x =  xoff*mtp[0] + -yoff*mtp[1] +mtp[12]*1;
	y = -xoff*mtp[4] +  yoff*mtp[5] +mtp[13]*1;
	image_xscale =xsoffset + (argument0.image_xscale-argument0.xsoffset);
	image_yscale =ysoffset + (argument0.image_yscale-argument0.ysoffset);
	image_angle = anoff+(argument0.image_angle-argument0.anoff);
	depth = zoff + (argument0.depth-argument0.zoff);
	x_rotation = anoffx +(argument0.x_rotation-argument0.anoffx);
	y_rotation = anoffy +(argument0.y_rotation-argument0.anoffy);
}