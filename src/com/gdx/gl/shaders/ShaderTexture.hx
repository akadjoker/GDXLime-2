package com.gdx.gl.shaders;



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
class ShaderTexture extends Shader
{
	



	
	
	public function new() 
	{
		super();
		
  var sVertexShader=
"
attribute vec3 inVertexPosition;
attribute vec4 inVertexColor;
attribute vec2 inTexCoord0;


uniform mat4 WorldMatrix;
uniform mat4 ViewMatrix;
uniform mat4 ProjectionMatrix;
varying vec4 varVertexColor;
varying vec2 varTexCoord0;

void main(void)
{
	varTexCoord0 = inTexCoord0;
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
varying vec2 varTexCoord0;
varying vec4 varVertexColor;



void main ()
{
				gl_FragColor = varVertexColor * texture2D(uTextureUnit0, varTexCoord0);
				if(gl_FragColor.a < 0.2)
                discard;
		
		
	
	
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

 
 
 
 

preSets();
 

trace(vertexAttribute+","+colorAttribute+","+texCoord0Attribute );
	 
 
	}
	
	
	
	
}