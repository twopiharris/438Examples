#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform vec4 casData[20];
uniform samplerCubeShadow shadowMapPoint[1];
uniform vec2 lightProj;
uniform vec4 shirr[7];
uniform sampler2D gbuffer0;
uniform sampler2D gbuffer1;
uniform sampler2D gbufferD;
uniform vec3 eye;
uniform vec3 eyeLook;
uniform vec2 cameraProj;
uniform vec3 backgroundCol;
uniform float envmapStrength;
uniform sampler2D ssaotex;
uniform vec3 sunDir;
uniform sampler2DShadow shadowMap;
uniform float shadowsBias;
uniform vec3 sunCol;
uniform vec3 pointPos;
uniform vec3 pointCol;
uniform float pointBias;

in vec2 texCoord;
in vec3 viewRay;
out vec4 fragColor;

vec2 octahedronWrap(vec2 v)
{
    return (vec2(1.0) - abs(v.yx)) * vec2((v.x >= 0.0) ? 1.0 : (-1.0), (v.y >= 0.0) ? 1.0 : (-1.0));
}

void unpackFloatInt16(float val, out float f, inout uint i)
{
    i = uint(int((val / 0.06250095367431640625) + 1.525902189314365386962890625e-05));
    f = clamp((((-0.06250095367431640625) * float(i)) + val) / 0.06248569488525390625, 0.0, 1.0);
}

vec2 unpackFloat2(float f)
{
    return vec2(floor(f) / 255.0, fract(f));
}

vec3 surfaceAlbedo(vec3 baseColor, float metalness)
{
    return mix(baseColor, vec3(0.0), vec3(metalness));
}

vec3 surfaceF0(vec3 baseColor, float metalness)
{
    return mix(vec3(0.039999999105930328369140625), baseColor, vec3(metalness));
}

vec3 getPos(vec3 eye_1, vec3 eyeLook_1, vec3 viewRay_1, float depth, vec2 cameraProj_1)
{
    float linearDepth = cameraProj_1.y / (((depth * 0.5) + 0.5) - cameraProj_1.x);
    float viewZDist = dot(eyeLook_1, viewRay_1);
    vec3 wposition = eye_1 + (viewRay_1 * (linearDepth / viewZDist));
    return wposition;
}

vec3 shIrradiance(vec3 nor)
{
    vec3 cl00 = vec3(shirr[0].x, shirr[0].y, shirr[0].z);
    vec3 cl1m1 = vec3(shirr[0].w, shirr[1].x, shirr[1].y);
    vec3 cl10 = vec3(shirr[1].z, shirr[1].w, shirr[2].x);
    vec3 cl11 = vec3(shirr[2].y, shirr[2].z, shirr[2].w);
    vec3 cl2m2 = vec3(shirr[3].x, shirr[3].y, shirr[3].z);
    vec3 cl2m1 = vec3(shirr[3].w, shirr[4].x, shirr[4].y);
    vec3 cl20 = vec3(shirr[4].z, shirr[4].w, shirr[5].x);
    vec3 cl21 = vec3(shirr[5].y, shirr[5].z, shirr[5].w);
    vec3 cl22 = vec3(shirr[6].x, shirr[6].y, shirr[6].z);
    return ((((((((((cl22 * 0.429042994976043701171875) * ((nor.y * nor.y) - ((-nor.z) * (-nor.z)))) + (((cl20 * 0.743125021457672119140625) * nor.x) * nor.x)) + (cl00 * 0.88622701168060302734375)) - (cl20 * 0.2477079927921295166015625)) + (((cl2m2 * 0.85808598995208740234375) * nor.y) * (-nor.z))) + (((cl21 * 0.85808598995208740234375) * nor.y) * nor.x)) + (((cl2m1 * 0.85808598995208740234375) * (-nor.z)) * nor.x)) + ((cl11 * 1.02332794666290283203125) * nor.y)) + ((cl1m1 * 1.02332794666290283203125) * (-nor.z))) + ((cl10 * 1.02332794666290283203125) * nor.x);
}

vec3 lambertDiffuseBRDF(vec3 albedo, float nl)
{
    return albedo * max(0.0, nl);
}

float d_ggx(float nh, float a)
{
    float a2 = a * a;
    float denom = pow(((nh * nh) * (a2 - 1.0)) + 1.0, 2.0);
    return (a2 * 0.3183098733425140380859375) / denom;
}

float v_smithschlick(float nl, float nv, float a)
{
    return 1.0 / (((nl * (1.0 - a)) + a) * ((nv * (1.0 - a)) + a));
}

vec3 f_schlick(vec3 f0, float vh)
{
    return f0 + ((vec3(1.0) - f0) * exp2((((-5.554729938507080078125) * vh) - 6.9831600189208984375) * vh));
}

