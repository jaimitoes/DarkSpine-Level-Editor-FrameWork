///Drawing the Play menu panel
if (is_playing)
{
 draw_sprite_ext(spr_play_work,0,button_play[0][0],button_play[0][1],1,1,0,image_blend,1);
 draw_sprite(spr_stop_work,0,button_play[1][0],button_play[1][1]);
}
else
{
 draw_sprite_ext(spr_stop_work,0,button_play[1][0],button_play[1][1],1,1,0,image_blend,1);
 draw_sprite(spr_play_work,0,button_play[0][0],button_play[0][1]);
}




