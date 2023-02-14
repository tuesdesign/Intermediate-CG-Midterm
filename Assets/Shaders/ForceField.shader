Shader "Custom/ForceField"
{
    Properties
    {
        _ForceFieldTex("Force Field Tex", 2D) = "white" {} // The texture of the force field

        _RimLightColour("Hologram Color", Color) = (1,1,1,0) // The colour of the force field
        _RimLightPower("Hologram Power", Range(0.1,10)) = 1.0 // The strength of the Rim Lighting Effect
        [Toggle] _EnableForceField ("Force Field Enabled?", Float) = 0 // Should the force field be used?
    }
    SubShader
    {
        Pass // Use the depth buffer to avoid seeing the backfaces
        {
            ZWrite On
            ColorMask 0
        }

        Tags { "Queue"="Transparent" } // Our shader makes use of transparency.

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        struct Input  // Required inputs
        {
            float3 viewDir;
            float2 uv_ForceFieldTex;
        };

        // Define our variables within the subshader
        sampler2D _ForceFieldTex;
        float4 _RimLightColour;
        float _RimLightPower;
        float _EnableForceField;

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            fixed4 pattern = tex2D(_ForceFieldTex, IN.uv_ForceFieldTex);

            o.Emission = _RimLightColour.rgb * pow(rim, _RimLightPower) * pattern.r; // pattern.r is the channel containing the strength of the forcefield at a point.
            o.Alpha = pow(rim, _RimLightPower) * _EnableForceField; // if _EnableForceField = 0, then the forcefiled is off and transparency should be 0
        }
        ENDCG
    }
    FallBack "Diffuse"
}
