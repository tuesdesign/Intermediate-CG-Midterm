Shader "Custom/SelectTexture"
{
    Properties
    {
        _Level1_Tex ("Level 1 Albedo (RGB)", 2D) = "white" {} // The first level Texture 
        _Level2_Tex ("Level 2 Albedo (RGB)", 2D) = "white" {} // The second level Texture
        [Toggle] _UseLevel2("Use Level 2?", Float) = 0 // which texture should we use?

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        // Define our variables within the subshader
        sampler2D _Level1_Tex;
        sampler2D _Level2_Tex;
        float _UseLevel2;

        struct Input
        {
            float2 uv_Level1_Tex;
            float2 uv_Level2_Tex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = fixed4(0,0,0,0); // The output colour
            if (_UseLevel2 == 0) // If level 1 is selected
            {
                c = tex2D(_Level1_Tex, IN.uv_Level1_Tex); // poll the texture of level 1
            }
            else  // (Level 2 is selected)
            {
                c = tex2D(_Level2_Tex, IN.uv_Level2_Tex); // poll the texture of level 2
            }

            // return the output
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
