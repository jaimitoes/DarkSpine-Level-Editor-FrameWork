function dks_draw_2D_blend() 
{
	gpu_set_blendmode(blend_mode);
	draw_self();
	gpu_set_blendmode(bm_normal);
}