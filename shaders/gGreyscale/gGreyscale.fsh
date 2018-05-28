//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 pixelColor = texture2D( gm_BaseTexture, v_vTexcoord );
	float averageColors = (pixelColor.r + pixelColor.g + pixelColor.b) / 3.0;
	pixelColor = vec4(averageColors, averageColors, averageColors, 1.0);
    gl_FragColor = pixelColor;
}
