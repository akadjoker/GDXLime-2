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
class ShaderGrass extends Shader
{
	private var timeUniform:Dynamic;


	
	
	public function new() 
	{
		
		super();
		
  var sVertexShader=
"

mat3 mat4Tomat3(mat4 m4) 
{
  return mat3(
      m4[0][0], m4[0][1], m4[0][2],
      m4[1][0], m4[1][1], m4[1][2],
      m4[2][0], m4[2][1], m4[2][2]);
}

attribute vec3 inVertexPosition;
attribute vec4 inVertexColor;
attribute vec2 inTexCoord0;






uniform mat4 WorldMatrix;
uniform mat4 ViewMatrix;
uniform mat4 ProjectionMatrix;

uniform float time;




varying vec4 varVertexColor;
varying vec2 varTexCoord0;






void main(void)
{
	varTexCoord0 = inTexCoord0;
	  
    
	float fadeRange=1000.0;
        float frequency=0.5;
        vec3 direction=vec3(0.0,0.3,0.2);

        vec3 camPos =  -ViewMatrix[3].xyz * mat4Tomat3(ViewMatrix);
	

		vec4 displacedVertex = vec4(inVertexPosition,1.0);
		
		
		

	float dist = distance(camPos.xz, displacedVertex.xz);
        varVertexColor = inVertexColor;
	varVertexColor.a = 2.0 - (2.0 * dist / fadeRange);
	float oldposx = displacedVertex.x;
	if (varTexCoord0.y == 0.0)
	{
		float offset = sin(time + oldposx * frequency);
		displacedVertex.x += direction.x * offset;
		displacedVertex.y += direction.y * offset;
		displacedVertex.z += direction.z * offset;
	}



    
	
	
   gl_Position =   ProjectionMatrix * ViewMatrix * WorldMatrix * displacedVertex;
	
}";
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
				if(gl_FragColor.a < 0.5)
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

 
 timeUniform= Gdx.gl.getUniformLocation (shaderProgram, "time");
 
 

preSets();
 

trace(vertexAttribute+","+colorAttribute+","+texCoord0Attribute );
	 
 
	}
	
	override public function preSets():Void 
	{
		
		
		 Gdx.gl.uniform1f(timeUniform, Gdx.Instance().getTimer()/1000);
	}
	
	
}
