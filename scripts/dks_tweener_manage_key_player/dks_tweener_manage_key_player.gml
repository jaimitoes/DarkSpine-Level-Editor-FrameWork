function dks_tweener_manage_key_player() 
{
	for(i=0;i<8;i++)
	{
	 var p_key_player = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),key_player[i][0],key_player[i][1],key_player[i][2],key_player[i][3]);
  if (p_key_player)
	 {
	  switch(i)
	  {         
	   case 0 : 
				k_play[@0]=1;
	   k_play[@1]=0;
	   k_play[@2]=0;
	   k_play[@3]=0;
	   k_play[@4]=0;
	   k_play[@5]=0;
	   k_play[@6]=0;
	   k_play[@7]=0;
    TweenStop(TweensTarget(target));
	   dks_tweener_tween_reset(target);
	   can_play=1;
    break;
	   case 1 :  
    k_play[@0]=0;
	   k_play[@1]=1;
	   k_play[@2]=0;
	   k_play[@3]=0;
	   k_play[@4]=0;
	   k_play[@5]=0;
	   k_play[@6]=0;
	   k_play[@7]=0;
    TweenReverse(TweensTarget(target));
    break;
	   case 2 : 
	   k_play[@0]=0;
	   k_play[@1]=0;
	   k_play[@2]=1;
	   k_play[@3]=0;
	   k_play[@4]=0;
	   k_play[@5]=0;
	   k_play[@6]=0;
	   k_play[@7]=0;
	   TweenPause(TweensTarget(target));
    break;                 
    case 3 : 
	   k_play[@0]=0;
	   k_play[@1]=0;
	   k_play[@2]=0;
	   k_play[@3]=1;
	   k_play[@4]=0;
	   k_play[@5]=0;
	   k_play[@6]=0;
	   k_play[@7]=0;
    if (can_play =1)
	   {
	    TweenPlay(TweensTarget(target));
	    can_play =0;
	   }
	   else
	   {
	   dks_message("You must to Stop the animation");
    }
				break;
    case 4 :   
				k_play[@0]=1;
	   k_play[@1]=0;
	   k_play[@2]=0;
	   k_play[@3]=0;
	   k_play[@4]=1;
	   k_play[@5]=0;
	   k_play[@6]=0;
	   k_play[@7]=0;
		  TweenStop(TweensTarget(obj_deco));
		  dks_tweener_tween_reset(obj_deco);
		  can_play=1;
	   break;
		  case 5 :  
	   k_play[@0]=0;
		  k_play[@1]=0;
		  k_play[@2]=0;
		  k_play[@3]=0;
		  k_play[@4]=0;
		  k_play[@5]=1;
		  k_play[@6]=0;
		  k_play[@7]=0;
	   TweenReverse(TweensTarget(obj_deco));
		  break;
		  case 6 : 
		  k_play[@0]=0;
		  k_play[@1]=0;
		  k_play[@2]=0;
		  k_play[@3]=0;
		  k_play[@4]=0;
		  k_play[@5]=0;
		  k_play[@6]=1;
		  k_play[@7]=0;
		  TweenPause(TweensTarget(obj_deco));
	   break;                 
	   case 7 : 
		  k_play[@0]=0;
		  k_play[@1]=0;
		  k_play[@2]=0;
		  k_play[@3]=0;
		  k_play[@4]=0;
		  k_play[@5]=0;
		  k_play[@6]=0;
		  k_play[@7]=1;
	   if (can_play =1)
		  {
		   TweenPlay(TweensTarget(obj_deco));
		   can_play =0;
		  }
		  else
		  {
		   dks_message("You must to Stop the animation");
                           
		  }
				break;
	  }
		}
 }
}