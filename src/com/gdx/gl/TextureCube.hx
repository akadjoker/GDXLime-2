package com.gdx.gl ;




import lime.utils.Assets;
import lime.graphics.Image;




/**
 * ...
 * @author djoker
 */
class TextureCube extends Texture
{

	
	
	
	override public function Bind(i:Int=0)
	{
  	Gdx.gl.bindTexture(Gdx.gl.TEXTURE_CUBE_MAP, data);
	}

	

     public function new(rootUrl:String)
     {
		super();
		
     		
			var extensions:Array<String> = new Array<String>();
			extensions= ["_px.jpg", "_py.jpg", "_pz.jpg", "_nx.jpg", "_ny.jpg", "_nz.jpg"];
		
			
			data=Gdx.gl.createTexture(); 
            Gdx.gl.bindTexture (Gdx.gl.TEXTURE_CUBE_MAP, data);

		
	
        
		var faces = [
                Gdx.gl.TEXTURE_CUBE_MAP_POSITIVE_X, Gdx.gl.TEXTURE_CUBE_MAP_POSITIVE_Y, Gdx.gl.TEXTURE_CUBE_MAP_POSITIVE_Z,
                Gdx.gl.TEXTURE_CUBE_MAP_NEGATIVE_X, Gdx.gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, Gdx.gl.TEXTURE_CUBE_MAP_NEGATIVE_Z
            ];
		
		function _setTex(imagePath:String, index:Int) 
		{
		var bitmapData:Image= Assets.getImage(imagePath);	
			
		this.width =bitmapData.width;
		this.height = bitmapData.height;
		this.texWidth =  roundUpToPow2(width);
		this.texHeight = roundUpToPow2(height);
		
		
		  if (isTextureOk(bitmapData))
		{
		
		         
					Gdx.gl.texImage2D (faces[index], 0, Gdx.gl.RGBA, bitmapData.buffer.width, bitmapData.buffer.height, 0, Gdx.gl.RGBA, Gdx.gl.UNSIGNED_BYTE, bitmapData.data);
				
		
				
		
		 		
	
		} else
		{
			#if debug
			trace("INFO : resize image : width:"+width+" to "+texWidth +", height: "+height+" to "+texHeight);
			#end
		
			bitmapData.resize(texWidth, texHeight);
			
			 
					Gdx.gl.texImage2D (faces[index], 0, Gdx.gl.RGBA, bitmapData.buffer.width, bitmapData.buffer.height, 0, Gdx.gl.RGBA, Gdx.gl.UNSIGNED_BYTE, bitmapData.data);
					
		
				
		}
		
			
		}
		
		Gdx.gl.bindTexture(Gdx.gl.TEXTURE_CUBE_MAP, data);	
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_CUBE_MAP, Gdx.gl.TEXTURE_WRAP_S, Gdx.gl.CLAMP_TO_EDGE);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_CUBE_MAP, Gdx.gl.TEXTURE_WRAP_T, Gdx.gl.CLAMP_TO_EDGE);
		
		
		for (i in 0...extensions.length) {
			if (Assets.exists(rootUrl + extensions[i])) 
			{	
				_setTex(rootUrl + extensions[i], i);
				#if debug trace("Load :" + rootUrl + extensions[i]);#end
			} else {
				trace("Image '" + rootUrl + extensions[i] + "' doesn't exist !");
			}
		}		

		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_CUBE_MAP, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.LINEAR);
		Gdx.gl.texParameteri(Gdx.gl.TEXTURE_CUBE_MAP, Gdx.gl.TEXTURE_MIN_FILTER, Gdx.gl.LINEAR_MIPMAP_LINEAR);
		Gdx.gl.generateMipmap(Gdx.gl.TEXTURE_CUBE_MAP);


		
	}  
	
	
	
}