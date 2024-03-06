This is created with the help of Bruno Simon and his amazing [Three.js Journey](https:threejs-journey.com/). To learn more, check it out. Just wanted to keep them all here, I belive these patters are going to be useful to create something in the future, and added the pictures with some personal names to use them later when needed.
# Three.js Journey


### Pattern 1 - Color Transition Blue and Pink
gl_FragColor = vec4(vUv, 1.0, 1.0);

### Pattern 2 - Color Transition Green and Orange
gl_FragColor = vec4(vUv, 0.0, 1.0);

### Pattern 3 - Transition from black to white (Left to Right)
float strength = vUv.x;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 4 - Transition from black to white (Bottom to top)
float strength = vUv.y;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 5 - Transition from black to white (Top to bottom)
float strength = 1.0 - vUv.y;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 6 - Strong/faster transition from black to white (Bottom to top)
float strength = vUv.y * 10.0;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 7 - Striped pattern, horizontal stripes
float strength = mod(vUv.y * 10.0, 1.0);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 8 - Striped pattern with step, no transition, black&white only, horizontal stripes
<img width="529" alt="8" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/a61429e1-cb31-4a81-9acf-466cfda3999f">

float strength = mod(vUv.y * 10.0, 1.0);\
strength = step(0.5, strength);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 9 - Striped pattern with step, no transition, black&white only, less bright areas, horizontal stripes
<img width="531" alt="9" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/43ad681e-400e-4411-b410-c80d69a6ea13">

float strength = mod(vUv.y * 10.0, 1.0);\
strength = step(0.8, strength);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 10 - Striped pattern with step, no transition, black&white only, less bright areas, vertical stripes
<img width="472" alt="10" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/6b6ade87-7ded-42be-b53f-025c636ec65e">

float strength = mod(vUv.x * 10.0, 1.0);\
strength = step(0.8, strength);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 11 - Square/chess board-like pattern
<img width="520" alt="11" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/10a01d7b-6d98-4317-a00e-5ad1c291f4c8">

float strength = step(0.8, mod(vUv.x * 10.0, 1.0));\
strength += step(0.8, mod(vUv.y * 10.0, 1.0));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 12 - Repeated square/chess board-like dot pattern
<img width="462" alt="12" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/813f3e04-5269-48da-9fd8-1d1075be3b3e">

float strength = step(0.8, mod(vUv.x * 10.0, 1.0));\
strength *= step(0.8, mod(vUv.y * 10.0, 1.0));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 13 - Repeated horizontal lines pattern
<img width="466" alt="13" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/b2437aac-338c-4aac-9220-5e3255aa7b5e">

float strength = step(0.4, mod(vUv.x * 10.0, 1.0));\
strength *= step(0.8, mod(vUv.y * 10.0, 1.0));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 14 - Repeated L-shaped Tetris pattern
<img width="451" alt="14" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/225b05bc-cacc-47b1-a0c6-940c3072d404">

float barX = step(0.4, mod(vUv.x * 10.0, 1.0));\
barX *= step(0.8, mod(vUv.y * 10.0, 1.0));\
float barY = step(0.8, mod(vUv.x * 10.0, 1.0));\
barY *= step(0.4, mod(vUv.y * 10.0, 1.0));\
float strength = barX;\
strength += barY;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 15 - Repeated plus sign pattern
<img width="482" alt="15" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/5590ce82-ee4d-4e0b-a502-8682e71480a7">

float barX = step(0.4, mod(vUv.x * 10.0, 1.0));\
barX *= step(0.8, mod(vUv.y * 10.0 + 0.2, 1.0));\
float barY = step(0.8, mod(vUv.x * 10.0 + 0.2, 1.0));\
barY *= step(0.4, mod(vUv.y * 10.0, 1.0));\

float strength = barX;\
strength += barY;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 16 - Vertical mid-darkness pattern
<img width="490" alt="16" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/886ddffc-fadf-4adb-b567-4020e76716ca">

float strength = abs(vUv.x - 0.5);\
gl_FragColor = vec4(vec3(strength), 1.0);
 
### Pattern 17 - Plus sign mid darkness patter
<img width="492" alt="17" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/093e3cd6-92bd-4c85-b776-2df227e63418">

float strength = min(abs(vUv.x - 0.5), abs(vUv.y - 0.5));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 18 - Inner cube darkness, tunnel-like pattern(if you think in 3d)
<img width="519" alt="18" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/13ca42ee-6996-42c1-89aa-0bbb9c1ba07f">

float strength = max(abs(vUv.x - 0.5), abs(vUv.y - 0.5));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 19 - Black and white cube within cube pattern, inner black outer white
<img width="467" alt="19" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/344bfa23-a707-4f87-ac5d-2fd23a4ff075">

