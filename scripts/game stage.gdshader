shader_type canvas_item;

uniform vec2 player_pos;
uniform float radius : hint_range(0, 1) = 0.2;
uniform bool active = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = SCREEN_UV;
	vec4 base_color = texture(TEXTURE, uv);
	
	if (!active) {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0); // Fully transparent when not active
    }
	float dist = distance(uv, player_pos);
	float alpha = smoothstep(radius, radius * 0.9, dist);
	
	COLOR = vec4(0.0, 0.0, 0.0, alpha);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
