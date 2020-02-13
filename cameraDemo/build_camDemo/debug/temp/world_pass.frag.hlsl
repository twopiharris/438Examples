Texture2D<float4> envmap;
SamplerState _envmap_sampler;
uniform float envmapStrength;

static float3 normal;
static float4 fragColor;

struct SPIRV_Cross_Input
{
    float3 normal : TEXCOORD0;
};

struct SPIRV_Cross_Output
{
    float4 fragColor : SV_Target0;
};

float2 envMapEquirect(float3 normal_1)
{
    float phi = acos(normal_1.z);
    float theta = atan2(-normal_1.y, normal_1.x) + 3.1415927410125732421875f;
    return float2(theta / 6.283185482025146484375f, phi / 3.1415927410125732421875f);
}

void frag_main()
{
    float3 n = normalize(normal);
    float3 _57 = envmap.Sample(_envmap_sampler, envMapEquirect(n)).xyz * envmapStrength;
    fragColor = float4(_57.x, _57.y, _57.z, fragColor.w);
    float3 _64 = pow(fragColor.xyz, 2.2000000476837158203125f.xxx);
    fragColor = float4(_64.x, _64.y, _64.z, fragColor.w);
    fragColor.w = 0.0f;
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    normal = stage_input.normal;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.fragColor = fragColor;
    return stage_output;
}