float strength = step(0.2,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 20 - Black and white square pattern with thinner border on the outer square
<img width="363" alt="20" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/23188d1e-2c25-41c1-9595-4141ba6e8489">

float strength = step(0.4,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));\
float square1 = step(0.2,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));\
float square2 = 1.0 - step(0.25,max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));\
float strength = square1 * square2;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 21 - Vertical color palette pattern
<img width="507" alt="21" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/781bbc57-b465-4e4f-8d95-0a8386d493c0">

float strength = floor(vUv.x * 10.0)/10.0;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 22 - Square color palette pattern
<img width="481" alt="22" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/2415ff14-9740-470c-a994-b2c8abe51b5f">

float strength = floor(vUv.x * 10.0)/10.0;\
strength *= floor(vUv.y * 10.0)/10.0;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 23 - Noisy screen pattern
<img width="473" alt="23" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/61c93127-9563-4881-afcf-12f3e4c608a3">

float strength = random(vUv);\
gl_FragColor = vec4(vec3(strength), 1.0);\

### Pattern 24 - Low-bit terrain pattern
<img width="475" alt="24" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/cb8d25d5-6e60-4a8e-9c2f-77f403956f9d">

vec2 gridUv = vec2(floor(vUv.x * 10.0)/10.0, floor(vUv.y * 10.0)/10.0);\
float strength = random(gridUv);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 25 - Low-bit terrain offset pattern
<img width="487" alt="25" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/72b2c6cc-81c4-4760-b498-f580b126b619">

vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor(vUv.y * 10.0 + vUv.x * 5.0) / 10.0);\
float strength = random(gridUv);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 26 - Couldn't find any name for this one :D 
<img width="530" alt="26" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/539c8bcd-616f-49a2-9f90-10ea0cadbff9">

float strength = length(vUv);\
gl_FragColor = vec4(vec3(strength), 1.0);
 
### Pattern 27 - Dark mid-circle transition pattern
<img width="505" alt="27" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/a1b8b322-61ba-4043-91af-e853380fb70d">

float strength = distance(vUv, vec2(0.5));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 28 - Brighter mid pattern
<img width="480" alt="28" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/53aee5f0-0e0b-4a0e-aa4d-65e22cc2953d">

float strength = 1.0 - distance(vUv, vec2(0.5));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 29 - Point light pattern
<img width="533" alt="29" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/b3ebdc85-8f48-4204-b6b9-68390be802dd">

float strength = 0.015 / distance(vUv, vec2(0.5));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 30 - Stretched light pattern
<img width="485" alt="30" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/94e72d0b-f5b7-421d-a9cb-77a8257e4549">

vec2 lightUv = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);\
float strength = 0.015 / distance(lightUv, vec2(0.5));\
gl_FragColor = vec4(vec3(strength), 1.0);
 
### Pattern 31 - Star-like light pattern
<img width="555" alt="31" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/a96ed061-3dbd-49b8-8b1c-82acd411386b">

vec2 lightUvX = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);\
float lightX = 0.015 / distance(lightUvX, vec2(0.5));\
 
vec2 lightUvY = vec2(vUv.y * 0.1 + 0.45, vUv.x * 0.5 + 0.25);\
float lightY = 0.015 / distance(lightUvY, vec2(0.5));\

float strength = lightX * lightY;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 32 - Rotated star-like light pattern
<img width="579" alt="32" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/f82c11c5-e865-4eba-b339-7e7e0b6fc18b">

vec2 rotatedUv = rotate(vUv, PI * 0.25, vec2(0.5));\

vec2 lightUvX = vec2(rotatedUv.x * 0.1 + 0.45, rotatedUv.y * 0.5 + 0.25);\
float lightX = 0.015 / distance(lightUvX, vec2(0.5));\

vec2 lightUvY = vec2(rotatedUv.y * 0.1 + 0.45, rotatedUv.x * 0.5 + 0.25);\
float lightY = 0.015 / distance(lightUvY, vec2(0.5));\

float strength = lightX * lightY;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 33 - Black mid circle, white outer squarte pattern
<img width="512" alt="33" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/a6392860-1e62-4d22-ba62-6f83500fa1fe">

float strength = step(0.25, (distance(vUv, vec2(0.5))));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 34 - ???
<img width="508" alt="34" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/bdbd6eac-8bfe-4d0d-80c9-f6299451a41f">

float strength = abs((distance(vUv, vec2(0.5))) - 0.25);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 35 - Thin dark circle pattern
<img width="523" alt="35" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/015abcb7-b61b-4f08-94a1-e99ef7b8263a">

