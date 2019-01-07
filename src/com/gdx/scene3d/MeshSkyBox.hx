package com.gdx.scene3d;

import com.gdx.Buffer;
import com.gdx.gl.material.Material;
import com.gdx.gl.shaders.ShaderSkyBox;
import com.gdx.gl.TextureCube;
import com.gdx.math.Matrix;
import com.gdx.scene3d.cameras.Camera;
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
class MeshSkyBox extends Buffer
{
    public var texture:TextureCube;
    public var brush:Material;
    public var coordBuffer:GLBuffer;
	public var  indexBuffer:GLBuffer;
	private var shader:ShaderSkyBox;
	
	
	
	public function new(size:Float,cubemap:TextureCube)
	{
		super();
		brush = new Material();
		brush.BlendFace = false;
		brush.DepthMask = false;
		brush.DepthTest = false;
		brush.CullingFace = false;
		
		
		var vertices = [
    -size, -size,  size,
    size, -size,  size,
    -size,  size,  size,
    size,  size,  size,
    -size, -size, -size,
    size, -size, -size,
    -size,  size, -size,
    size,  size, -size,
	];

var indices = [ 0, 1, 2, 3, 7, 1, 5, 4, 7, 6, 2, 4, 0, 1 ];

coordBuffer = Gdx.gl.createBuffer();
indexBuffer = Gdx.gl.createBuffer();
				
           Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
           Gdx.gl.bufferData(Gdx.gl.ELEMENT_ARRAY_BUFFER,  new Int16Array(indices), Gdx.gl.STATIC_DRAW);
		   Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, null);
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, coordBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( vertices), Gdx.gl.STATIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
			
			shader = new ShaderSkyBox();
	}
	public function update()
	{
		
	}
	public function render(camera:Camera):Void
	{
		
		var meshTrasform:Matrix =  Matrix.Translation(camera.local_pos.x, camera.local_pos.y, camera.local_pos.z);
		
		shader.Bind(camera.viewMatrix, camera.projMatrix, meshTrasform);
		brush.Applay();
		shader.setCubeMap(texture);
	    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, coordBuffer);
		Gdx.gl.vertexAttribPointer(shader.vertexAttribute, 3, Gdx.gl.FLOAT, false, 0, 0); 
    	Gdx.gl.enableVertexAttribArray (shader.vertexAttribute);
		Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
        Gdx.gl.drawElements(Gdx.gl.TRIANGLE_STRIP, 14, Gdx.gl.UNSIGNED_SHORT, 0);
		Gdx.Instance().numTris += 14;
		Gdx.Instance().numVertex += 7;
		Gdx.Instance().numMesh += 1;
		Gdx.Instance().numSurfaces += 1;
		
		
		
	}
	override public function dispose()
	{
		super.dispose();
		brush.dispose();
		brush = null;
	this.coordBuffer = null;
	this.indexBuffer = null;
	}
}