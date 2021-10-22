if(size>0)
{
 
 gpu_set_blendmode(blend_mode);
 gpu_set_zwriteenable(false);
 dks_draw_vertex_path(sprite_index,image_blend,image_alpha, poly_list, terrain_split, v_split, segment_split,corner_left,corner_right);
 gpu_set_zwriteenable(true);
 gpu_set_blendmode(bm_normal);
 
 /*
 for(var i =0; i<size; i++)
 {
 
 child[i].visible= 0;
 draw_text(child[i].x,child[i].y,string(i));
 }*/
}


/* */
/*  */
