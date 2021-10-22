event_inherited();//Inherit the Deco data
//This variables gets the x and y offset relative to any id linked with the variable "object_follow".
xf = 0;
yf = 0;
//This variable get the id to any object that collides with the platform
target = noone;
// Set the user event custom variables 
object_follow = noone; //The platform follows an object.
val[0] = object_follow; // The first editor variable
parent_follow = 0; // While this variable comes true, this platform follows his father
val[1] = parent_follow; // The second editor variable
////////////////////////////////////

