/// @description  TGMS_BuildDefaultProperties()
function TGMS_BuildDefaultProperties() {
	/*
	Set up default properties for optimisation and normalization purposes.
	This is NOT REQUIRED for custom properties/variables to be used, but they will
	perform slower than tween's set up with TGMS_BuildProperty().

	It is advised to create your own list of custom properties elsewhere.
	It is safe to delete any properties and their associated scripts.

	Note:
	Removing some properties could prevent related TweenEasy*() scripts from working.
	You would need to delete the associated "easy" script.
	e.g. "x" -- TweenEasyMove()
	*/

	//=========================
	// INSTANCE PROPERTIES
	//=========================
	TGMS_BuildProperty("", TPNull, TPNull);
	TGMS_BuildProperty("x", x__, __x);
	TGMS_BuildProperty("y", y__, __y);
	TGMS_BuildProperty("z", z__, __z);
	TGMS_BuildProperty("depth", depth__, __depth);
	TGMS_BuildProperty("x_rotation", xrotation__, __xrotation);
	TGMS_BuildProperty("y_rotation", yrotation__, __yrotation);

	TGMS_BuildProperty("phyx", phyx__, __phyx);
	TGMS_BuildProperty("phyy", phyy__, __phyy);
	TGMS_BuildProperty("phyr", phyr__, __phyr);
	TGMS_BuildProperty("depth", depth__, __depth);
	TGMS_BuildProperty("round(x)", roundx__, __x);
	TGMS_BuildProperty("round(y)", roundy__, __y);
	TGMS_BuildProperty("direction", direction__, __direction);
	TGMS_BuildProperty("speed", speed__, __speed);
	TGMS_BuildProperty("hspeed", hspeed__, __hspeed);
	TGMS_BuildProperty("vspeed", vspeed__, __vspeed);
	TGMS_BuildProperty("image_scale", image_scale__, __image_xscale);
	TGMS_BuildProperty("image_xscale", image_xscale__, __image_xscale);
	TGMS_BuildProperty("image_yscale", image_yscale__, __image_yscale);
	TGMS_BuildProperty("image_angle", image_angle__, __image_angle);
	TGMS_BuildProperty("image_alpha", image_alpha__, __image_alpha);
	TGMS_BuildProperty("image_speed", image_speed__, image_speed__);
	TGMS_BuildProperty("image_index", image_index__, image_index__);
	TGMS_BuildProperty("path_position", path_position__);
	TGMS_BuildProperty("path_scale", path_scale__);
	TGMS_BuildProperty("path_speed", path_speed__);
	TGMS_BuildProperty("path_orientation", path_orientation__);
	TGMS_BuildProperty("screenZoom", ScreenZoom);
	TGMS_BuildProperty("tweenVar", ScreenZoom);
	TGMS_BuildPropertyNormalize("image_blend", image_blend__, __image_blend);

	//=========================
	// GLOBAL PROPERTIES
	//=========================
	TGMS_BuildProperty("score", score__, __score);
	TGMS_BuildProperty("health", health__, __health);

	//=========================
	// USER EVENT PROPERTIES
	//=========================
	TGMS_BuildProperty("PropUser", ext_PropUser__, __ext_PropUser);

	//=========================
	// DATA STRUCTURE PROPERTIES
	//=========================
	TGMS_BuildProperty("Array_1D", ext_Array1D__, __ext_Array1D);
	TGMS_BuildProperty("Array_2D", ext_Array2D__, __ext_Array2D);
	TGMS_BuildProperty("DSList", ext_DSList__, __ext_DSList);
	TGMS_BuildProperty("DSGrid", ext_DSGrid__, __ext_DSGrid);
	TGMS_BuildProperty("DSMap", ext_DSMap__, __ext_DSMap);





}
