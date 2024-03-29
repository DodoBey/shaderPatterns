#define PI 3.1415926535897932384626433832795

varying vec2 vUv;
varying float vAnimate;
varying float vRandom;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

vec4 permute(vec4 x)
{
    return mod(((x*34.0)+1.0)*x, 289.0);
}

//	Classic Perlin 2D Noise 
//	by Stefan Gustavson
//
vec2 fade(vec2 t) {return t*t*t*(t*(t*6.0-15.0)+10.0);}

float cnoise(vec2 P){
  vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
  vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
  Pi = mod(Pi, 289.0); // To avoid truncation effects in permutation
  vec4 ix = Pi.xzxz;
  vec4 iy = Pi.yyww;
  vec4 fx = Pf.xzxz;
  vec4 fy = Pf.yyww;
  vec4 i = permute(permute(ix) + iy);
  vec4 gx = 2.0 * fract(i * 0.0243902439) - 1.0; // 1/41 = 0.024...
  vec4 gy = abs(gx) - 0.5;
  vec4 tx = floor(gx + 0.5);
  gx = gx - tx;
  vec2 g00 = vec2(gx.x,gy.x);
  vec2 g10 = vec2(gx.y,gy.y);
  vec2 g01 = vec2(gx.z,gy.z);
  vec2 g11 = vec2(gx.w,gy.w);
  vec4 norm = 1.79284291400159 - 0.85373472095314 * 
    vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
  g00 *= norm.x;
  g01 *= norm.y;
  g10 *= norm.z;
  g11 *= norm.w;
  float n00 = dot(g00, vec2(fx.x, fy.x));
  float n10 = dot(g10, vec2(fx.y, fy.y));
  float n01 = dot(g01, vec2(fx.z, fy.z));
  float n11 = dot(g11, vec2(fx.w, fy.w));
  vec2 fade_xy = fade(Pf.xy);
  vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
  float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
  return 2.3 * n_xy;
}


