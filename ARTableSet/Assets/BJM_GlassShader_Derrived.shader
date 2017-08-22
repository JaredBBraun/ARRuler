// Shader created with Shader Forge v1.36 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.36;sub:START;pass:START;ps:flbk:Unlit/Color,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33733,y:32680,varname:node_3138,prsc:2|emission-8023-OUT,alpha-9545-OUT,refract-9990-OUT;n:type:ShaderForge.SFN_NormalVector,id:6111,x:32083,y:33334,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:2132,x:32275,y:33334,varname:node_2132,prsc:2,tffrom:0,tfto:3|IN-6111-OUT;n:type:ShaderForge.SFN_ComponentMask,id:7007,x:32700,y:33334,varname:node_7007,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7685-OUT;n:type:ShaderForge.SFN_RemapRange,id:7685,x:32473,y:33334,varname:node_7685,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2132-XYZ;n:type:ShaderForge.SFN_Multiply,id:9990,x:33388,y:33336,varname:node_9990,prsc:2|A-7007-OUT,B-5196-OUT;n:type:ShaderForge.SFN_Slider,id:5196,x:32972,y:33534,ptovrint:False,ptlb:RefractionFactor,ptin:_RefractionFactor,varname:node_5196,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.2222222,max:1;n:type:ShaderForge.SFN_Tex2d,id:1208,x:32972,y:32661,ptovrint:False,ptlb:MatcapRimRefl,ptin:_MatcapRimRefl,varname:node_1208,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1951-OUT;n:type:ShaderForge.SFN_Slider,id:4533,x:32489,y:32441,ptovrint:False,ptlb:Transparency,ptin:_Transparency,varname:node_4533,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_ComponentMask,id:638,x:32548,y:32936,varname:node_638,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-7685-OUT;n:type:ShaderForge.SFN_OneMinus,id:499,x:32722,y:32936,varname:node_499,prsc:2|IN-638-OUT;n:type:ShaderForge.SFN_Slider,id:5131,x:32928,y:33098,ptovrint:False,ptlb:RimSizeRadiusAtFull,ptin:_RimSizeRadiusAtFull,varname:node_5131,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:7451,x:33298,y:32938,varname:node_7451,prsc:2|IN-499-OUT,IMIN-6479-OUT,IMAX-5131-OUT,OMIN-9020-OUT,OMAX-9326-OUT;n:type:ShaderForge.SFN_Vector1,id:9326,x:33085,y:33247,varname:node_9326,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9020,x:33085,y:33178,varname:node_9020,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:6479,x:32928,y:33006,ptovrint:False,ptlb:RimSizeRadiusAtStart,ptin:_RimSizeRadiusAtStart,varname:node_6479,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1709402,max:1;n:type:ShaderForge.SFN_Clamp01,id:9545,x:33486,y:32938,varname:node_9545,prsc:2|IN-7451-OUT;n:type:ShaderForge.SFN_Color,id:3508,x:32982,y:32473,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_3508,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8023,x:33268,y:32468,varname:node_8023,prsc:2|A-3508-RGB,B-1208-RGB;n:type:ShaderForge.SFN_Tex2d,id:8103,x:33462,y:32353,ptovrint:False,ptlb:BumpMap,ptin:_BumpMap,varname:node_8103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_NormalVector,id:8106,x:32103,y:32661,prsc:2,pt:True;n:type:ShaderForge.SFN_Transform,id:6120,x:32295,y:32661,varname:node_6120,prsc:2,tffrom:0,tfto:3|IN-8106-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1951,x:32720,y:32661,varname:node_1951,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5288-OUT;n:type:ShaderForge.SFN_RemapRange,id:5288,x:32493,y:32661,varname:node_5288,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6120-XYZ;proporder:5196-1208-4533-5131-6479-3508-8103;pass:END;sub:END;*/

Shader "ShaderTest/BJM_GlassShader_Derrived" {
    Properties {
        _RefractionFactor ("RefractionFactor", Range(-1, 1)) = 0.2222222
        _MatcapRimRefl ("MatcapRimRefl", 2D) = "white" {}
        _Transparency ("Transparency", Range(0, 1)) = 1
        _RimSizeRadiusAtFull ("RimSizeRadiusAtFull", Range(0, 1)) = 1
        _RimSizeRadiusAtStart ("RimSizeRadiusAtStart", Range(0, 1)) = 0.1709402
        _Color ("Color", Color) = (1,1,1,1)
        _BumpMap ("BumpMap", 2D) = "bump" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _RefractionFactor;
            uniform sampler2D _MatcapRimRefl; uniform float4 _MatcapRimRefl_ST;
            uniform float _RimSizeRadiusAtFull;
            uniform float _RimSizeRadiusAtStart;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float3 normalDir : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 normalDirection = i.normalDir;
                float3 node_7685 = (mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz.rgb*0.5+0.5);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (node_7685.rg*_RefractionFactor);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float2 node_1951 = (mul( UNITY_MATRIX_V, float4(normalDirection,0) ).xyz.rgb*0.5+0.5).rg;
                float4 _MatcapRimRefl_var = tex2D(_MatcapRimRefl,TRANSFORM_TEX(node_1951, _MatcapRimRefl));
                float3 emissive = (_Color.rgb*_MatcapRimRefl_var.rgb);
                float3 finalColor = emissive;
                float node_9020 = 0.0;
                return fixed4(lerp(sceneColor.rgb, finalColor,saturate((node_9020 + ( ((1.0 - node_7685.b) - _RimSizeRadiusAtStart) * (1.0 - node_9020) ) / (_RimSizeRadiusAtFull - _RimSizeRadiusAtStart)))),1);
            }
            ENDCG
        }
    }
    FallBack "Unlit/Color"
    CustomEditor "ShaderForgeMaterialInspector"
}
