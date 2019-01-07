package com.gdx.gl ;




import com.gdx.Buffer;
import lime.graphics.Image;
import lime.graphics.opengl.GL;
import lime.graphics.opengl.GLTexture;


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
class Texture extends Buffer
{

    public var data:GLTexture;
	public var width:Int;	
	public var height:Int;
	public var texHeight:Int;
	public var texWidth:Int;
	public var name:String;
	private var exists:Bool;
	public var invTexWidth:Float;
	public var invTexHeight:Float;

	
	public function Bind(unit:Int=0)
	{
		
 
	
  	Gdx.gl.activeTexture(Gdx.gl.TEXTURE0 + unit);
	Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, data);
	
    }

	public function roundUpToPow2( number:Int ):Int
	{
		number--;
		number |= number >> 1;
		number |= number >> 2;
		number |= number >> 4;
		number |= number >> 8;
		number |= number >> 16;
		number++;
		return number;
	}
	public  function isTextureOk( texture:Image):Bool
	{
		return ( roundUpToPow2( texture.width ) == texture.width ) && ( roundUpToPow2( texture.height ) == texture.height );
	}

     public function new()
     {
		super();
     }

	

	public function loadBitmap(bitmapData:Image, Linear:Bool = true, Repeat:Bool = true, mipmap:Bool = false ) 
	{

		if (bitmapData==null) return ;
		
		this.width =bitmapData.width;
		this.height = bitmapData.height;
		this.texWidth =  roundUpToPow2(width);
		this.texHeight = roundUpToPow2(height);
		
		
		
		exists = false;
         
		data=Gdx.gl.createTexture(); 
        Gdx.gl.bindTexture (Gdx.gl.TEXTURE_2D, data);
		
if(Repeat)
{
   	Gdx.gl.texParameteri (Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_S, Gdx.gl.REPEAT);
    Gdx.gl.texParameteri (Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_T, Gdx.gl.REPEAT);
} else
{
	Gdx.gl.texParameteri (Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_S, Gdx.gl.CLAMP_TO_EDGE);
    Gdx.gl.texParameteri (Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_T, Gdx.gl.CLAMP_TO_EDGE);
}


           if (!mipmap) 
	        {
				
					if (Linear)
 	               {
               	   Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.LINEAR);
	               } else
	               {
		            Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.NEAREST);
	                }

	
             
            } 
			
	

	
	

	   if (isTextureOk(bitmapData))
		{
		
	
		
					Gdx.gl.texImage2D (Gdx.gl.TEXTURE_2D, 0, Gdx.gl.RGBA, bitmapData.buffer.width, bitmapData.buffer.height, 0, Gdx.gl.RGBA, Gdx.gl.UNSIGNED_BYTE, bitmapData.data);
						
	
		} else
		{
			#if debug
			trace("INFO : resize image : width:"+width+" to "+texWidth +", height: "+height+" to "+texHeight);
			#end
		
	
			bitmapData.resize(texWidth, texHeight);
			
					Gdx.gl.texImage2D (Gdx.gl.TEXTURE_2D, 0, Gdx.gl.RGBA, bitmapData.buffer.width, bitmapData.buffer.height, 0, Gdx.gl.RGBA, Gdx.gl.UNSIGNED_BYTE, bitmapData.data);
				
		
				
		}
	
	
		
		
	       if (!mipmap) 
	        {
				if (Linear)
	            {
                Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER, Gdx.gl.LINEAR);
	            } else
				{
				Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER, Gdx.gl.NEAREST);
				}
	
            } else 
			{
				if (Linear)
				{
                  Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER, Gdx.gl.LINEAR_MIPMAP_LINEAR);
				} else
				{
                   Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER, Gdx.gl.NEAREST_MIPMAP_NEAREST);					
				}
                Gdx.gl.generateMipmap(Gdx.gl.TEXTURE_2D);
            }
	       
	
			
	
	}
	
	override public function dispose()
	{
		super.dispose();
		Gdx.gl.deleteTexture(data);	

	}
	
	
}