package com.gdx.gl;

import com.gdx.Buffer;
import com.gdx.gl.shaders.Shader;
import com.gdx.gl.shaders.ShaderCast;

import lime.graphics.opengl.GLBuffer;
import lime.utils.Float32Array;
import lime.utils.Int16Array;
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
class ShadowBuffer extends Buffer
{
	public var vertexBuffer:GLBuffer;
	public var indexBuffer:GLBuffer;
	public var buffer:Float32Array;
	public var tris:Int;
	public function new() 
	{
		super();
		vertexBuffer = Gdx.gl.createBuffer();
		indexBuffer = Gdx.gl.createBuffer();
	}
	public function uploadVertex(v:Array<Float>):Void
    {
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, vertexBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER, new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }
	
	public function uploadIndices(v:Array<Int>):Void
    {
	       Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
           Gdx.gl.bufferData(Gdx.gl.ELEMENT_ARRAY_BUFFER,  new Int16Array(v), Gdx.gl.STATIC_DRAW);
		   Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, null);
		   tris = Std.int(v.length);
		
		   
   }
	public function render(s:ShaderCast):Void
	{
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, vertexBuffer);
		Gdx.gl.enableVertexAttribArray (s.vertexAttribute);
		Gdx.gl.vertexAttribPointer(s.vertexAttribute, 3, Gdx.gl.FLOAT, false, 0, 0); 
		Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
		Gdx.gl.drawElements(Gdx.gl.TRIANGLES, tris, Gdx.gl.UNSIGNED_SHORT, 0);
		Gdx.gl.disableVertexAttribArray (s.vertexAttribute);
		
		
	}
	override public function dispose()
	{
		super.dispose();
		Gdx.gl.deleteBuffer(vertexBuffer);
		Gdx.gl.deleteBuffer(indexBuffer );
	}
}