package com.gdx.gl;
import com.gdx.Buffer;
import com.gdx.Gdx.gl.material.Material;
import com.gdx.math.Matrix;
import com.gdx.scene3d.cameras.Camera;
import lime.utils.Assets;
import lime.graphics.openGdx.gl.GL;
import lime.graphics.openGdx.gl.GLBuffer;
import lime.graphics.openGdx.gl.GLRenderbuffer;
import lime.graphics.openGdx.gl.GLFramebuffer;
import lime.graphics.openGdx.gl.GLShader;
import lime.graphics.openGdx.gl.GLProgram;
import lime.graphics.openGdx.gl.GLTexture;
import lime.graphics.openGdx.gl.GLUniformLocation;
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

 
class RenderTexture extends Texture
{
    private var framebuffer:GLFramebuffer;
	private var renderbuffer:GLRenderbuffer;
	private var program:GLProgram;
	private var buffer:GLBuffer;
	private var renderTo:GLFramebuffer;
	private var defaultFramebuffer:GLFramebuffer = null;
	
	
	public function new(tex_width:Int=128,tex_height:Int=128) 
	{
		super();
		this.texWidth = tex_width;
		this.texHeight = tex_height;
		
		// create and bind the framebuffer
		framebuffer = Gdx.gl.createFramebuffer();
		
		rebuild();

		var status = Gdx.gl.checkFramebufferStatus(Gdx.gl.FRAMEBUFFER);
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


	}
	
	/**
	 * Rebuilds the renderbuffer to match screen dimensions
	 */
	public function rebuild()
	{
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, framebuffer);
		if (data != null) Gdx.gl.deleteTexture(data);
		if (renderbuffer != null) Gdx.gl.deleteRenderbuffer(renderbuffer);
		createRenderbuffer(texWidth,texHeight);

	}

	/* @private creates a renderbuffer object */
	private inline function createRenderbuffer(width:Int, height:Int)
	{
		
		data = Gdx.gl.createTexture();
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, data);
	
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_S, Gdx.gl.CLAMP_TO_EDGE);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_T, Gdx.gl.CLAMP_TO_EDGE);
	

		var mipMap:Bool = false;
		
		if (mipMap)
		{
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER , Gdx.gl.LINEAR_MIPMAP_NEAREST);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.LINEAR);
		Gdx.gl.generateMipmap(Gdx.gl.TEXTURE_2D);
		
		
		}else
		{
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER , Gdx.gl.LINEAR);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.LINEAR);
			
		}
		
		Gdx.gl.texImage2D(Gdx.gl.TEXTURE_2D, 0, Gdx.gl.RGB,  width, height,  0,  Gdx.gl.RGB, Gdx.gl.UNSIGNED_BYTE, null);
		
		// Bind the renderbuffer and create a depth buffer
		renderbuffer = Gdx.gl.createRenderbuffer();
		Gdx.gl.bindRenderbuffer(Gdx.gl.RENDERBUFFER, renderbuffer);
		Gdx.gl.renderbufferStorage(Gdx.gl.RENDERBUFFER, Gdx.gl.DEPTH_COMPONENT16, width, height);
		
		
		

		Gdx.gl.framebufferTexture2D(Gdx.gl.FRAMEBUFFER, Gdx.gl.COLOR_ATTACHMENT0, Gdx.gl.TEXTURE_2D, data, 0);
		Gdx.gl.framebufferRenderbuffer(Gdx.gl.FRAMEBUFFER, Gdx.gl.DEPTH_ATTACHMENT, Gdx.gl.RENDERBUFFER, renderbuffer);
		
		
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, null);
        Gdx.gl.bindRenderbuffer(Gdx.gl.RENDERBUFFER, null);
        Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, null);
	}

	
	/**
	 * Capture what is subsequently rendered to this framebuffer
	 */
	public function Begin()
	{
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, framebuffer);
		Gdx.gl.viewport(0, 0, texWidth, texHeight);
		Gdx.gl.clearColor(0, 0, 0, 0);
		Gdx.gl.clear(Gdx.gl.DEPTH_BUFFER_BIT | Gdx.gl.COLOR_BUFFER_BIT);
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, data);
     
	}
	public function End()
	{
		Gdx.gl.viewport(0, 0,Gdx.Instance().width,Gdx.Instance().height);
		Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, null);
		
	}
	public function enable(?frameBuffer:RenderTexture):Void
	{
			renderTo =  (frameBuffer == null ? defaultFramebuffer : frameBuffer.framebuffer);
	}
}