package com.gdx.scene2d.render;

import com.gdx.Gdx;
import com.gdx.gl.BlendMode;
import com.gdx.gl.shaders.ShaderTexture;
import com.gdx.gl.Texture;
import com.gdx.math.Matrix;
import com.gdx.scene3d.cameras.Camera;
import com.gdx.util.Clip;

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
class SpriteCloud 
{

	private var capacity:Int;
	private var numVerts:Int;
	private var numIndices:Int; 
	private var vertices:Float32Array;
	private var indices:Int16Array;
	private var lastIndexCount:Int;
	private var drawing:Bool;
	public var currentBatchSize:Int;
	private var currentBlendMode:Int;
	private var currentBaseTexture:Texture;
    private var vertexBuffer:GLBuffer;
    private var indexBuffer:GLBuffer;
    private var invTexWidth:Float = 0;
    private var invTexHeight:Float = 0;
	public var vertexStrideSize:Int;
	private var index:Int;
	private var rebuid:Bool;

	public var shader:ShaderTexture;
	public var camera:Camera;
	public var transform:Matrix;
		

	public function new(c:Camera,texture:Texture,capacity:Int ) 
	{
     	shader = cast( Gdx.Instance().materials[Gdx.SHADERTEXTURE], ShaderTexture);
		camera = c;
		transform = Matrix.Identity();
		
	   this.capacity = capacity;
       vertexStrideSize =  (3 + 2 + 4)   * 4  ; 
       vertexBuffer = Gdx.gl.createBuffer();
       indexBuffer = Gdx.gl.createBuffer();
       index = 0;
       vertices = new Float32Array(capacity * vertexStrideSize);
	   numIndices = vertices.length * 6;
   	   indices = new Int16Array(numIndices);
	
		for (i in 0...numIndices) 
		{
			var index2 = i * 6;
			var index3 = i * 4;
			this.indices[index2 + 0] = index3 + 0;
			this.indices[index2 + 1] = index3 + 1;
			this.indices[index2 + 2] = index3 + 2;
			this.indices[index2 + 3] = index3 + 0;
			this.indices[index2 + 4] = index3 + 2;
			this.indices[index2 + 5] = index3 + 3;
		};
		
		

    
    Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
    Gdx.gl.bufferData(Gdx.gl.ELEMENT_ARRAY_BUFFER, indices, Gdx.gl.STATIC_DRAW);
	indices = null;
    drawing = false;
    currentBatchSize = 0;
	currentBlendMode = BlendMode.NORMAL;
    this.currentBaseTexture = texture;
    invTexWidth  = 1.0 / texture.width;
    invTexHeight = 1.0 / texture.height;
    rebuid = false;
	
	}
	

	
 public function dispose():Void 
{
	    this.indices = null;
		this.vertices = null;
        Gdx.gl.deleteBuffer(indexBuffer);
		Gdx.gl.deleteBuffer(vertexBuffer);
	 
	
}
	

	
public function addImage(img:Image)
{
var r, g, b, a:Float;
r = img._red;
g = img._green;
b = img._blue;
a = img.alpha;



					
		var worldOriginX:Float = img.x + img.originX;
		var worldOriginY:Float = img.y + img.originY;
		var fx:Float = -img.originX;
		var fy:Float = -img.originY;
		var fx2:Float = img.width - img.originX;
		var fy2:Float = img.height - img.originY;
		
		if (img.scaleX != 1 || img.scaleY != 1)
		{
			fx *= img.scaleX;
			fy *= img.scaleY;
			fx2 *= img.scaleX;
			fy2 *= img.scaleY;
		}
		
		 var p1x:Float = fx;
		var p1y:Float = fy;
		var p2x:Float = fx;
		var p2y:Float = fy2;
		var p3x:Float = fx2;
		var p3y:Float = fy2;
		var p4x:Float = fx2;
		var p4y:Float = fy;

		var x1:Float;
		var y1:Float;
		var x2:Float;
		var y2:Float;
		var x3:Float;
		var y3:Float;
		var x4:Float;
		var y4:Float;
		
		
		
			if (img.angle != 0) 
			{
		
	                var angle:Float = img.angle * Math.PI / 180;
					var cos:Float = Math.cos(angle);
					var sin:Float = Math.sin(angle);
					
			x1 = cos * p1x - sin * p1y;
			y1 = sin * p1x + cos * p1y;

			x2 = cos * p2x - sin * p2y;
			y2 = sin * p2x + cos * p2y;

			x3 = cos * p3x - sin * p3y;
			y3 = sin * p3x + cos * p3y;

			x4 = x1 + (x3 - x2);
			y4 = y3 - (y2 - y1);
		} else {
			x1 = p1x;
			y1 = p1y;

			x2 = p2x;
			y2 = p2y;

			x3 = p3x;
			y3 = p3y;

			x4 = p4x;
			y4 = p4y;
		}

		x1 += worldOriginX;
		y1 += worldOriginY;
		x2 += worldOriginX;
		y2 += worldOriginY;
		x3 += worldOriginX;
		y3 += worldOriginY;
		x4 += worldOriginX;
		y4 += worldOriginY;
		
				
 var u:Float  = img.clip.x * invTexWidth;
 var u2:Float = (img.clip.x + img.clip.width) * invTexWidth;
 
 var v:Float  = (img.clip.y + img.clip.height) * invTexHeight;
 var v2:Float = img.clip.y * invTexHeight;
 
 
 if (img.flipX) {
			var tmp:Float = u;
			u = u2;
			u2 = tmp;
		}

		if (img.flipY) {
			var tmp:Float = v;
			v = v2;
			v2 = tmp;
		}
 
vertices[index++] = x1;
vertices[index++] = y1;
vertices[index++] = 0;
vertices[index++] = u;vertices[index++] = v;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;
	
vertices[index++] = x2;
vertices[index++] = y2;
vertices[index++] = 0;
vertices[index++] = u;vertices[index++] = v2;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;

vertices[index++] = x3;
vertices[index++] = y3;
vertices[index++] = 0;
vertices[index++] = u2;vertices[index++] = v2;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;

vertices[index++] = x4;
vertices[index++] = y4;
vertices[index++] = 0;
vertices[index++] = u2;vertices[index++] = v;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;


    currentBatchSize++;
	
	}
	

public function addTile(x:Float,y:Float,width:Float,height:Float,clip:Clip,flipx:Bool,flipy:Bool)
{
var r, g, b, a:Float;
r = 1;
g = 1;
b = 1;
a = 1;




		var fx2:Float = x+width;
		var fy2:Float = y+height;
		

		
		
		
				
 var u:Float  = clip.x * invTexWidth;
 var u2:Float = (clip.x + clip.width) * invTexWidth;
 
 var v:Float  = (clip.y + clip.height) * invTexHeight;
 var v2:Float = clip.y * invTexHeight;

 if (flipx) 
 {
			var tmp:Float = u;
			u = u2;
			u2 = tmp;
		}

		if (flipy)
		{
			var tmp:Float = v;
			v = v2;
			v2 = tmp;
		}
 
vertices[index++] = x;
vertices[index++] = y;
vertices[index++] = 0;
vertices[index++] = u;vertices[index++] = v;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;
	
vertices[index++] = x;
vertices[index++] = fy2;
vertices[index++] = 0;
vertices[index++] = u;vertices[index++] = v2;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;

vertices[index++] = fx2;
vertices[index++] = fy2;
vertices[index++] = 0;
vertices[index++] = u2;vertices[index++] = v2;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;

vertices[index++] = fx2;
vertices[index++] = y;
vertices[index++] = 0;
vertices[index++] = u2;vertices[index++] = v;
vertices[index++] = r;vertices[index++] = g;vertices[index++] = b;vertices[index++] = a;

		    
						
				
			
						
    currentBatchSize++;
	
	}
	

