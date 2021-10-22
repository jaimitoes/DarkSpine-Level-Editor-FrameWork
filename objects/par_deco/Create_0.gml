// Never placed in the editor, but is parent of the deco objects, chaining this initial data to the childs if we decide to inherit the create event.

image_speed = 0;// All images of the Deco objects starts with static images (This setting can be managed into the editor tweaking the inspector panel).
activated = 1; //active on start.
is_visible = 1; // visible on start.
selected = false; //Selected in multimode.
locked = false; // Selectable by the editor.
bind_xoffset = 0; // The X offset between a parent object and the childs in the world.
bind_yoffset = 0; // The Y offset between a parent object and the childs int the world.
parent = false; // Is Parent of a hierarchy of objects.
child = noone; // A child object, is part of a hierarchy whose father takes control.
bind_target =noone; // When the deco object is a child, this variables store the id of the parent.
variables = 0; // This variable store extra data to a custom array, very useful to create a component system .
//from a custom object.
mtx = 0;// This variable can be set to add a matrix array in our object, getting the ability to transform.
//vertex data and manage draw methods an collider logics... 
bone_list = -1;//Under construction, (manage bones from the editor)
is_spine = false;//check if a sprite are composed with a the skeletal animation system Spine.
x_rotation =0; // 3D X transformation variable.
y_rotation =0; // 3D Y transformation variable.
z_rotation =0; // 3D Z transformation variable.
z_scale =1; // 3D Z SCALE transformation variable.
lay_depth = 0; //This variable stores what layer our object is on.
layer_offset = 0;//This variable stores the offset between the current depth of our object and the layer depth.
draw_method = dks_draw_2D;// This variable store the draw method script used to draw our objects in the world.
spine_animation = -1; // This variable store the current animation of a Spine file. 
joint = 0; // If our deco object contains a joint. 
blend_mode = bm_normal; // The current blend mode to draw sprites.
perform_event = -1; // This variable stores an extra event that can be executed when loading a level, 
                    //it can also be used to update data of an object as well as being able to create different variables of the same object. Very useful for object scripting.
object_execute = 0; // This variable convert a Deco object into a custom scripted object defined by an user.
// Tween settings
have_tween = 0; // This variable store if a Deco object contains a tween sequence.
tween = 0; // This variable store the data of an inserted tween, converting it into an array, giving an Id to every properties includes by default.
tweenS = 0; // This variables stores the 2D array sequence properties.
tweenD = 0;// This variables stores the timeline data of the sequences.
sequence = 0; //This variables stores the nodes id of the sequence.
tweenCst = 0;//Tween call start arguments.
tweenCed = 0;//Tween call end arguments.
tweenCstop = 0;
// Store in 3 variables a decomposed color using the hsv color range.
bl_h = 0;
bl_s = 0;
bl_v = 255;

// Vertex data, this variables controls the default vertex data storage, using an universal buffer that you can customize to create interesting systems.
have_polygon = false;
poly_list = -1;
poly_off =-1;
bz1_off = -1;
bz2_off = -1;
poly_s = -1;
tri = -1;
bezier_n1 = -1;
bezier_n2 = -1;
poly_closed = 1;

/////TERRAIN SETTERS:
//Shapes
have_texture = false;
vertex_texture = -1;//sprite for shapes.
fill_image = 0;//image index for shapes.
v_texture = -1;//get texture info from the previous variables for the vertex buffers.
v_buffer = undefined;
v_format = undefined;
///Edges
have_path_texture = false;
path_texture =-1;// sprite for path
path_image = 0; // image index for path
p_texture = -1;// get texture info from the previous variables for the vertex buffers
ed = -1; // This variables store a list including all vectors composed in a vertex buffer like the smooth terrains...(giving the ability to manage this data and take the controls of collider, vertex debugging, etc...
corner_left =0; // The left side/edge texture from a non closed polygon, like textured paths
corner_right =0;// The right side/edge texture from a non closed polygon, like textured paths
buffer_path = undefined; // This variable store the buffer data of a path texture, also used to store the edges of a customized terrain.
format_path = undefined; // This variable store the format data of a path texture, also used to store the edges of a customized terrain.
smooth_terrain = 0; // This variable set your buffer to smooth, in that way, our terrain can get extra data to make a complex textured terrain composed of a larger number of triangles.
terrain_split = 2; //Adjust the 3d texture on its HORIZONTAL axis of a terrain depending on the size of this one. Textures must be created as a Power of 2 size/resolution.
v_split = 1; //Adjust the 3d texture on its VERTICAL axis of a terrain depending on the size of this one. Textures must be created as a Power of 2 size/resolution.
segment_split = 1; //Multiply the smoothness of a terrain with this variable.
col_xoff = 0; // Vertex terrains generates an automatic collider that can be customized from the editor, this variable controls the X offset of all vectors relative to the local coordinates of our object.
col_yoff = 0; // Vertex terrains generates an automatic collider that can be customized from the editor, this variable controls the X offset of all vectors relative to the local coordinates of our object.
// Set the collider offset from  the verctor sides of a non closed polygon.
corner1_xoff =0; 
corner1_yoff =0;
corner2_xoff =0;
corner2_yoff =0;
// Transforming a vertex buffer using the default matrix transformation ("mtx" array)
vertex_xscale = 1;
vertex_yscale = 1;
vertex_angle = 0;
///particle variables
dk_part = 0;// This variable store in a 1D array all the essential data to create particle systems, including all emitters and linking systems.

dks_set_offset(id, mouse_x, mouse_y);// Set of variables that allows us to get an organic control managing Deco objects in our editor, non used ingame, but very usefull in many cases. 
bind_xoffset = x; //The X offset between a Parent and this object.
bind_yoffset = y; //The Y offset between a Parent and this object.
//Physics variables
joint = false; //Check if a Deco object contains a Joint.
joint_target =noone; // Get the targeted object ID.
joint_parent = false; // This variable check if the joint data are created in this current Deco object.

fix =-1;//???

b_fixture = -1; //Bind a fixture assigning the ID of an object.
joint_offset = -1; 
joint_list = -1;
is_physics = 0;
phyprops = -1;
/// transform to other.id object preserving data 
object_transform = noone; // This variable can be managed in the DarkSpine editor, giving you the possibility to swap our Deco object converting it into another.id entity of your resource tree...
// All the inserted data on a deco object can be inherited by your customized objects. 

