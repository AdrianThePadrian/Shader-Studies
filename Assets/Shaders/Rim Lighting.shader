Shader "Custom/Rim Lighting"
{
    Properties
    {
        _RimColor("Rim Color", Color) = (0,5,5,0)
        _RimPower("Rim Power", Range(0.5,8)) = 3
    }
    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        struct Input 
        {
        float3 viewDir;
        };

    float4 _RimColor;
    float _RimPower;

    void surf(Input IN, inout SurfaceOutput o) {
        half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
        o.Emission = _RimColor.rgb * pow(rim, _RimPower);

    }
       ENDCG
    }
    FallBack "Diffuse"
}