	public function build()
	{
		  Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, this.vertexBuffer);
		  Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER, vertices, Gdx.gl.STATIC_DRAW);
		  vertices = null;
	
	}
	
	public function render()
	{
		if (!rebuid)
		{
			build();
			rebuid = true;
			return;
		}
	
	 if (currentBatchSize == 0) return;
	 
	 shader.Bind(camera.viewMatrix, camera.projMatrix, transform);
	 
	Gdx.gl.enableVertexAttribArray (shader.vertexAttribute);
	Gdx.gl.enableVertexAttribArray (shader.texCoord0Attribute);
	Gdx.gl.enableVertexAttribArray (shader.colorAttribute);
	 
	 shader.setTexture0(currentBaseTexture);
	 
	 
     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, this.vertexBuffer);
	 Gdx.gl.vertexAttribPointer(shader.vertexAttribute, 3, Gdx.gl.FLOAT, false, vertexStrideSize, 0);
     Gdx.gl.vertexAttribPointer(shader.texCoord0Attribute  , 2, Gdx.gl.FLOAT, false, vertexStrideSize, 3 * 4);
     Gdx.gl.vertexAttribPointer(shader.colorAttribute, 4, Gdx.gl.FLOAT, false, vertexStrideSize, (3+2) * 4);
	
	 
     Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, this.indexBuffer); 
	 BlendMode.setBlend(currentBlendMode); 
     Gdx.gl.drawElements(Gdx.gl.TRIANGLES, currentBatchSize * 6, Gdx.gl.UNSIGNED_SHORT, 0);

    }

}