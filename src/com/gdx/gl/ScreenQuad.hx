package com.gdx.gl;
import com.gdx.Buffer;
import com.gdx.gl.material.Material;
import com.gdx.math.Matrix;
import com.gdx.scene3d.cameras.Camera;
import lime.utils.Assets;
import lime.graphics.opengl.GL;
import lime.graphics.opengl.GLBuffer;
import lime.graphics.opengl.GLRenderbuffer;
import lime.graphics.opengl.GLFramebuffer;
import lime.graphics.opengl.GLShader;
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
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */



class ScreenQuad
{
   

	private var program:GLProgram;
	private var buffer:GLBuffer;
	

	private var vertexSlot:Int;
	private var texCoordSlot:Int;
	private var imageUniform:GLUniformLocation;
	private var resolutionUniform:GLUniformLocation;


	
public function new()
	{
		var vertexShader = Gdx.gl.createShader (Gdx.gl.VERTEX_SHADER);
        Gdx.gl.shaderSource (vertexShader, defaultVertexShader);
        Gdx.gl.compileShader (vertexShader);
        if (Gdx.gl.getShaderParameter (vertexShader, Gdx.gl.COMPILE_STATUS) == 0) 
        {trace ("Load Vert:"+Gdx.gl.getShaderInfoLog(vertexShader));return;}
		
       var fragmentShader = Gdx.gl.createShader (Gdx.gl.FRAGMENT_SHADER);
       Gdx.gl.shaderSource (fragmentShader,defaultFRagShader);
       Gdx.gl.compileShader (fragmentShader);
       if (Gdx.gl.getShaderParameter (fragmentShader, Gdx.gl.COMPILE_STATUS) == 0) 
	   { trace("Load Frag:" + Gdx.gl.getShaderInfoLog(fragmentShader)); return; }
	  
	   
program = Gdx.gl.createProgram ();
Gdx.gl.attachShader (program, vertexShader);
Gdx.gl.attachShader (program, fragmentShader);
Gdx.gl.linkProgram (program);

if (Gdx.gl.getProgramParameter (program, Gdx.gl.LINK_STATUS) == 0) 
{
	        trace(Gdx.gl.getProgramInfoLog(program));
			trace("VALIDATE_STATUS: " + Gdx.gl.getProgramParameter(program, Gdx.gl.VALIDATE_STATUS));
			trace("ERROR: " + Gdx.gl.getError());
			return;
			
}


	
	
// default shader variables
		imageUniform = shaderUniform("uImage0");
	    vertexSlot = shaderAttribute("aVertex");
		texCoordSlot = shaderAttribute("aTexCoord");
		



		buffer = Gdx.gl.createBuffer();
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, buffer);
		Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER, new Float32Array(vertices), Gdx.gl.STATIC_DRAW);
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);

	

		
	}

	
	private inline function shaderAttribute(a:String):Int
	{
		return Gdx.gl.getAttribLocation(program, a);
	}

	/**
	 * Return the uniform location in this shader
	 * @param a  The uniform name to find
	 */
	private inline function shaderUniform(u:String):GLUniformLocation
	{
		return Gdx.gl.getUniformLocation(program, u);
	}
	private inline function bind()
	{
		Gdx.gl.useProgram(program);
	}

	
	 public function render(tex:GLTexture,w:Int,h:Int):Void
	{
		bind();
		Gdx.gl.enableVertexAttribArray(vertexSlot);
		Gdx.gl.enableVertexAttribArray(texCoordSlot);

	
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, buffer);
		Gdx.gl.vertexAttribPointer(vertexSlot, 2, Gdx.gl.FLOAT, false, 16, 0);
		Gdx.gl.vertexAttribPointer(texCoordSlot, 2, Gdx.gl.FLOAT, false, 16, 8);

		Gdx.gl.activeTexture(Gdx.gl.TEXTURE0);
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, tex);
		Gdx.gl.uniform1i(imageUniform, 0);
	

	

		Gdx.gl.drawArrays(Gdx.gl.TRIANGLES, 0, 6);

		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, null);
		
	
		Gdx.gl.disableVertexAttribArray(vertexSlot);
		Gdx.gl.disableVertexAttribArray(texCoordSlot);

	
	
	}
	

	
	
	private static inline var defaultVertexShader:String = "
#ifdef GL_ES
	precision mediump float;
#endif
attribute vec4 aVertex;
attribute vec2 aTexCoord;
varying vec2 vTexCoord;
void main() {
	vTexCoord = aTexCoord;
	gl_Position = vec4(aVertex.x, aVertex.y, 0.0, 1.0);
}";

	private static inline var defaultFRagShader:String = "
#ifdef GL_ES
	precision mediump float;
#endif
varying vec2 vTexCoord;
uniform sampler2D uImage0;
void main() {
	
    gl_FragColor = texture2D(uImage0, vTexCoord);
}";
	private static var vertices(get, never):Array<Float>;
	private static inline function get_vertices():Array<Float>
	{
		return [
			-1.0, -1.0, 0, 0,
			 1.0, -1.0, 1, 0,
			-1.0,  1.0, 0, 1,
			 1.0, -1.0, 1, 0,
			 1.0,  1.0, 1, 1,
			-1.0,  1.0, 0, 1
		];
	}

}