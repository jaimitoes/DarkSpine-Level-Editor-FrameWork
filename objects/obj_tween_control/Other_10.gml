if is_array(variables)
{
 dks_array_update(val,variables);
 TweenOnStart = real(val[0]);
 TweenProp = real(val[1]);
 TweenCallBack = real(val[2]);
 CallScript = asset_get_index(val[3]);
    if(parent)
    { 
     with(child[0])
     {
      if is_array(tween)
      {
       var s = array_length(tween)
       for(var i =0; i<s; i++)
       { 
        if TweenExists(tween[other.TweenProp])
        {
         if(!other.TweenOnStart)
         {
          if TweenIsPlaying(tween[i])
          {
           TweenStop(TweensTarget(id))
          }
          else
          {
           have_tween = 0;
          }
         }
        
         if(other.TweenCallBack)
         {
          TweenAddCallback(tween[other.TweenProp],TWEEN_EV_FINISH,id,other.CallScript);
         } 
         break;
        } 
       }
      }
     }
    }
}
instance_destroy();

