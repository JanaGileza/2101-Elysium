//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float a_add;
uniform float d_add;
void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	gl_FragColor.r += a_add;
	gl_FragColor.b += d_add;
}
