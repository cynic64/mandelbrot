#version 450

layout (location = 0) in vec2 in_pos;

layout (location = 0) out vec4 out_color;

vec2 square(vec2 n) {
        return vec2(n.x * n.x - n.y * n.y, 2 * n.x * n.y);
}

int divergence(vec2 n) {
        vec2 z = vec2(0.0, 0.0);
        for (int i = 0; i < 100; i++) {
                z = square(z) + n;
                if (z.x * z.x > 3.0 || z.y * z.y > 3.0) {
                        return i;
                }
        }

	return 100;
}

void main() {
        float value = 1.0 / divergence(in_pos * 2.0);
	out_color = vec4(vec3(value), 1.0);
}
