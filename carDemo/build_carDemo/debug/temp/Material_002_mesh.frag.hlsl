Texture2D<float4> ImageTexture_001;
SamplerState _ImageTexture_001_sampler;
Texture2D<float4> ImageTexture;
SamplerState _ImageTexture_sampler;

static float3 wnormal;
static float2 texCoord;
static float4 fragColor[2];

struct SPIRV_Cross_Input
{
    float2 texCoord : TEXCOORD0;
    float3 wnormal : TEXCOORD1;
};

struct SPIRV_Cross_Output
{
    float4 fragColor[2] : SV_Target0;
};

float2 octahedronWrap(float2 v)
{
    return (1.0f.xx - abs(v.yx)) * float2((v.x >= 0.0f) ? 1.0f : (-1.0f), (v.y >= 0.0f) ? 1.0f : (-1.0f));
}

float packFloatInt16(float f, uint i)
{
    return (0.06248569488525390625f * f) + (0.06250095367431640625f * float(i));
}

float packFloat2(float f1, float f2)
{
    return floor(f1 * 255.0f) + min(f2, 0.9900000095367431640625f);
}

void frag_main()
{
    float3 n = normalize(wnormal);
    float4 ImageTexture_001_texread_store = ImageTexture_001.Sample(_ImageTexture_001_sampler, texCoord);
    float3 _82 = pow(ImageTexture_001_texread_store.xyz, 2.2000000476837158203125f.xxx);
    ImageTexture_001_texread_store = float4(_82.x, _82.y, _82.z, ImageTexture_001_texread_store.w);
    float4 ImageTexture_texread_store = ImageTexture.Sample(_ImageTexture_sampler, texCoord);
    float3 _92 = pow(ImageTexture_texread_store.xyz, 2.2000000476837158203125f.xxx);
    ImageTexture_texread_store = float4(_92.x, _92.y, _92.z, ImageTexture_texread_store.w);
    float3 ImageTexture_001_Color_res = ImageTexture_001_texread_store.xyz;
    n = ImageTexture_001_Color_res;
    float3 ImageTexture_Color_res = ImageTexture_texread_store.xyz;
    float3 basecol = ImageTexture_Color_res;
    float roughness = 0.9772727489471435546875f;
    float metallic = 0.0f;
    float occlusion = 1.0f;
    float specular = 0.25f;
    n /= ((abs(n.x) + abs(n.y)) + abs(n.z)).xxx;
    float2 _130;
    if (n.z >= 0.0f)
    {
        _130 = n.xy;
    }
    else
    {
        _130 = octahedronWrap(n.xy);
    }
    n = float3(_130.x, _130.y, n.z);
    fragColor[0] = float4(n.xy, roughness, packFloatInt16(metallic, 0u));
    fragColor[1] = float4(basecol, packFloat2(occlusion, specular));
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    wnormal = stage_input.wnormal;
    texCoord = stage_input.texCoord;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.fragColor = fragColor;
    return stage_output;
}
