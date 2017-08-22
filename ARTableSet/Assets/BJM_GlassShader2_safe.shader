// Shader created with Shader Forge v1.36 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.36;sub:START;pass:START;ps:flbk:Unlit/Color,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33855,y:32629,varname:node_3138,prsc:2|emission-8023-OUT,alpha-9545-OUT,refract-7007-OUT;n:type:ShaderForge.SFN_NormalVector,id:6111,x:32083,y:33334,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:2132,x:32275,y:33334,varname:node_2132,prsc:2,tffrom:0,tfto:3|IN-6111-OUT;n:type:ShaderForge.SFN_ComponentMask,id:7007,x:33274,y:33558,varname:ScreenSampleMask,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7034-OUT;n:type:ShaderForge.SFN_RemapRange,id:7685,x:32656,y:33336,varname:node_7685,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2132-XYZ;n:type:ShaderForge.SFN_Slider,id:5196,x:32063,y:33735,ptovrint:False,ptlb:RefractionFactor,ptin:_RefractionFactor,varname:_RefractionFactor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Tex2d,id:1208,x:33359,y:32257,ptovrint:False,ptlb:MatcapRimRefl,ptin:_MatcapRimRefl,varname:_MatcapRimRefl,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4cd26eb2a4f30a64f9092618f8609005,ntxv:0,isnm:False|UVIN-6313-OUT;n:type:ShaderForge.SFN_ComponentMask,id:638,x:32548,y:32936,varname:node_638,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-7685-OUT;n:type:ShaderForge.SFN_OneMinus,id:499,x:32722,y:32936,varname:node_499,prsc:2|IN-638-OUT;n:type:ShaderForge.SFN_Slider,id:5131,x:32928,y:33098,ptovrint:False,ptlb:RimSizeRadiusAtFull,ptin:_RimSizeRadiusAtFull,varname:_RimSizeRadiusAtFull,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:7451,x:33274,y:32960,varname:node_7451,prsc:2|IN-499-OUT,IMIN-6479-OUT,IMAX-5131-OUT,OMIN-9020-OUT,OMAX-9326-OUT;n:type:ShaderForge.SFN_Vector1,id:9326,x:33085,y:33247,varname:node_9326,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9020,x:33085,y:33178,varname:node_9020,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:6479,x:32928,y:33006,ptovrint:False,ptlb:RimSizeRadiusAtStart,ptin:_RimSizeRadiusAtStart,varname:_RimSizeRadiusAtStart,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:9545,x:33652,y:32932,varname:node_9545,prsc:2|IN-5503-OUT;n:type:ShaderForge.SFN_Color,id:3508,x:33136,y:32684,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8023,x:33607,y:32409,varname:node_8023,prsc:2|A-3508-RGB,B-1208-RGB;n:type:ShaderForge.SFN_NormalVector,id:8106,x:31020,y:32654,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:6120,x:31212,y:32654,varname:node_6120,prsc:2,tffrom:0,tfto:3|IN-8106-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1951,x:31804,y:32725,varname:MaskNormalTrans,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5288-OUT;n:type:ShaderForge.SFN_RemapRange,id:5288,x:31617,y:32661,varname:node_5288,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6120-XYZ;n:type:ShaderForge.SFN_Tex2d,id:4489,x:32160,y:32913,ptovrint:False,ptlb:MatcapLookup,ptin:_MatcapLookup,varname:_MatcapLookup,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:51f146170a02ea14ea42e0426fef725d,ntxv:0,isnm:False|UVIN-1951-OUT;n:type:ShaderForge.SFN_Append,id:1866,x:32938,y:32620,varname:node_1866,prsc:2|A-3261-OUT,B-1951-G;n:type:ShaderForge.SFN_Divide,id:7034,x:32643,y:33561,varname:node_7034,prsc:2|A-2132-XYZ,B-8210-OUT;n:type:ShaderForge.SFN_Exp,id:8210,x:32409,y:33587,varname:node_8210,prsc:2,et:1|IN-5196-OUT;n:type:ShaderForge.SFN_Add,id:5503,x:33473,y:32932,varname:node_5503,prsc:2|A-3508-A,B-7451-OUT;n:type:ShaderForge.SFN_Multiply,id:8117,x:31792,y:32402,varname:node_8117,prsc:2|A-8902-R,B-8902-R;n:type:ShaderForge.SFN_ComponentMask,id:8902,x:31528,y:32403,varname:node_8902,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6120-XYZ;n:type:ShaderForge.SFN_Subtract,id:8611,x:32008,y:32240,varname:node_8611,prsc:2|A-1855-OUT,B-8117-OUT;n:type:ShaderForge.SFN_Vector1,id:1855,x:31792,y:32209,varname:node_1855,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:4598,x:31792,y:32529,varname:node_4598,prsc:2|A-8902-G,B-8902-G;n:type:ShaderForge.SFN_Subtract,id:7093,x:32278,y:32326,cmnt:dz,varname:node_7093,prsc:2|A-8611-OUT,B-4598-OUT;n:type:ShaderForge.SFN_Add,id:6092,x:32033,y:32508,varname:node_6092,prsc:2|A-8117-OUT,B-4598-OUT;n:type:ShaderForge.SFN_If,id:6313,x:33167,y:32365,varname:node_6313,prsc:2|A-6092-OUT,B-3238-OUT,GT-9348-UVOUT,EQ-9348-UVOUT,LT-1866-OUT;n:type:ShaderForge.SFN_Vector1,id:3238,x:32158,y:32544,varname:node_3238,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:9348,x:32705,y:32518,varname:node_9348,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ArcTan2,id:334,x:32350,y:32812,varname:node_334,prsc:2,attp:0|A-7093-OUT,B-8902-R;n:type:ShaderForge.SFN_Pi,id:9276,x:32592,y:32800,varname:node_9276,prsc:2;n:type:ShaderForge.SFN_Divide,id:3261,x:32722,y:32737,varname:node_3261,prsc:2|A-334-OUT,B-9276-OUT;n:type:ShaderForge.SFN_TexCoord,id:2839,x:30675,y:32141,varname:node_2839,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:805,x:30886,y:32083,varname:node_805,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-2839-U;n:type:ShaderForge.SFN_RemapRange,id:9829,x:30886,y:32251,varname:node_9829,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-2839-V;n:type:ShaderForge.SFN_Append,id:6968,x:31390,y:32231,varname:node_6968,prsc:2|A-9378-OUT,B-9829-OUT;n:type:ShaderForge.SFN_Multiply,id:9378,x:31174,y:32087,varname:node_9378,prsc:2|A-805-OUT,B-9249-OUT;n:type:ShaderForge.SFN_Vector1,id:9249,x:31014,y:32175,varname:node_9249,prsc:2,v1:-1;proporder:5196-1208-5131-6479-3508-4489;pass:END;sub:END;*/

