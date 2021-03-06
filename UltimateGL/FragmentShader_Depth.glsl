#version 330 core

out vec4 fragColor;

in VS_OUT{
	vec3 Normal;
	vec3 FragPos;
	vec2 uvCoords;
	vec4 fragPosLightSpace;
} fs_in;

uniform vec3 objColor;
uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 viewPos;
uniform sampler2D mainTexture;
uniform sampler2D depthMap;

void main()
{
	fragColor = vec4(texture(depthMap,  fs_in.uvCoords).rgb, 1.0);
	
    //fragColor = vec4(vec3(texture(depthMap,  fs_in.uvCoords).r), 1.0) ;
}

