/// @description  TPExt(property,arg0,...)
/// @param property
/// @param arg0
/// @param ...
function TPExt() {

	/// @description Prepares an extended property script with custom arguments

	/// @param propertyproperty script
	/// @param arg0argument to pass to extended property scripts
	/// @param ...additional arguments to pass to extended property scripts


	if (argument_count > 2)
	{
	    var _args;
	    var _iArg = -1;
	    repeat(argument_count-1)
	    {
	        ++_iArg;
	        _args[_iArg] = argument[_iArg+1];
	    }
    
	    var _return;
	    _return[0] = argument[0];
	    _return[1] = _args;
	    return _return; 
	}
	else
	{
	    var _return;
	    _return[0] = argument[0];
	    _return[1] = argument[1];
	    return _return;
	}






}
