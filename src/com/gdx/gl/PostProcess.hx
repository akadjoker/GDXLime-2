package com.gdx.gl;
import com.gdx.Buffer;
import com.gdx.gl.material.Material;
import com.gdx.math.Matrix;
import com.gdx.scene3d.cameras.Camera;
import lime.utils.Assets;
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

typedef Uniform = {
	var id:GLUniformLocation;
	var value:Float;
};

class PostProcess
{
    private var framebuffer:GLFramebuffer;
	private var renderbuffer:GLRenderbuffer;
	private var texture:GLTexture;

	private var program:GLProgram;
	private var buffer:GLBuffer;
	private var renderTo:GLFramebuffer;
	private var defaultFramebuffer:GLFramebuffer = null;

	/* @private Time accumulator passed to the shader */
	private var time:Float = 0;

	private var vertexSlot:Int;
	private var texCoordSlot:Int;
	private var imageUniform:GLUniformLocation;
	private var resolutionUniform:GLUniformLocation;
	private var timeUniform:GLUniformLocation;
	private var uniforms:Map<String, Uniform>;
	
public function new(sFragmentShader:String)
	{
		var vertexShader = Gdx.gl.createShader (Gdx.gl.VERTEX_SHADER);
        Gdx.gl.shaderSource (vertexShader, defaultVertexShader);
        Gdx.gl.compileShader (vertexShader);
        if (Gdx.gl.getShaderParameter (vertexShader, Gdx.gl.COMPILE_STATUS) == 0) 
        {trace ("Load Vert:"+Gdx.gl.getShaderInfoLog(vertexShader));return;}
		
       var fragmentShader = Gdx.gl.createShader (Gdx.gl.FRAGMENT_SHADER);
       Gdx.gl.shaderSource (fragmentShader,Assets.getText( sFragmentShader));
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

	uniforms = new Map<String, Uniform>();
	
	
// default shader variables
		imageUniform = shaderUniform("uImage0");
		timeUniform = shaderUniform("uTime");
		resolutionUniform = shaderUniform("uResolution");
		vertexSlot = shaderAttribute("aVertex");
		texCoordSlot = shaderAttribute("aTexCoord");
		


		// create and bind the framebuffer
		framebuffer = Gdx.gl.createFramebuffer();
		
		rebuild();

		var status = Gdx.gl.checkFramebufferStatus(Gdx.gl.FRAMEBUFFER);
		/*
		switch (status)
		{
			case Gdx.gl.FRAMEBUFFER_INCOMPLETE_ATTACHMENT:
				trace("FRAMEBUFFER_INCOMPLETE_ATTACHMENT");
			case Gdx.gl.FRAMEBUFFER_UNSUPPORTED:
				trace("GL_FRAMEBUFFER_UNSUPPORTED");
			case Gdx.gl.FRAMEBUFFER_COMPLETE:
			default:
				trace("Check frame buffer: " + status);
		}
*/

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

	/**
	 * Enables the PostProcess object for rendering
	 * @param to  (Optional) Render to PostProcess framebuffer instead of screen
	 */
	public function enable(?frameBuffer:PostProcess):Void
	{
			renderTo =  (frameBuffer == null ? defaultFramebuffer : frameBuffer.framebuffer);
	}
	 public function render():Void
	{
		time += Gdx.Instance().deltaTime;
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, renderTo);
		Gdx.gl.clear(Gdx.gl.COLOR_BUFFER_BIT | Gdx.gl.DEPTH_BUFFER_BIT);
		bind();
		Gdx.gl.enableVertexAttribArray(vertexSlot);
		Gdx.gl.enableVertexAttribArray(texCoordSlot);

		Gdx.gl.activeTexture(Gdx.gl.TEXTURE0);
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, texture);

		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, buffer);
		Gdx.gl.vertexAttribPointer(vertexSlot, 2, Gdx.gl.FLOAT, false, 16, 0);
		Gdx.gl.vertexAttribPointer(texCoordSlot, 2, Gdx.gl.FLOAT, false, 16, 8);

		Gdx.gl.uniform1i(imageUniform, 0);
		Gdx.gl.uniform1f(timeUniform, time);
		Gdx.gl.uniform2f(resolutionUniform,Gdx.Instance().width, Gdx.Instance().height);

		for (u in uniforms) Gdx.gl.uniform1f(u.id, u.value);

		Gdx.gl.drawArrays(Gdx.gl.TRIANGLES, 0, 6);

		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, null);
		
	
		Gdx.gl.disableVertexAttribArray(vertexSlot);
		Gdx.gl.disableVertexAttribArray(texCoordSlot);

	
		// check gl error
		if (Gdx.gl.getError() == Gdx.gl.INVALID_FRAMEBUFFER_OPERATION)
		{
			trace("INVALID_FRAMEBUFFER_OPERATION!!");
		}
	}
	/**
	 * Rebuilds the renderbuffer to match screen dimensions
	 */
	public function rebuild()
	{
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, framebuffer);

		if (texture != null) Gdx.gl.deleteTexture(texture);
		if (renderbuffer != null) Gdx.gl.deleteRenderbuffer(renderbuffer);

		createTexture(Gdx.Instance().width, Gdx.Instance().height);
		createRenderbuffer(Gdx.Instance().width, Gdx.Instance().height);
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, null);
	}

	/* @private creates a renderbuffer object */
	private inline function createRenderbuffer(width:Int, height:Int)
	{
		// Bind the renderbuffer and create a depth buffer
		renderbuffer = Gdx.gl.createRenderbuffer();
		Gdx.gl.bindRenderbuffer(Gdx.gl.RENDERBUFFER, renderbuffer);
		Gdx.gl.renderbufferStorage(Gdx.gl.RENDERBUFFER, Gdx.gl.DEPTH_COMPONENT16, width, height);

		// Specify renderbuffer as depth attachement
		Gdx.gl.framebufferRenderbuffer(Gdx.gl.FRAMEBUFFER, Gdx.gl.DEPTH_ATTACHMENT, Gdx.gl.RENDERBUFFER, renderbuffer);
	}

	/* @private creates a texture */
	private inline function createTexture(width:Int, height:Int)
	{
		texture = Gdx.gl.createTexture();
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, texture);
		Gdx.gl.texImage2D(Gdx.gl.TEXTURE_2D, 0, Gdx.gl.RGB,  width, height,  0,  Gdx.gl.RGB, Gdx.gl.UNSIGNED_BYTE, null);

		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_S, Gdx.gl.CLAMP_TO_EDGE);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_T, Gdx.gl.CLAMP_TO_EDGE);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER , Gdx.gl.LINEAR);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.LINEAR);

		// specify texture as color attachment
		Gdx.gl.framebufferTexture2D(Gdx.gl.FRAMEBUFFER, Gdx.gl.COLOR_ATTACHMENT0, Gdx.gl.TEXTURE_2D, texture, 0);
	}

	/**
	 * Capture what is subsequently rendered to this framebuffer
	 */
	public function capture()
	{
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, framebuffer);
		Gdx.gl.viewport(0, 0,Gdx.Instance().width, Gdx.Instance().height);
		Gdx.gl.clear(Gdx.gl.DEPTH_BUFFER_BIT | Gdx.gl.COLOR_BUFFER_BIT);
	}
	/**
	 * Set a uniform value in the shader
	 * @param uniform  The uniform name within the shader source
	 * @param value    Value to set the uniform to
	 */
	public function setUniform(uniform:String, value:Float):Void
	{
		if (uniforms.exists(uniform))
		{
			var uniform = uniforms.get(uniform);
			uniform.value = value;
		}
		else
		{
			var id:GLUniformLocation = shaderUniform(uniform);
			uniforms.set(uniform, {id: id, value: value});
		}
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