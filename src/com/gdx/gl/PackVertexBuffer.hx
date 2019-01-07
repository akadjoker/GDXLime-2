package com.gdx.gl ;


import com.gdx.Buffer;
import com.gdx.gl.shaders.Shader;
import lime.graphics.opengl.GL;
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
class PackVertexBuffer extends Buffer
{
	public var bonesBuffer:GLBuffer;
	public var wighsBuffer:GLBuffer;
	
	public var pipeline:Shader;
	public var vertexBuffer:GLBuffer;
	
	public var buffer:Float32Array;
	public var indices:Int16Array;
	public  var  indexBuffer:GLBuffer;
	private var indicescount:Int;
	
	public var useDetail:Bool;
	public var useTexture:Bool;
	public var useColors:Bool;
	public var useNormals:Bool;
		public var useBones:Bool;
	
	
	public var vertexStrideSize:Int;
	

	private var index:Int;
	

	public function new(shader:Shader) 
	{
		super();
		this.pipeline = shader;
		

		if (shader.colorAttribute!= -1)
		{
			useColors = true;
		} else
		{
			useColors = false;
		}
		
		if (shader.normalAttribute != -1)
		{
			useNormals = true;
		} else
		{
			useNormals = false;
		}

		if (shader.texCoord0Attribute!= -1)
		{
			this.useTexture = true;
		} else
		{
			this.useTexture = false;
		}
		if (shader.texCoord1Attribute!= -1)
		{
			useDetail = true;
		} else
		{
			useDetail = false;
		}
		if (pipeline.bonesAttribute >=0)
		{
			useBones = true;
		
		} else
		{
			useBones = false;
		}
		
		var inc:Int = 3;
		
		if (useTexture)
		{
			inc += 2;
		}
		if (useDetail )
			{
			inc += 2;	
			}
		if (useNormals)
		{
			inc += 3;
		}
		if (useColors)
		{
			inc += 4;
			
		}
		if (useBones)
		{ 
				inc += 4;
				inc += 4;
		}
		vertexStrideSize =  inc * 4 ;
		
		indexBuffer = Gdx.gl.createBuffer();
		vertexBuffer = Gdx.gl.createBuffer();
	}
	public function uploadIndices(v:Array<Int>):Void
    {
	       Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
           Gdx.gl.bufferData(Gdx.gl.ELEMENT_ARRAY_BUFFER,  new Int16Array(v), Gdx.gl.STATIC_DRAW);
		   Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, null);
		   indicescount = v.length;
		   
   }
   public function uploadVertex(v:Array<Float>):Void
    {
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, vertexBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER, new Float32Array( v), Gdx.gl.STATIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }
	public function render(primitiveType:Int,Num_Triangles:Int):Void
	{
		var offSet:Int = 0;
		
		

		
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, vertexBuffer);
		Gdx.gl.vertexAttribPointer(pipeline.vertexAttribute, 3, Gdx.gl.FLOAT, false, vertexStrideSize, 0); 
    	Gdx.gl.enableVertexAttribArray (pipeline.vertexAttribute);
		offSet += 3;
	

	
		if (pipeline.normalAttribute != -1)
		{	
		Gdx.gl.vertexAttribPointer(pipeline.normalAttribute, 3, Gdx.gl.FLOAT, false, vertexStrideSize, offSet*4); 
	    Gdx.gl.enableVertexAttribArray (pipeline.normalAttribute);
		offSet += 3;
		}
	
		if (pipeline.texCoord0Attribute != -1)
		{	
	    Gdx.gl.vertexAttribPointer(pipeline.texCoord0Attribute, 2, Gdx.gl.FLOAT, false,  vertexStrideSize, offSet*4);  
		Gdx.gl.enableVertexAttribArray (pipeline.texCoord0Attribute);
		offSet += 2;
		}
	
		if (pipeline.texCoord1Attribute != -1)
		{	
	    Gdx.gl.vertexAttribPointer(pipeline.texCoord1Attribute, 2, Gdx.gl.FLOAT, false,  vertexStrideSize, offSet*4);  
		Gdx.gl.enableVertexAttribArray (pipeline.texCoord1Attribute);
		offSet += 2;
		}
		
		if (pipeline.colorAttribute != -1)
		{	
	    Gdx.gl.vertexAttribPointer(pipeline.colorAttribute, 4, Gdx.gl.FLOAT, false,  vertexStrideSize, offSet*4);  
	    Gdx.gl.enableVertexAttribArray (pipeline.colorAttribute);
		offSet += 4;
		}
			
		    if (pipeline.bonesAttribute !=-1)
			{
		       Gdx.gl.vertexAttribPointer(pipeline.bonesAttribute, 4, Gdx.gl.FLOAT, false, vertexStrideSize, offSet*4);  
		       Gdx.gl.enableVertexAttribArray (pipeline.bonesAttribute);
			   offSet += 4;
			}
			if ( pipeline.wighsAttribute!=-1)
			{
		    
		      Gdx.gl.vertexAttribPointer(pipeline.wighsAttribute, 4, Gdx.gl.FLOAT, false, vertexStrideSize, offSet*4);  
   	          Gdx.gl.enableVertexAttribArray (pipeline.wighsAttribute);
			  offSet += 4;
			}
	
		
	    
		Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
        Gdx.gl.drawElements(primitiveType, Num_Triangles, Gdx.gl.UNSIGNED_SHORT, 0);
		
		
		Gdx.gl.disableVertexAttribArray (pipeline.vertexAttribute);
	

	
		if (pipeline.normalAttribute != -1)
		{	
	    Gdx.gl.disableVertexAttribArray (pipeline.normalAttribute);

		}
	
		if (pipeline.texCoord0Attribute != -1)
		{	
		Gdx.gl.disableVertexAttribArray (pipeline.texCoord0Attribute);
	
		}
	
		if (pipeline.texCoord1Attribute != -1)
		{	
		Gdx.gl.disableVertexAttribArray (pipeline.texCoord1Attribute);
	
		}
		
		if (pipeline.colorAttribute != -1)
		{	
	    Gdx.gl.disableVertexAttribArray (pipeline.colorAttribute);
	
		}
			
		    if (pipeline.bonesAttribute !=-1)
			{
		       Gdx.gl.disableVertexAttribArray (pipeline.bonesAttribute);
		
			}
			if ( pipeline.wighsAttribute!=-1)
			{
		       Gdx.gl.disableVertexAttribArray (pipeline.wighsAttribute);
			}
	
	}
	public function renderTo(newShader:Shader,primitiveType:Int,Num_Triangles:Int):Void
	{
		var offSet:Int = 0;
		
		

		
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, vertexBuffer);
		Gdx.gl.vertexAttribPointer(newShader.vertexAttribute, 3, Gdx.gl.FLOAT, false, vertexStrideSize, 0); 
    	Gdx.gl.enableVertexAttribArray (newShader.vertexAttribute);
		offSet += 3;
	

	
		if (newShader.normalAttribute != -1)
		{	
		Gdx.gl.vertexAttribPointer(newShader.normalAttribute, 3, Gdx.gl.FLOAT, false, vertexStrideSize, offSet*4); 
	    Gdx.gl.enableVertexAttribArray (newShader.normalAttribute);
		offSet += 3;
		}
	
		if (newShader.texCoord0Attribute != -1)
		{	
	    Gdx.gl.vertexAttribPointer(newShader.texCoord0Attribute, 2, Gdx.gl.FLOAT, false,  vertexStrideSize, offSet*4);  
		Gdx.gl.enableVertexAttribArray (newShader.texCoord0Attribute);
		offSet += 2;
		}
	
		if (newShader.texCoord1Attribute != -1)
		{	
	    Gdx.gl.vertexAttribPointer(newShader.texCoord1Attribute, 2, Gdx.gl.FLOAT, false,  vertexStrideSize, offSet*4);  
		Gdx.gl.enableVertexAttribArray (newShader.texCoord1Attribute);
		offSet += 2;
		}
		
		if (newShader.colorAttribute != -1)
		{	
	    Gdx.gl.vertexAttribPointer(newShader.colorAttribute, 4, Gdx.gl.FLOAT, false,  vertexStrideSize, offSet*4);  
	    Gdx.gl.enableVertexAttribArray (newShader.colorAttribute);
		offSet += 4;
		}
			
		    if (newShader.bonesAttribute !=-1)
			{
		       Gdx.gl.vertexAttribPointer(newShader.bonesAttribute, 4, Gdx.gl.FLOAT, false, vertexStrideSize, offSet*4);  
		       Gdx.gl.enableVertexAttribArray (newShader.bonesAttribute);
			   offSet += 4;
			}
			if ( newShader.wighsAttribute!=-1)
			{
		    
		      Gdx.gl.vertexAttribPointer(newShader.wighsAttribute, 4, Gdx.gl.FLOAT, false, vertexStrideSize, offSet*4);  
   	          Gdx.gl.enableVertexAttribArray (newShader.wighsAttribute);
			  offSet += 4;
			}
	
		
	    
		Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
        Gdx.gl.drawElements(primitiveType, Num_Triangles, Gdx.gl.UNSIGNED_SHORT, 0);
		
		Gdx.gl.disableVertexAttribArray (newShader.vertexAttribute);
	

	
		if (newShader.normalAttribute != -1)
		{	
	    Gdx.gl.disableVertexAttribArray (newShader.normalAttribute);

		}
	
		if (newShader.texCoord0Attribute != -1)
		{	
		Gdx.gl.disableVertexAttribArray (newShader.texCoord0Attribute);
	
		}
	
		if (newShader.texCoord1Attribute != -1)
		{	
		Gdx.gl.disableVertexAttribArray (newShader.texCoord1Attribute);
	
		}
		
		if (newShader.colorAttribute != -1)
		{	
	    Gdx.gl.disableVertexAttribArray (newShader.colorAttribute);
	
		}
			
		    if (newShader.bonesAttribute !=-1)
			{
		       Gdx.gl.disableVertexAttribArray (newShader.bonesAttribute);
		
			}
			if ( newShader.wighsAttribute!=-1)
			{
		       Gdx.gl.disableVertexAttribArray (newShader.wighsAttribute);
			}
	}
	override public function dispose()
	{
		super.dispose();
		Gdx.gl.deleteBuffer(vertexBuffer);
		Gdx.gl.deleteBuffer(indexBuffer);
	}
}