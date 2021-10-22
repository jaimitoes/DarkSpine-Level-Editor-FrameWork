//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//varying vec3 v_worldPos;

varying mat3 v_rotationMatrix;

uniform sampler2D sl_NormalMap;

uniform float sl_SpriteAngle;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    //v_worldPos = (gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos).xyz;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    float cosAngle = cos(sl_SpriteAngle);
    float sinAngle = sin(sl_SpriteAngle);
    v_rotationMatrix[0][0] = cosAngle;
    v_rotationMatrix[1][1] = cosAngle;
    v_rotationMatrix[0][1] = sinAngle;
    v_rotationMatrix[1][0] = -sinAngle;
    v_rotationMatrix[1][2] = 0.0;
    v_rotationMatrix[2][1] = 0.0;
    v_rotationMatrix[2][2] = 1.0;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

