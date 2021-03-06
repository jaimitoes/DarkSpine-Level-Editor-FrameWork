/// @description  ext_path_phy__(amount,data[path|absolute|xstart|ystart|xrelative|yrelative|repeat],target)
/// @param amount
/// @param data[path|absolute|xstart|ystart|xrelative|yrelative|repeat]
/// @param target
function ext_path_phy__(argument0, argument1, argument2) {

	var _amount = argument0;
	var _data = argument1;
	var _target = argument2;
	var _path = _data[0];
	var _xstart = _data[2];
	var _ystart = _data[3];
	var _xrelative = _data[4];
	var _yrelative = _data[5];
	var _repeat = _data[6];

	with(_target)
	{
	    if (_repeat)
	    {
	        var _xDif = path_get_x(_path, 1) - path_get_x(_path, 0); // Could cache these two??
	        var _yDif = path_get_y(_path, 1) - path_get_y(_path, 0);
            
	        if (_amount > 0)
	        {   
	            _xrelative = _xstart + _xDif * floor(_amount);
	            _yrelative = _ystart + _yDif * floor(_amount);
	            _amount = _amount mod 1;
	        }
	        else if (_amount < 0)
	        {
	            _xrelative = _xstart + _xDif * ceil(_amount-1);
	            _yrelative = _ystart + _yDif * ceil(_amount-1);
	            _amount = 1 + _amount mod 1;
	        }
	        else
	        {
	            _xrelative = _xstart;
	            _yrelative = _ystart;
	        }
        
	        phy_position_x = path_get_x(_path, _amount) + _xrelative;
	        phy_position_y = path_get_y(_path, _amount) + _yrelative;
	    }
	    else
	    {
	        if (_amount > 0)
	        {
	            if (path_get_closed(_path) || _amount < 1)
	            {
	                phy_position_x = path_get_x(_path, _amount mod 1) + _xrelative;
	                phy_position_y = path_get_y(_path, _amount mod 1) + _yrelative;
	            }
	            else
	            {
	                var _length = path_get_length(_path) * (abs(_amount)-1);
	                var _direction = point_direction(path_get_x(_path, 0.999), path_get_y(_path, 0.999), path_get_x(_path, 1), path_get_y(_path, 1));
                
	                phy_position_x = path_get_x(_path, 1) + _xrelative + lengthdir_x(_length, _direction);
	                phy_position_y = path_get_y(_path, 1) + _yrelative + lengthdir_y(_length, _direction);
	            }
	        }
	        else if (_amount < 0)
	        {
	            if (path_get_closed(_path))
	            {
	                phy_position_x = path_get_x(_path, 1+_amount) + _xrelative;
	                phy_position_y = path_get_y(_path, 1+_amount) + _yrelative;
	            }
	            else
	            {
	                var _length = path_get_length(_path) * abs(_amount);
	                var _direction = point_direction(path_get_x(_path, 0), path_get_y(_path, 0), path_get_x(_path, 0.001), path_get_y(_path, 0.001));
                
	                phy_position_x = path_get_x(_path, 0) + _xrelative - lengthdir_x(_length, _direction);
	                phy_position_y = path_get_y(_path, 0) + _yrelative - lengthdir_y(_length, _direction);
	            }
	        }
	        else
	        {
	            phy_position_x = path_get_x(_path, 0) + _xrelative;
	            phy_position_y = path_get_y(_path, 0) + _yrelative;
	        }
	    }
	}





}
