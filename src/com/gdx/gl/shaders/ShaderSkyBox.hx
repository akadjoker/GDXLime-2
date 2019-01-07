package com.gdx.gl.shaders;

import com.gdx.gl.TextureCube;
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
class ShaderSkyBox extends Shader
{
	 public var textureCubeUniform:Dynamic;
	 

	public function new() 
	{
		super();
 var SkyBoxVertexShader=
"
attribute vec3 inVertexPosition;
uniform mat4 uProjMatrix;
uniform mat4 uWorldMatrix;
uniform mat4 uViewMatrix;
varying  vec3 vTextureCoord;


void main(void) {
	
	gl_Position = uProjMatrix * uViewMatrix* uWorldMatrix * vec4(inVertexPosition, 1.0);
	vTextureCoord.xyz = inVertexPosition.xyz;
	
}
";

 var SkyBoxFragmentShader=

#if !desktop
"precision mediump float;" +
#end
"
uniform samplerCube uCubeSampler;
varying vec3 vTextureCoord;


void main(void)
{	
    vec3 cube = vec3(textureCube(uCubeSampler, vTextureCoord.xyz));
	gl_FragColor = vec4(cube, 1.0);
		

}";
	 


	 


		 var vertexShader = Gdx.gl.createShader (Gdx.gl.VERTEX_SHADER);
        Gdx.gl.shaderSource (vertexShader, SkyBoxVertexShader);
        Gdx.gl.compileShader (vertexShader);
        if (Gdx.gl.getShaderParameter (vertexShader, Gdx.gl.COMPILE_STATUS) == 0) 
        {trace ("Load Vert:"+Gdx.gl.getShaderInfoLog(vertexShader));}
		
       var fragmentShader = Gdx.gl.createShader (Gdx.gl.FRAGMENT_SHADER);
       Gdx.gl.shaderSource (fragmentShader, SkyBoxFragmentShader);
       Gdx.gl.compileShader (fragmentShader);
       if (Gdx.gl.getShaderParameter (fragmentShader, Gdx.gl.COMPILE_STATUS) == 0) 
	   { trace("Load Frag:"+Gdx.gl.getShaderInfoLog(fragmentShader));}

shaderProgram = Gdx.gl.createProgram ();
Gdx.gl.attachShader (shaderProgram, vertexShader);
Gdx.gl.attachShader (shaderProgram, fragmentShader);
Gdx.gl.linkProgram (shaderProgram);

if (Gdx.gl.getProgramParameter (shaderProgram, Gdx.gl.LINK_STATUS) == 0) 
{trace ("Unable to initialize the shader program.");}


 Gdx.gl.useProgram (shaderProgram);
 projMatrixUniform  = Gdx.gl.getUniformLocation (shaderProgram, "uProjMatrix");
 worldMatrixUniform = Gdx.gl.getUniformLocation (shaderProgram, "uWorldMatrix");
 viewMatrixUniform = Gdx.gl.getUniformLocation (shaderProgram, "uViewMatrix");
 textureCubeUniform = Gdx.gl.getUniformLocation (shaderProgram, "uCubeSampler");
 vertexAttribute    = Gdx.gl.getAttribLocation (shaderProgram, "inVertexPosition");
 #if debug trace(projMatrixUniform +"," + worldMatrixUniform + "," + textureCubeUniform + "," + vertexAttribute); #end
	}
	
	 public function setCubeMap(tex:TextureCube):Void
	{
		if (shaderProgram == null) return;
	   if (tex != null)
		{	
		if(tex != Gdx.Instance().currentBaseTextures[0] )
        {
       		Gdx.Instance().currentBaseTextures[0] = tex;
			tex.Bind();
			Gdx.gl.uniform1i(textureCubeUniform, 0);
			Gdx.Instance().numTextures+=1;
       }
	 }
	 }
}