if is_array(variables)
{
 dks_array_update(val,variables);
 tweenx = 0;
 tweeny = 0;
 tweenz = 0;
 if (parent)
 {
  tease = asset_get_index(val[0]);
  tdelay = real(val[1]);
  tdur = real(val[2]);
  loop = real(val[3]);
  script = asset_get_index(val[4]);
  var xx,yy;
  if(is_physics)
  {
   xx = "phyx";
   yy = "phyy";
   
  }
  else
  {
   xx = "x";
   yy = "y";
  }
  
  tweenx[0] = TweenFire(id,tease,0,1,tdelay,tdur,xx, x, child[0].x);
  tweeny[0] = TweenFire(id,tease,0,1,tdelay,tdur,yy, y, child[0].y);
  tweenz[0] = TweenFire(id,tease,0,1,tdelay,tdur,"depth", depth, child[0].depth);
  var s = array_length(child);
  for(var i=0; i<s-1; i++)
  {
   var t = array_length(tweenx);
   tweenx[t] = TweenMore(tweenx[i],id,child[i].tease,0,1,child[i].tdelay,child[i].tdur,xx,child[i].x, child[i+1].x);
   tweeny[t] = TweenMore(tweenx[i],id,child[i].tease,0,1,child[i].tdelay,child[i].tdur,yy,child[i].y, child[i+1].y);
   tweenz[t] = TweenMore(tweenz[i],id,child[i].tease,0,1,child[i].tdelay,child[i].tdur,"depth",child[i].depth, child[i+1].depth);
  }
  t = array_length(tweenx);
  if(loop)
  {
   
   tweenx[t] = TweenMore(tweenx[t-1],id,child[s-1].tease,0,1,child[s-1].tdelay,child[s-1].tdur,xx,child[s-1].x, x);
   tweeny[t] = TweenMore(tweenx[t-1],id,child[s-1].tease,0,1,child[s-1].tdelay,child[s-1].tdur,yy,child[s-1].y, y);
   tweenz[t] = TweenMore(tweenz[t-1],id,child[s-1].tease,0,1,child[s-1].tdelay,child[s-1].tdur,"depth",child[s-1].depth, depth);
   TweenAddCallback(tweenx[t],TWEEN_EV_FINISH,id, dks_perform_event, id, ev_other, ev_user0);
  } 
  else
  {
   if (script != dks_null)
   {
    var s = array_length(variables)
    if(s >5)
    {
     var n=0;
     array_script = 0;
     for(var i =5; i<s; i++)
     {
      array_script[n] = variables[i];
      n+=1;
     }
     TweenAddCallback(tweenx[t-1],TWEEN_EV_FINISH,id,script,array_script);
    }
    else
    {
     TweenAddCallback(tweenx[t-1],TWEEN_EV_FINISH,id,script);
    } 
   }
  }
  
 }
}

