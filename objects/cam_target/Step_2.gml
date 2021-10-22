/// Camera Updates
// Global variable to adjust interface coordinates relative to the view size
if(global.start_3d)
{
 event_user(2);
}
else
{
 event_user(1);
}
global.ratio = Cw/original_w;
global.Zoom = 1/global.ratio; 
aspect = Cw/Ch;
if (fov != 0)
{
 Fov = fov;
}
else
{
 Fov = 1;	
}