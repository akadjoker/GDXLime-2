package com.gdx.gl.shaders;


import com.gdx.math.Matrix;

import lime.graphics.opengl.GLBuffer;
import lime.graphics.opengl.GLProgram;
import lime.graphics.opengl.GLTexture;
import lime.graphics.opengl.GLUniformLocation;
import lime.utils.Float32Array;
import lime.utils.UInt8Array;
/*
DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
         Version 0.002, 14, January, 1978

Copyright (C) 2014 Luis Santos AKA DJOKER <djokertheripper@gmail.com>

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.

           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

 0. You just DO WHAT THE FUCK YOU WANT TO.
*/
class ShaderSkin extends Shader
{

	
	
	public function new() 
	{
		super();
		
		var maxbones:Int = 80;
		
  var sVertexShader=
"
attribute vec3 inVertexPosition;
attribute vec3 inVertexNormal;
attribute vec4 inVertexColor;
attribute vec2 inTexCoord0;

attribute vec4  BoneIDs;
attribute vec4  Weights;

uniform mat4 WorldMatrix;
uniform mat4 ViewMatrix;
uniform mat4 ProjectionMatrix;
uniform mat4 gBones["+maxbones+"];


varying vec3 varVertexNormal;
varying vec2 varTexCoord0;
varying vec4 varVertexColor;

varying vec4 varWSVertex;

void main(void)
{
	varTexCoord0 = inTexCoord0;
    varVertexColor = inVertexColor;

	 int  	index0 = int(BoneIDs[0]);
	 int  	index1 = int(BoneIDs[1]);
	 int  	index2 = int(BoneIDs[2]);
	 int  	index3 = int(BoneIDs[3]);
	 

	mat4 BoneTransform = gBones[index0]  * Weights.x;
	// BoneTransform      += gBones[index1] * Weights.y;
	// BoneTransform      += gBones[index2] * Weights.z;
	// BoneTransform      += gBones[index3] * Weights.w;		  
	 
  
	 if (index1 != -1)
	 {
	   BoneTransform      += gBones[index1] * Weights.y;
	    
	   if (index2 != -1)
	   {
		   BoneTransform      += gBones[index2] * Weights.z;
		   
		   if (index3 != -1)
		   {
			     BoneTransform      += gBones[index3] * Weights.w;		  
		   }
		   
	   }
	   
	 } 
	
	vec4 PosL    = BoneTransform * vec4(inVertexPosition, 1.0);
     gl_Position =   ProjectionMatrix * ViewMatrix * WorldMatrix * PosL;
}
";
//******************

 var sFragmentShader=

#if !desktop
"precision mediump float;" +
#end
"

#define Solid 0
#define TransparentAlphaChannel 5
#define TransparentAlphaChannelRef 6
#define TransparentVertexAlpha 7
#define TransparentReflection2Layer 8

uniform sampler2D uTextureUnit0;

varying vec2 varTexCoord0;
varying vec4 varVertexColor;
varying vec3 varVertexNormal;


uniform int uMaterialType;



vec4 renderSolid()
{
	vec4 Color = varVertexColor;
	Color *= texture2D(uTextureUnit0, varTexCoord0);
	Color.a = 1.0;
	return Color;
}


vec4 renderTransparent()
{
	vec4 Color = vec4(1.0, 1.0, 1.0, 1.0);


		Color *= texture2D(uTextureUnit0, varTexCoord0);

	return Color;
}

void main ()
{
   vec4 FragColor= vec4(1.0, 1.0, 1.0, 1.0);
	
 if (uMaterialType == Solid)
		FragColor = renderSolid();
	else if(uMaterialType == TransparentAlphaChannel)
		FragColor = renderTransparent();
	else if(uMaterialType == TransparentAlphaChannelRef)
	{
		vec4 Color = renderTransparent();
		
		if (Color.a < 0.5)
			discard;
		
		FragColor = Color;
	}
	else if(uMaterialType == TransparentVertexAlpha)
	{
		vec4 Color = renderTransparent();
		Color.a = varVertexColor.a;
		
		FragColor = Color;
	}
	else
		FragColor = vec4(1.0, 1.0, 1.0, 1.0);
gl_FragColor = FragColor;
}";	

//**************************************************

        var vertexShader = Gdx.gl.createShader (Gdx.gl.VERTEX_SHADER);
        Gdx.gl.shaderSource (vertexShader, sVertexShader);
        Gdx.gl.compileShader (vertexShader);
        if (Gdx.gl.getShaderParameter (vertexShader, Gdx.gl.COMPILE_STATUS) == 0) 
        {trace ("Load Vert:"+Gdx.gl.getShaderInfoLog(vertexShader));return;}
		
       var fragmentShader = Gdx.gl.createShader (Gdx.gl.FRAGMENT_SHADER);
       Gdx.gl.shaderSource (fragmentShader, sFragmentShader);
       Gdx.gl.compileShader (fragmentShader);
       if (Gdx.gl.getShaderParameter (fragmentShader, Gdx.gl.COMPILE_STATUS) == 0) 
	   { trace("Load Frag:" + Gdx.gl.getShaderInfoLog(fragmentShader)); return; }
	  
	   
shaderProgram = Gdx.gl.createProgram ();
Gdx.gl.attachShader (shaderProgram, vertexShader);
Gdx.gl.attachShader (shaderProgram, fragmentShader);
Gdx.gl.linkProgram (shaderProgram);

if (Gdx.gl.getProgramParameter (shaderProgram, Gdx.gl.LINK_STATUS) == 0) 
{trace ("Unable to initialize the shader program."); return; }
//{throw "Unable to initialize the shader program.";}

 Gdx.gl.useProgram (shaderProgram);	   


 vertexAttribute = Gdx.gl.getAttribLocation (shaderProgram, "inVertexPosition");
 texCoord0Attribute = Gdx.gl.getAttribLocation (shaderProgram, "inTexCoord0");
 colorAttribute = Gdx.gl.getAttribLocation (shaderProgram, "inVertexColor");
 projMatrixUniform= Gdx.gl.getUniformLocation (shaderProgram, "ProjectionMatrix");
 worldMatrixUniform = Gdx.gl.getUniformLocation (shaderProgram, "WorldMatrix");
 viewMatrixUniform = Gdx.gl.getUniformLocation (shaderProgram, "ViewMatrix");
 texture0Uniform = Gdx.gl.getUniformLocation (shaderProgram, "uTextureUnit0");
 MaterialType= Gdx.gl.getUniformLocation (shaderProgram, "uMaterialType");
 setMaterialType(0);

 bonesAttribute = Gdx.gl.getAttribLocation (shaderProgram, "BoneIDs");
 wighsAttribute = Gdx.gl.getAttribLocation (shaderProgram, "Weights"); 

 boneMatrixUniform = [];
 
 for (i in 0...maxbones)
{
var name:String = "gBones[" + i + "]";
boneMatrixUniform.push(Gdx.gl.getUniformLocation (shaderProgram, name));
setBoneMatrix(i, Matrix.Identity());
}
 




 

 

trace(bonesAttribute+","+wighsAttribute );
	 
 
	}
	
	
	
	
	
}