vec3 specularBRDF(vec3 f0, float roughness, float nl, float nh, float nv, float vh)
{
    float a = roughness * roughness;
    return (f_schlick(f0, vh) * (d_ggx(nh, a) * clamp(v_smithschlick(nl, nv, a), 0.0, 1.0))) / vec3(4.0);
}

mat4 getCascadeMat(float d, inout int casi, inout int casIndex)
{
    vec4 comp = vec4(float(d > casData[16].x), float(d > casData[16].y), float(d > casData[16].z), float(d > casData[16].w));
    casi = int(min(dot(vec4(1.0), comp), 4.0));
    casIndex = casi * 4;
    return mat4(vec4(casData[casIndex]), vec4(casData[casIndex + 1]), vec4(casData[casIndex + 2]), vec4(casData[casIndex + 3]));
}

float PCF(sampler2DShadow shadowMap_1, vec2 uv, float compare, vec2 smSize)
{
    vec3 _279 = vec3(uv + (vec2(-1.0) / smSize), compare);
    float result = texture(shadowMap_1, vec3(_279.xy, _279.z));
    vec3 _288 = vec3(uv + (vec2(-1.0, 0.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_288.xy, _288.z));
    vec3 _299 = vec3(uv + (vec2(-1.0, 1.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_299.xy, _299.z));
    vec3 _310 = vec3(uv + (vec2(0.0, -1.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_310.xy, _310.z));
    vec3 _318 = vec3(uv, compare);
    result += texture(shadowMap_1, vec3(_318.xy, _318.z));
    vec3 _329 = vec3(uv + (vec2(0.0, 1.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_329.xy, _329.z));
    vec3 _340 = vec3(uv + (vec2(1.0, -1.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_340.xy, _340.z));
    vec3 _351 = vec3(uv + (vec2(1.0, 0.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_351.xy, _351.z));
    vec3 _362 = vec3(uv + (vec2(1.0) / smSize), compare);
    result += texture(shadowMap_1, vec3(_362.xy, _362.z));
    return result / 9.0;
}

float shadowTestCascade(sampler2DShadow shadowMap_1, vec3 eye_1, vec3 p, float shadowsBias_1)
{
    float d = distance(eye_1, p);
    int param;
    int param_1;
    mat4 _610 = getCascadeMat(d, param, param_1);
    int casi = param;
    int casIndex = param_1;
    mat4 LWVP = _610;
    vec4 lPos = LWVP * vec4(p, 1.0);
    vec3 _625 = lPos.xyz / vec3(lPos.w);
    lPos = vec4(_625.x, _625.y, _625.z, lPos.w);
    float visibility = 1.0;
    if (lPos.w > 0.0)
    {
        visibility = PCF(shadowMap_1, lPos.xy, lPos.z - shadowsBias_1, vec2(4096.0, 1024.0));
    }
    float nextSplit = casData[16][casi];
    float _651;
    if (casi == 0)
    {
        _651 = nextSplit;
    }
    else
    {
        _651 = nextSplit - (casData[16][casi - 1]);
    }
    float splitSize = _651;
    float splitDist = (nextSplit - d) / splitSize;
    if ((splitDist <= 0.1500000059604644775390625) && (casi != 3))
    {
        int casIndex2 = casIndex + 4;
        mat4 LWVP2 = mat4(vec4(casData[casIndex2]), vec4(casData[casIndex2 + 1]), vec4(casData[casIndex2 + 2]), vec4(casData[casIndex2 + 3]));
        vec4 lPos2 = LWVP2 * vec4(p, 1.0);
        vec3 _729 = lPos2.xyz / vec3(lPos2.w);
        lPos2 = vec4(_729.x, _729.y, _729.z, lPos2.w);
        float visibility2 = 1.0;
        if (lPos2.w > 0.0)
        {
            visibility2 = PCF(shadowMap_1, lPos2.xy, lPos2.z - shadowsBias_1, vec2(4096.0, 1024.0));
        }
        float lerpAmt = smoothstep(0.0, 0.1500000059604644775390625, splitDist);
        return mix(visibility2, visibility, lerpAmt);
    }
    return visibility;
}

float attenuate(float dist)
{
    return 1.0 / (dist * dist);
}

float lpToDepth(inout vec3 lp, vec2 lightProj_1)
{
    lp = abs(lp);
    float zcomp = max(lp.x, max(lp.y, lp.z));
    zcomp = lightProj_1.x - (lightProj_1.y / zcomp);
    return (zcomp * 0.5) + 0.5;
}

float PCFCube(samplerCubeShadow shadowMapCube, vec3 lp, inout vec3 ml, float bias, vec2 lightProj_1, vec3 n)
{
    vec3 param = lp;
    float _396 = lpToDepth(param, lightProj_1);
    float compare = _396 - (bias * 1.5);
    ml += ((n * bias) * 20.0);
    vec4 _412 = vec4(ml, compare);
    float result = texture(shadowMapCube, vec4(_412.xyz, _412.w));
    vec4 _424 = vec4(ml + vec3(0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_424.xyz, _424.w));
    vec4 _438 = vec4(ml + vec3(-0.001000000047497451305389404296875, 0.001000000047497451305389404296875, 0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_438.xyz, _438.w));
    vec4 _451 = vec4(ml + vec3(0.001000000047497451305389404296875, -0.001000000047497451305389404296875, 0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_451.xyz, _451.w));
    vec4 _464 = vec4(ml + vec3(0.001000000047497451305389404296875, 0.001000000047497451305389404296875, -0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_464.xyz, _464.w));
    vec4 _477 = vec4(ml + vec3(-0.001000000047497451305389404296875, -0.001000000047497451305389404296875, 0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_477.xyz, _477.w));
    vec4 _490 = vec4(ml + vec3(0.001000000047497451305389404296875, -0.001000000047497451305389404296875, -0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_490.xyz, _490.w));
    vec4 _503 = vec4(ml + vec3(-0.001000000047497451305389404296875, 0.001000000047497451305389404296875, -0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_503.xyz, _503.w));
    vec4 _516 = vec4(ml + vec3(-0.001000000047497451305389404296875), compare);
    result += texture(shadowMapCube, vec4(_516.xyz, _516.w));
    return result / 9.0;
}

vec3 sampleLight(vec3 p, vec3 n, vec3 v, float dotNV, vec3 lp, vec3 lightCol, vec3 albedo, float rough, float spec, vec3 f0, int index, float bias)
{
    vec3 ld = lp - p;
    vec3 l = normalize(ld);
    vec3 h = normalize(v + l);
    float dotNH = dot(n, h);
    float dotVH = dot(v, h);
    float dotNL = dot(n, l);
    vec3 direct = lambertDiffuseBRDF(albedo, dotNL) + (specularBRDF(f0, rough, dotNL, dotNH, dotNV, dotVH) * spec);
    direct *= attenuate(distance(p, lp));
    direct *= lightCol;
    vec3 param = -l;
    float _800 = PCFCube(shadowMapPoint[0], ld, param, bias, lightProj, n);
    direct *= _800;
    return direct;
}

void main()
{
    vec4 g0 = textureLod(gbuffer0, texCoord, 0.0);
    vec3 n;
    n.z = (1.0 - abs(g0.x)) - abs(g0.y);
    vec2 _980;
    if (n.z >= 0.0)
    {
        _980 = g0.xy;
    }
    else
    {
        _980 = octahedronWrap(g0.xy);
    }
    n = vec3(_980.x, _980.y, n.z);
    n = normalize(n);
    float roughness = g0.z;
    float param;
    uint param_1;
    unpackFloatInt16(g0.w, param, param_1);
    float metallic = param;
    uint matid = param_1;
    vec4 g1 = textureLod(gbuffer1, texCoord, 0.0);
    vec2 occspec = unpackFloat2(g1.w);
    vec3 albedo = surfaceAlbedo(g1.xyz, metallic);
    vec3 f0 = surfaceF0(g1.xyz, metallic);
    float depth = (textureLod(gbufferD, texCoord, 0.0).x * 2.0) - 1.0;
    vec3 p = getPos(eye, eyeLook, normalize(viewRay), depth, cameraProj);
    vec3 v = normalize(eye - p);
    float dotNV = max(dot(n, v), 0.0);
    vec3 envl = shIrradiance(n);
    envl *= albedo;
    envl += (backgroundCol * surfaceF0(g1.xyz, metallic));
    envl *= (envmapStrength * occspec.x);
    fragColor = vec4(envl.x, envl.y, envl.z, fragColor.w);
    vec3 _1091 = fragColor.xyz * textureLod(ssaotex, texCoord, 0.0).x;
    fragColor = vec4(_1091.x, _1091.y, _1091.z, fragColor.w);
    vec3 sh = normalize(v + sunDir);
    float sdotNH = dot(n, sh);
    float sdotVH = dot(v, sh);
    float sdotNL = dot(n, sunDir);
    float svisibility = 1.0;
    vec3 sdirect = lambertDiffuseBRDF(albedo, sdotNL) + (specularBRDF(f0, roughness, sdotNL, sdotNH, dotNV, sdotVH) * occspec.y);
    svisibility = shadowTestCascade(shadowMap, eye, p + ((n * shadowsBias) * 10.0), shadowsBias);
    vec3 _1148 = fragColor.xyz + ((sdirect * svisibility) * sunCol);
    fragColor = vec4(_1148.x, _1148.y, _1148.z, fragColor.w);
    int param_2 = 0;
    float param_3 = pointBias;
    vec3 _1171 = fragColor.xyz + sampleLight(p, n, v, dotNV, pointPos, pointCol, albedo, roughness, occspec.y, f0, param_2, param_3);
    fragColor = vec4(_1171.x, _1171.y, _1171.z, fragColor.w);
    fragColor.w = 1.0;
}