Shader "ShaderTest/BJM_GlassShader2_safe" {
    Properties {
        _RefractionFactor ("RefractionFactor", Range(0, 10)) = 0
        _MatcapRimRefl ("MatcapRimRefl", 2D) = "white" {}
        _RimSizeRadiusAtFull ("RimSizeRadiusAtFull", Range(0, 1)) = 1
        _RimSizeRadiusAtStart ("RimSizeRadiusAtStart", Range(0, 1)) = 1
        _Color ("Color", Color) = (1,1,1,1)
        _MatcapLookup ("MatcapLookup", 2D) = "white" {}
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
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float3 node_2132 = mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (node_2132.rgb/exp2(_RefractionFactor)).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float3 node_6120 = mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz;
                float2 node_8902 = node_6120.rgb.rg;
                float node_8117 = (node_8902.r*node_8902.r);
                float node_4598 = (node_8902.g*node_8902.g);
                float node_6313_if_leA = step((node_8117+node_4598),1.0);
                float node_6313_if_leB = step(1.0,(node_8117+node_4598));
                float2 MaskNormalTrans = (node_6120.rgb*0.5+0.5).rg;
                float2 node_6313 = lerp((node_6313_if_leA*float2((atan2(((1.0-node_8117)-node_4598),node_8902.r)/3.141592654),MaskNormalTrans.g))+(node_6313_if_leB*i.uv0),i.uv0,node_6313_if_leA*node_6313_if_leB);
                float4 _MatcapRimRefl_var = tex2D(_MatcapRimRefl,TRANSFORM_TEX(node_6313, _MatcapRimRefl));
                float3 emissive = (_Color.rgb*_MatcapRimRefl_var.rgb);
                float3 finalColor = emissive;
                float node_9020 = 0.0;
                return fixed4(lerp(sceneColor.rgb, finalColor,saturate((_Color.a+(node_9020 + ( ((1.0 - (node_2132.rgb*0.5+0.5).b) - _RimSizeRadiusAtStart) * (1.0 - node_9020) ) / (_RimSizeRadiusAtFull - _RimSizeRadiusAtStart))))),1);
            }
            ENDCG
        }
    }
    FallBack "Unlit/Color"
    CustomEditor "ShaderForgeMaterialInspector"
}
