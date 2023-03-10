#version 330

layout (location = 0) in vec3 vertex_position;
layout (location = 1) in vec3 vertex_color;
layout (location = 2) in vec2 vertex_texcoord;
layout (location = 3) in vec3 vertex_normal;


out vec3 vs_position;
out vec3 vs_color;
out vec2 vs_texcoord;
out vec3 vs_normal;
out vec4 vs_fragPosLightSpace;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform mat4 lightSpaceMatrix;

void main()
{

	vs_position = vec4(model * vec4(vertex_position, 1.f)).xyz;
	vs_color = vertex_color;
	vs_texcoord = vec2(vertex_texcoord.x, vertex_texcoord.y * -1.f);
	vs_normal = mat3(model) * vertex_normal;

	vs_fragPosLightSpace = lightSpaceMatrix * vec4(vs_position,1);

	gl_Position = projection * view * model * vec4(vertex_position, 1.0f);
	   
}
