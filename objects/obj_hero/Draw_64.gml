/// Android GamePad Draws
if(os_type = os_android)
{
 ///While we touch the half left screen (executed in the step event with the variable gamepad_script)
 if(show_stick)
 {
  draw_sprite_ext(spr_bone,0,Mx,My,2,2,0,c_orange,0.5);
 }
 //Draw the half right virtual buttons
 var a = b_virtual_jump;
 draw_sprite_ext(a[0][15],0,a[0][0]+128,a[0][1]+128,2,2,0,a[0][7],0.5);
 a = b_virtual_attack;
 draw_sprite_ext(a[0][15],0,a[0][0]+128,a[0][1]+128,2,2,0,a[0][7],0.5);
}   