float strength = step(0.01, abs((distance(vUv, vec2(0.5))) - 0.25));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 36 - Inverted pattern 35
<img width="566" alt="36" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/15970328-efd6-41dd-87ad-a19adeded5e7">

float strength = 1.0 - step(0.01, abs((distance(vUv, vec2(0.5))) - 0.25));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 37 - Ghost-like wavy pattern
<img width="462" alt="37" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/3496a19a-f622-44c2-a57a-8a5fcd8337fe">

vec2 wavedUv = vec2(vUv.x, vUv.y + sin(vUv.x * 30.0) * 0.1);\
float strength = 1.0 - step(0.01, abs((distance(wavedUv, vec2(0.5))) - 0.25));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 38 - ?
<img width="483" alt="38" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/fa9d9ece-9b1f-4608-93de-b597ce97a8cd">

vec2 wavedUv = vec2(vUv.x + sin(vUv.y * 30.0) * 0.1, vUv.y + sin(vUv.x * 30.0) * 0.1);\
float strength = 1.0 - step(0.01, abs((distance(wavedUv, vec2(0.5))) - 0.25));\
gl_FragColor = vec4(vec3(strength), 1.0);

 
### Pattern 39 - Kaleidoscopic pattern
<img width="520" alt="39" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/72a1865b-022d-4c25-80c3-b6ed41b21301">

vec2 wavedUv = vec2(vUv.x + sin(vUv.y * 100.0) * 0.1, vUv.y + sin(vUv.x * 100.0) * 0.1);\
float strength = 1.0 - step(0.01, abs((distance(wavedUv, vec2(0.5))) - 0.25));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 40 - ?
<img width="556" alt="40" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/26fe13ab-d954-497a-8d0b-f898ce979d06">

float angle = atan(vUv.x, vUv.y);\
float strength = angle;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 41 = Half watch pattern (it reminds me of one of the apple watch faces)
<img width="579" alt="41" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/4b7980dd-d7bc-4efd-9d31-aa9032bac305">

float angle = atan(vUv.x - 0.5, vUv.y - 0.5);\
float strength = angle;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 42 - Full watch pattern (it reminds me of one of the apple watch faces)
<img width="522" alt="42" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/bc6d8cc3-c6aa-419d-9a10-9ae249199c7f">

float angle = atan(vUv.x - 0.5, vUv.y - 0.5);\
angle /= PI * 2.0;\
angle += 0.5;\
float strength = angle;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 43 - Sunburst pattern
<img width="479" alt="43" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/a150a897-e3c5-4e94-9e4c-2d72a6120027">

float angle = atan(vUv.x - 0.5, vUv.y - 0.5);\
angle /= PI * 2.0;\
angle += 0.5;\
angle *= 20.0;\
angle = mod(angle, 1.0);\
float strength = angle;\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 44 - Sunburst pattern with the inverted blacks and whites
<img width="472" alt="44" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/943b3b80-9f23-48ff-91b4-b073676e2d61">

float angle = atan(vUv.x - 0.5, vUv.y - 0.5);\
angle /= PI * 2.0;\
angle += 0.5;\
float strength = sin(angle * 100.0);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 45 - Sun pattern
<img width="397" alt="45" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/3aefd59f-56c8-4ad9-87ca-7e893a866af2">

float angle = atan(vUv.x - 0.5, vUv.y - 0.5);\
angle /= PI * 2.0;\
angle += 0.5;\
float sinusoid = sin(angle * 100.0);\
float radius = 0.25 + sinusoid * 0.02;\
float strength = 1.0 - step(0.01, abs((distance(vUv, vec2(0.5))) - radius));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 46 - Low-res noisy camouflage pattern
<img width="510" alt="46" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/b4cecb3f-616f-4933-a40a-0e22af1b3717">

float strength = cnoise(vUv * 10.0);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 47 - High-res camouflage pattern
<img width="528" alt="47" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/580d3419-8ec1-44eb-a1aa-4ee464993a4a">

float strength = step(0.0, cnoise(vUv * 10.0));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 48 - Noisy neon lights pattern
<img width="482" alt="48" src="https://github.com/DodoBey/shaderPatterns/assets/77416196/568a83f5-23fb-436b-8fb1-3ddaa74ed105">

float strength = 1.0 - abs(cnoise(vUv * 10.0));\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 49 - Noisy and blurry abstract pattern

float strength =sin(cnoise(vUv * 10.0) * 20.0);\
gl_FragColor = vec4(vec3(strength), 1.0);

### Pattern 50 - Noisy clean abstract pattern

float strength =step(0.9,sin(cnoise(vUv * 10.0) * 20.0));\
gl_FragColor = vec4(vec3(strength), 1.0);