void main()
{   
    // // Pattern 1 - Color Transition Blue and Pink
    // gl_FragColor = vec4(vUv, 1.0, 1.0);

    //  // Pattern 2 - Color Transition Green and Orange
    // gl_FragColor = vec4(vUv, 0.0, 1.0);

    // // Pattern 3 - Transition from black to white (Left to Right)
    // float strength = vUv.x;
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // Pattern 4 - Transition from black to white (Bottom to top)
    // float strength = vUv.y;
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // // Pattern 5 - Transition from black to white (Top to bottom)
    // float strength = 1.0 - vUv.y;
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // // Pattern 6 - Strong/faster transition from black to white (Bottom to top)
    // float strength = vUv.y * 10.0;
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // // Pattern 7 - Striped pattern, horizontal stripes
    // float strength = mod(vUv.y * 10.0, 1.0);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 8 - Striped pattern with step, no transtion, black&white only, horizontal stripes
    // float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.5, strength);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 9 - Striped pattern with step, no transtion, black&white only, less bright areas, horizontal stripes
    // float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.8, strength);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 10 - Striped pattern with step, no transtion, black&white only, less bright areas, vertical stripes
    // float strength = mod(vUv.x * 10.0, 1.0);
    // strength = step(0.8, strength);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 11 - Square/chess board like pattern
    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength += step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 12 - Repeated square/chess board like dot pattern
    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 13 - Repeated horizontal lines pattern
    // float strength = step(0.4, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 14 - Repeated L shaped Tetris Pattern
    // float barX = step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0, 1.0));
    // float barY = step(0.8, mod(vUv.x * 10.0, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));
    // float strength = barX;
    // strength += barY;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 15 - Repeated plus sign pattern
    // float barX = step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0 + 0.2, 1.0));
    // float barY = step(0.8, mod(vUv.x * 10.0 + 0.2, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));

    // float strength = barX;
    // strength += barY;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 16 - Vertical mid darkness pattern
    // float strength = abs(vUv.x - 0.5);
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // // Pattern 17 - Plus sign mid darkness patter
    // float strength = min(abs(vUv.x - 0.5), abs(vUv.y - 0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 18 - Inner cube darkness, tunnel like pattern(if you think in 3d)
    // float strength = max(abs(vUv.x - 0.5), abs(vUv.y - 0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 19 - Black and white cube within cube pattern, inner black outer white
    // float strength = step(0.2,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // Pattern 20 - Black and white square pattern with thinner border on the outer square
    // float strength = step(0.4,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // float square1 = step(0.2,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // float square2 = 1.0 - step(0.25,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // float strength = square1 * square2;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 21 - Vertical color palette pattern
    // float strength = floor(vUv.x * 10.0)/10.0;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 22 - Square color palette pattern
    // float strength = floor(vUv.x * 10.0)/10.0;
    // strength *= floor(vUv.y * 10.0)/10.0;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 23 - Noisy screen pattern
    // float strength = random(vUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 24 - Low bit terrain pattern
    // vec2 gridUv = vec2(floor(vUv.x * 10.0)/10.0, floor(vUv.y * 10.0)/10.0);
    // float strength = random(gridUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 25 - Low bit terrain offsetted pattern
    // vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor(vUv.y * 10.0 + vUv.x * 5.0) / 10.0);
    // float strength = random(gridUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 26 - Couldn't find any name for this one :D 
    // float strength = length(vUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // // Pattern 27 - Dark mid circle transition pattern
    // float strength = distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 28 - Brighter mid pattern
    // float strength = 1.0 - distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 29 - Point light pattern
    // float strength = 0.015 / distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 30 - Stretched light pattern
    // vec2 lightUv = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);
    // float strength = 0.015 / distance(lightUv, vec2(0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);
    
    // // Pattern 31 - Star-like light pattern
    // vec2 lightUvX = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5));
    
    // vec2 lightUvY = vec2(vUv.y * 0.1 + 0.45, vUv.x * 0.5 + 0.25);
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    // float strength = lightX * lightY;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 32 - Rotated star-like light pattern
    // vec2 rotatedUv = rotate(vUv, PI * 0.25, vec2(0.5));

    // vec2 lightUvX = vec2(rotatedUv.x * 0.1 + 0.45, rotatedUv.y * 0.5 + 0.25);
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    // vec2 lightUvY = vec2(rotatedUv.y * 0.1 + 0.45, rotatedUv.x * 0.5 + 0.25);
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    // float strength = lightX * lightY;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 33 - Black mid circle, white outer squarte pattern
    // float strength = step(0.25, (distance(vUv, vec2(0.5))));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 34 - ???
    // float strength = abs((distance(vUv, vec2(0.5))) - 0.25);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 35 - Thin dark circle pattern
    // float strength = step(0.01, abs((distance(vUv, vec2(0.5))) - 0.25));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 36 - Inverted pattern 35
    // float strength = 1.0 - step(0.01, abs((distance(vUv, vec2(0.5))) - 0.25));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 37 - Ghost-like wavy pattern
    // vec2 wavedUv = vec2(vUv.x, vUv.y + sin(vUv.x * 30.0) * 0.1);
    // float strength = 1.0 - step(0.01, abs((distance(wavedUv, vec2(0.5))) - 0.25));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 38 - ?
    // vec2 wavedUv = vec2(vUv.x + sin(vUv.y * 30.0) * 0.1, vUv.y + sin(vUv.x * 30.0) * 0.1);
    // float strength = 1.0 - step(0.01, abs((distance(wavedUv, vec2(0.5))) - 0.25));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    
    // // Pattern 39 - Kaleidoscopic pattern
    // vec2 wavedUv = vec2(vUv.x + sin(vUv.y * 100.0) * 0.1, vUv.y + sin(vUv.x * 100.0) * 0.1);
    // float strength = 1.0 - step(0.01, abs((distance(wavedUv, vec2(0.5))) - 0.25));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 40 - ?
    // float angle = atan(vUv.x, vUv.y);
    // float strength = angle;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 41 = Half watch pattern (it reminds me one of the apple watch face)
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // float strength = angle;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 42 - Full watch pattern (it reminds me one of the apple watch face)
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float strength = angle;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 43 - Sunburst pattern
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // angle *= 20.0;
    // angle = mod(angle, 1.0);
    // float strength = angle;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 44 - Sunburst pattern with the inverted blacks and whites
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float strength = sin(angle * 100.0);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 45 - Sun pattern
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float sinusoid = sin(angle * 100.0);
    // float radius = 0.25 + sinusoid * 0.02;
    // float strength = 1.0 - step(0.01, abs((distance(vUv, vec2(0.5))) - radius));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 46 - Low-res noisy camouflage pattern
    // float strength = cnoise(vUv * 10.0);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 47 - High res camouflage pattern
    // float strength = step(0.0, cnoise(vUv * 10.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 48 - Noisy neon lights pattern
    // float strength = 1.0 - abs(cnoise(vUv * 10.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 49 - Noisy and blurry abstract pattern
    // float strength =  sin(cnoise(vUv * 10.0) * 20.0);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // // Pattern 50 - Noisy clean abstract pattern
    // float strength =  step(0.9,sin(cnoise(vUv * 10.0) * 20.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // Clamp the Strength
    // strength = clamp(strength, 0.0, 1.0);

    // Colorization
    float strength =  step(0.8,sin(cnoise(vUv * 10.0) * 20.0));
    float mixStrength = (vAnimate * strength) * vRandom + 0.5;

    vec3 blackColor = vec3(0.0);
    vec3 uvColor = vec3(vUv, 1.0);
    vec3 mixedColor = mix(blackColor, uvColor, mixStrength);

    gl_FragColor = vec4(mixedColor, 1.0);

    
}