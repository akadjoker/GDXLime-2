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
class VertexBuffer extends Buffer
{
	public var bonesBuffer:GLBuffer;
	public var wighsBuffer:GLBuffer;

  	
	public var coordBuffer:GLBuffer;
	public var tex0Buffer:GLBuffer;
	public var tex1Buffer:GLBuffer;
	public var colBuffer:GLBuffer;
	
	public var normBuffer:GLBuffer;
	
	
	
	public var  indexBuffer:GLBuffer;

	
	public var useDetail:Bool;
	public var useTexture:Bool;
	public var useColors:Bool;
	public var useNormals:Bool;
	public var useBones:Bool;

	public var pipeline:Shader;
	
	public function new(shader:Shader) 
	{
		super();
		this.pipeline = shader;
		
		

		if (shader.colorAttribute>=0 )
		{
			useColors = true;
		} else
		{
			useColors = false;
		}
		
	
		
		if (shader.normalAttribute >=0 )
		{
			useNormals = true;
		} else
		{
			useNormals = false;
		}

		if (shader.texCoord0Attribute  >=0 )
		{
			this.useTexture = true;
		} else
		{
			this.useTexture = false;
		}
		if (shader.texCoord1Attribute >=0 )
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
		
		//trace( useTexture +" , "+ useDetail);
		
		
		coordBuffer = Gdx.gl.createBuffer();
		indexBuffer = Gdx.gl.createBuffer();
		
		
		if (useNormals)
		{
		normBuffer = Gdx.gl.createBuffer();
	    }
		if (useTexture)
		{
		tex0Buffer = Gdx.gl.createBuffer();
		if (useDetail)
		{
		tex1Buffer = Gdx.gl.createBuffer();
		}
		}
	
		if (useColors)
		{
		colBuffer  = Gdx.gl.createBuffer();
		}
		
	
		
		if (useBones)
		{ 
	
			  bonesBuffer=Gdx.gl.createBuffer();
              wighsBuffer = Gdx.gl.createBuffer();
		}
		
		
		
	}
	public function set(shader:Shader) :Void
	{
	
		this.pipeline = shader;
		

		if (shader.colorAttribute>=0 )
		{
			useColors = true;
		} else
		{
			useColors = false;
		}
		
		
		
		if (shader.normalAttribute >=0 )
		{
			useNormals = true;
		} else
		{
			useNormals = false;
		}

		if (shader.texCoord0Attribute  >=0 )
		{
			this.useTexture = true;
		} else
		{
			this.useTexture = false;
		}
		if (shader.texCoord1Attribute >=0 )
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
		
		
		
		
		
		if (useNormals)
		{
		if(normBuffer==null) normBuffer = Gdx.gl.createBuffer();
	    }
		if (useTexture)
		{
		if(tex0Buffer==null) tex0Buffer = Gdx.gl.createBuffer();
		if (useDetail)
		{
		if(tex1Buffer==null)tex1Buffer = Gdx.gl.createBuffer();
		}
		}
	
		if (useColors)
		{
		if(colBuffer==null) colBuffer  = Gdx.gl.createBuffer();
		}
		
	
		
		if (useBones)
		{ 
		 
			if(bonesBuffer==null)  bonesBuffer=Gdx.gl.createBuffer();
            if(wighsBuffer==null)   wighsBuffer = Gdx.gl.createBuffer();
		}
		
		
		
	}
	public function uploadIndices(v:Array<Int>):Void
    {
	       Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
           Gdx.gl.bufferData(Gdx.gl.ELEMENT_ARRAY_BUFFER,  new Int16Array(v), Gdx.gl.STATIC_DRAW);
		   Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, null);
		
		   
   }
     public function uploadBones(v:Array<Float>):Void
    {
	           if (!useBones) return;
			  
	       Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, bonesBuffer);
           Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array(v), Gdx.gl.DYNAMIC_DRAW);
		   Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
   }
   
  
	 public function uploadHeigs(v:Array<Float>):Void
    {
		if (!useBones) return;
		
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, wighsBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }     
	   
	public function uploadVertex(v:Array<Float>):Void
    {
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, coordBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }
	public function uploadNormals(v:Array<Float>):Void
    {
		   if (!useNormals) return;
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, normBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }
	public function uploadColors(v:Array<Float>):Void
    {
		   if (!useColors) return;
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, colBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }
	public function uploadUVCoord0(v:Array<Float>):Void
    {
		   if (!useTexture) return;
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex0Buffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }
	public function uploadUVCoord1(v:Array<Float>):Void
    {
		
		   if (!useDetail) return;
		   
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex1Buffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  new Float32Array( v), Gdx.gl.DYNAMIC_DRAW);
			Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, null);
    }	
			public function setUVCoord0(v:Float32Array):Void
    {
		   if (!useTexture) return;
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex0Buffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER, v , Gdx.gl.DYNAMIC_DRAW);
	 }
			public function setColors(v:Float32Array):Void
    {
		   if (!useColors) return;
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, colBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  v, Gdx.gl.DYNAMIC_DRAW);
	 }
		public function setVertex(v:Float32Array):Void
    {
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, coordBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  v, Gdx.gl.DYNAMIC_DRAW);
	  }	 
		public function setNormals(v:Float32Array):Void
      {
		if (!useNormals) return;
		    Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, normBuffer);
	        Gdx.gl.bufferData(Gdx.gl.ARRAY_BUFFER,  v, Gdx.gl.DYNAMIC_DRAW);
	  }	 	
	public function render(primitiveType:Int,Num_Triangles:Int):Void
	{
		
		if (pipeline.vertexAttribute == -1) return;
	
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, coordBuffer);
		Gdx.gl.vertexAttribPointer(pipeline.vertexAttribute, 3, Gdx.gl.FLOAT, false, 0, 0); 
    	Gdx.gl.enableVertexAttribArray (pipeline.vertexAttribute);
		
	
			if (pipeline.normalAttribute != -1)
			{
		     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, normBuffer);
		     Gdx.gl.vertexAttribPointer(pipeline.normalAttribute, 3, Gdx.gl.FLOAT, false, 0, 0); 
	         Gdx.gl.enableVertexAttribArray (pipeline.normalAttribute);
			}
	
		
		
		
			if (pipeline.texCoord0Attribute != -1)
			{
	         Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex0Buffer);
   	         Gdx.gl.vertexAttribPointer(pipeline.texCoord0Attribute, 2, Gdx.gl.FLOAT, false, 0, 0);  
		     Gdx.gl.enableVertexAttribArray (pipeline.texCoord0Attribute);
			}
	     	
		
				if (pipeline.texCoord1Attribute != -1)
				{
	             Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex1Buffer);
   	             Gdx.gl.vertexAttribPointer(pipeline.texCoord1Attribute, 2, Gdx.gl.FLOAT, false, 0, 0); 
		         Gdx.gl.enableVertexAttribArray (pipeline.texCoord1Attribute);
			
				}
	
			

  
		
			
	if (pipeline.colorAttribute != -1)
			{
	         Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, colBuffer);
   	         Gdx.gl.vertexAttribPointer(pipeline.colorAttribute, 4, Gdx.gl.FLOAT, false, 0, 0);  
	         Gdx.gl.enableVertexAttribArray (pipeline.colorAttribute);
			}

		
		if (useBones)
		{
		
			if (pipeline.bonesAttribute >=0)
			{
		     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, bonesBuffer);
   	         Gdx.gl.vertexAttribPointer(pipeline.bonesAttribute, 4, Gdx.gl.FLOAT, false, 0, 0);  
		     Gdx.gl.enableVertexAttribArray (pipeline.bonesAttribute);
			}
			if ( pipeline.wighsAttribute>=0)
			{
		    
		     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, wighsBuffer);
   	         Gdx.gl.vertexAttribPointer(pipeline.wighsAttribute, 4, Gdx.gl.FLOAT, false, 0, 0);  
		     Gdx.gl.enableVertexAttribArray (pipeline.wighsAttribute);
			}
			
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

		
		if (useBones)
		{
		
			if (pipeline.bonesAttribute >=0)
			{
		     Gdx.gl.disableVertexAttribArray (pipeline.bonesAttribute);
			}
			if ( pipeline.wighsAttribute>=0)
			{
		     Gdx.gl.disableVertexAttribArray (pipeline.wighsAttribute);
			}
		
		}
	}
	
	public function renderTo(shader:Shader,primitiveType:Int,Num_Triangles:Int):Void
	{
		
		if (shader.vertexAttribute == -1) return;
	
		Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, coordBuffer);
		Gdx.gl.vertexAttribPointer(shader.vertexAttribute, 3, Gdx.gl.FLOAT, false, 0, 0); 
    	Gdx.gl.enableVertexAttribArray (shader.vertexAttribute);
		
	
		if (shader.normalAttribute != -1)
		{
		     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, normBuffer);
		     Gdx.gl.vertexAttribPointer(shader.normalAttribute, 3, Gdx.gl.FLOAT, false, 0, 0); 
	         Gdx.gl.enableVertexAttribArray (shader.normalAttribute);
		}
		if (shader.texCoord0Attribute != -1)
		{
	       Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex0Buffer);
   	         Gdx.gl.vertexAttribPointer(shader.texCoord0Attribute, 2, Gdx.gl.FLOAT, false, 0, 0);  
		     Gdx.gl.enableVertexAttribArray (shader.texCoord0Attribute);
		}
	     	
		if (shader.texCoord1Attribute != -1)
	 	{
	             Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, tex1Buffer);
   	             Gdx.gl.vertexAttribPointer(shader.texCoord1Attribute, 2, Gdx.gl.FLOAT, false, 0, 0); 
		         Gdx.gl.enableVertexAttribArray (shader.texCoord1Attribute);
		}
	
				
	   if (shader.colorAttribute != -1)
			{
	         Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, colBuffer);
   	         Gdx.gl.vertexAttribPointer(shader.colorAttribute, 4, Gdx.gl.FLOAT, false, 0, 0);  
	         Gdx.gl.enableVertexAttribArray (shader.colorAttribute);
			}

		
		if (useBones)
		{
		
			if (shader.bonesAttribute >=0)
			{
		     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, bonesBuffer);
   	         Gdx.gl.vertexAttribPointer(shader.bonesAttribute, 4, Gdx.gl.FLOAT, false, 0, 0);  
		     Gdx.gl.enableVertexAttribArray (shader.bonesAttribute);
			}
			if ( shader.wighsAttribute>=0)
			{
		    
		     Gdx.gl.bindBuffer(Gdx.gl.ARRAY_BUFFER, wighsBuffer);
   	         Gdx.gl.vertexAttribPointer(shader.wighsAttribute, 4, Gdx.gl.FLOAT, false, 0, 0);  
		     Gdx.gl.enableVertexAttribArray (shader.wighsAttribute);
			}
			
	    } 

		
		
		Gdx.gl.bindBuffer(Gdx.gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
        Gdx.gl.drawElements(primitiveType, Num_Triangles, Gdx.gl.UNSIGNED_SHORT, 0);
		
		
		
		   
			

	   	Gdx.gl.disableVertexAttribArray (shader.vertexAttribute);
		
	
			if (shader.normalAttribute != -1)
			{
		        Gdx.gl.disableVertexAttribArray (shader.normalAttribute);
			}
	
		
		
		
			if (shader.texCoord0Attribute != -1)
			{
	           Gdx.gl.disableVertexAttribArray (shader.texCoord0Attribute);
			}
	    	if (shader.texCoord1Attribute != -1)
			{
	              Gdx.gl.disableVertexAttribArray (shader.texCoord1Attribute);
			
			}
	
		 if (shader.colorAttribute != -1)
			{
	          Gdx.gl.disableVertexAttribArray (shader.colorAttribute);
			}

		if (useBones)
		{
		
			if (shader.bonesAttribute >=0)
			{
		     Gdx.gl.disableVertexAttribArray (shader.bonesAttribute);
			}
			if ( shader.wighsAttribute>=0)
			{
		     Gdx.gl.disableVertexAttribArray (shader.wighsAttribute);
			}
		
		}
	}
	override public function dispose()
	{
		super.dispose();
		Gdx.gl.deleteBuffer(coordBuffer);
		Gdx.gl.deleteBuffer(indexBuffer );
		
		
		if (useNormals)
		{
		Gdx.gl.deleteBuffer(normBuffer );
	    }
		if (useTexture)
		{
		Gdx.gl.deleteBuffer(tex0Buffer);
		}
	   if (useDetail)
		{
		Gdx.gl.deleteBuffer(tex1Buffer);
		}
		if (useBones)
		{
		Gdx.gl.deleteBuffer(bonesBuffer);
		Gdx.gl.deleteBuffer(wighsBuffer);
		
	    }
		
		if (useColors)
		{
		Gdx.gl.deleteBuffer(colBuffer);
		}
		
		
	}
}