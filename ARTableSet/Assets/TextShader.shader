// Shader created with Shader Forge v1.36 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.36;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33012,y:32669,varname:node_3138,prsc:2|emission-3356-RGB;n:type:ShaderForge.SFN_Tex2d,id:3356,x:32805,y:32735,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:_MainTexture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4cd26eb2a4f30a64f9092618f8609005,ntxv:0,isnm:False|UVIN-2840-OUT;n:type:ShaderForge.SFN_Tex2d,id:8058,x:32407,y:32746,ptovrint:False,ptlb:NoiseLookup,ptin:_NoiseLookup,varname:_NoiseLookup,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9e9ff2912495daa41ad9b7bf227495cd,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:2840,x:32594,y:32746,varname:node_2840,prsc:2|A-8058-R,B-8058-G;proporder:3356-8058;pass:END;sub:END;*/

Shader "ShaderTest/TestShader" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _NoiseLookup ("NoiseLookup", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform sampler2D _NoiseLookup; uniform float4 _NoiseLookup_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _NoiseLookup_var = tex2D(_NoiseLookup,TRANSFORM_TEX(i.uv0, _NoiseLookup));
                float2 node_2840 = float2(_NoiseLookup_var.r,_NoiseLookup_var.g);
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(node_2840, _MainTexture));
                float3 emissive = _MainTexture_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
