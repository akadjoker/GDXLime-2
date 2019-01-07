package com.gdx.gl.shaders;


import com.gdx.color.Color3;

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
class TextureShaderDetailFog extends Shader
{
	
	public var vFogInfosUniform:Dynamic;
	public var vFogColorUniform:Dynamic;
	

	private var color:Color3;
	private var fogMode:Float;
	private var fogStart:Float;
	private var fogEnd:Float;
	private var fogDensity:Float;
	
	
	public function new() 
	{
		super();
		
  var sVertexShader=
"
attribute vec3 inVertexPosition;
attribute vec2 inTexCoord0;
attribute vec2 inTexCoord1;
attribute vec4 inVertexColor;
uniform mat4 WorldMatrix;
uniform mat4 ViewMatrix;
uniform mat4 ProjectionMatrix;
varying vec2 varTexCoord0;
varying vec2 varTexCoord1;
varying vec4 varVertexColor;


void main(void)
{
	varTexCoord0 = inTexCoord0;
	varTexCoord1 = inTexCoord1;
	varVertexColor = inVertexColor;
    gl_Position =   ProjectionMatrix * ViewMatrix * WorldMatrix * vec4(inVertexPosition, 1.0);
}
";
//******************

 var sFragmentShader=

#if !desktop
"precision mediump float;" +
#end
"
uniform sampler2D uTextureUnit0;
uniform sampler2D uTextureUnit1;
varying vec2 varTexCoord0;
varying vec2 varTexCoord1;
varying vec4 varVertexColor;

#define FOGMODE_NONE 0.
#define FOGMODE_EXP 1.
#define FOGMODE_EXP2 2.
#define FOGMODE_LINEAR 3.
#define E 2.71828

uniform vec4 vFogInfos;
uniform vec3 vFogColor;

float calcFogFactor() {

    // gets distance from camera to vertex
    float fogDistance = gl_FragCoord.z / gl_FragCoord.w;

    float fogCoeff = 1.0;
    float fogStart = vFogInfos.y;
    float fogEnd = vFogInfos.z;
    float fogDensity = vFogInfos.w;

    if (FOGMODE_LINEAR == vFogInfos.x) {
        fogCoeff = (fogEnd - fogDistance) / (fogEnd - fogStart);
    }
    else if (FOGMODE_EXP == vFogInfos.x) {
        fogCoeff = 1.0 / pow(E, fogDistance * fogDensity);
    }
    else if (FOGMODE_EXP2 == vFogInfos.x) {
        fogCoeff = 1.0 / pow(E, fogDistance * fogDistance * fogDensity * fogDensity);
    }

    return clamp(fogCoeff, 0.0, 1.0);
}

vec4 renderDetailMap()
{
	vec4 Texel0 = texture2D(uTextureUnit0, varTexCoord0);
	vec4 Texel1 = texture2D(uTextureUnit1, varTexCoord1);
	
	vec4 Color = Texel0;
	Color += Texel1 - 0.5;
	
	return Color;
}

void main ()
{
	 vec4 color = varVertexColor * renderDetailMap();

    // factor in fog color
    float fog = calcFogFactor();
    color.rgb = fog * color.rgb + (1.0 - fog) * vFogColor;
    gl_FragColor =  color;

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

	   


vertexAttribute = Gdx.gl.getAttribLocation (shaderProgram, "inVertexPosition");
texCoord0Attribute = Gdx.gl.getAttribLocation (shaderProgram, "inTexCoord0");
texCoord1Attribute = Gdx.gl.getAttribLocation (shaderProgram, "inTexCoord1");
colorAttribute = Gdx.gl.getAttribLocation (shaderProgram, "inVertexColor");


trace(vertexAttribute+"," + texCoord0Attribute+","+texCoord1Attribute+"," +  colorAttribute );



 projMatrixUniform= Gdx.gl.getUniformLocation (shaderProgram, "ProjectionMatrix");
 worldMatrixUniform = Gdx.gl.getUniformLocation (shaderProgram, "WorldMatrix");
 viewMatrixUniform = Gdx.gl.getUniformLocation (shaderProgram, "ViewMatrix");
 
 texture0Uniform = Gdx.gl.getUniformLocation (shaderProgram, "uTextureUnit0");
 texture1Uniform = Gdx.gl.getUniformLocation (shaderProgram, "uTextureUnit1");
 
 vFogInfosUniform=Gdx.gl.getUniformLocation (shaderProgram, "vFogInfos");
 vFogColorUniform=Gdx.gl.getUniformLocation (shaderProgram, "vFogColor");
	
 color = new Color3(0.2, 0.2, 0.3);

 

 //   FOGMODE_NONE - default one, fog is deactivated.
//   FOGMODE_EXP - the fog density is following an exponential function.
//   FOGMODE_EXP2 - same that above but faster.
//   FOGMODE_LINEAR - the fog density is following a linear function.

	
setFogMode(2, 20.0, 60.0, 0.009);
 
	}
	
	override public function preSets():Void
	{
		if (shaderProgram == null) return;
		Gdx.gl.uniform3f(vFogColorUniform, color.r, color.r, color.b);
		Gdx.gl.uniform4f(vFogInfosUniform,fogMode,fogStart,fogEnd,fogDensity);
	}
	
	
	public function setFogColor(c:Color3):Void
	{
	color.copyFrom(c);
	}
	public function setFogMode(mode:Float, fogStar:Float,fogEnd:Float,fogDensity:Float ):Void
	{
	this.fogMode = mode;
	this.fogStart = fogStar;
	this.fogEnd = fogEnd;
	this.fogDensity = fogDensity;
	}
}