#version 330 core
  
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 uv;
layout (location = 3) in vec3 tangent;

out vertex_data{
	vec3 fragPos;
	vec2 uvCoords;
	vec3 normal;
	vec3 tangentLightPos;
	vec3 tangentViewPos;
	vec3 tangentFragPos;
	vec3 tangentNormal;
} vs_out;

uniform mat4 transform;
uniform mat4 projection;
uniform mat4 view;
uniform mat4 lightMatrix;
uniform vec3 lightPos;
uniform vec3 viewPos;

void main()
{
    gl_Position = projection * view * transform * vec4(position, 1.0);
	vs_out.fragPos = vec3(transform * vec4(position, 1.0));
	vs_out.uvCoords = uv;
	//mat3 normalMatrix = transpose(inverse(mat3(transform)));
	vs_out.normal = normal;
	
	//vec3 T = normalize(vec3(normalMatrix * tangent));
	//vec3 N = normalize(vec3(normalMatrix * normal));
	vec3 T = normalize(mat3(transform) * tangent);
	vec3 N = normalize(mat3(transform) * normal);
	vec3 B = cross(T, N);
	mat3 TBN = mat3(T, B, N);
	
	vs_out.tangentLightPos = TBN * lightPos;
	vs_out.tangentFragPos = TBN * vs_out.fragPos;
	vs_out.tangentViewPos = TBN * viewPos;
	vs_out.tangentNormal = 	TBN * normal;
}

























