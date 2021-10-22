///Draw the node sprite
if(target)
{//Draw highlighted the sprite node
 gpu_set_blendmode(bm_add);
 draw_sprite_ext(spr_bone,1,x1,y1,radx,radx,0,color,1);
 draw_sprite_ext(spr_4_way,0,x1,y1,radx,radx,0,c_white,1);
 gpu_set_blendmode(bm_normal);
}
else
{
 //Draw the regular blend mode
 draw_sprite_ext(spr_bone,image_index,x1,y1,radx,radx,0,color,1);
}

                       

