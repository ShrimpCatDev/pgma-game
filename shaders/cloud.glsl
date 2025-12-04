extern float iTime;
extern vec2 iResolution;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);

    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));

    vec2 u = f*f*(3.0 - 2.0*f);

    return mix(a, b, u.x) +
           (c - a) * u.y * (1.0 - u.x) +
           (d - b) * u.x * u.y;
}

float fbm(vec2 p) {
    float t = 0.0;
    float amp = 0.5;
    for (int i = 0; i < 5; i++) {
        t += noise(p) * amp;
        p *= 2.0;
        amp *= 0.5;
    }
    return t;
}

vec4 effect(vec4 color, Image tex, vec2 tc, vec2 sc) {

    // Normalized UV
    vec2 uv = sc / iResolution;

    // Basic camera / movement
    vec2 p = uv * 3.0;
    p.x += iTime * 0.03;

    // Noise
    float n = fbm(p);

    // Clouds threshold
    float clouds = smoothstep(0.5, 0.8, n);

    // Add softness at edges
    clouds = pow(clouds, 1.4);

    // Sky gradient
    vec3 sky = vec3(0.15294117647058825,0.7098039215686275, 0.996078431372549);


    // Cloud color
    vec3 cloudColor = vec3(1.0);

    // Blend
    vec3 col = mix(sky, cloudColor, clouds);

    return vec4(col, 1.0);
}
