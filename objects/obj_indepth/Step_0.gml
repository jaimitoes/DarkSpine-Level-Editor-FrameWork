Dist = abs(depth - cam_target.z)

if(Dist >value)
{
 if (!in_draw)
 {
  s = array_length(child);
  for(i = 0; i<s; i++)
  {
   child[i].visible = 1;
  }
  in_draw = 1;
 }
}
else
{
 if (in_draw)
 {
  s = array_length(child);
  for(i = 0; i<s; i++)
  {
   child[i].visible = 0;
  }
  in_draw = 0;
 }
}

