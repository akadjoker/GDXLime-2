package com.gdx.scene3d;

import com.gdx.gl.Imidiatemode;
import com.gdx.gl.material.Material;
import com.gdx.gl.MeshBuffer;
import com.gdx.gl.ScreenQuad;
import com.gdx.gl.shaders.Shader;
import com.gdx.gl.shaders.ShaderCast;
import com.gdx.gl.ShadowBuffer;
import com.gdx.gl.Texture;
import com.gdx.math.BoundingBox;
import com.gdx.math.Matrix;
import com.gdx.math.Ray;
import com.gdx.math.Vector3;
import com.gdx.scene3d.cameras.Camera;

import lime.math.Matrix4;

import lime.graphics.opengl.GLFramebuffer;
import lime.graphics.opengl.GLRenderbuffer;
import lime.graphics.opengl.GLTexture;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Shadow
{
	private var shadow:ShaderCast;

	private var shadow_nodes:Array<SceneNode>;
	private var blocks:Array<SceneNode>;
	public var lightPosition:Vector3;
	public var lightMatrix:Matrix;
	private var viewMatrix:Matrix;
	var fbo:GLFramebuffer;
	var fboTexture:GLTexture;
	var rbo:GLRenderbuffer;
	var quad:ScreenQuad;
	private var width:Int;
	private var height:Int;
	var minBound:Vector3;
	var maxBound:Vector3;
	public var shadowOrthoScale:Float;
	private var bound:BoundingBox;
	
	  private  var orthoLeft:Float = Math.POSITIVE_INFINITY;
	  private var orthoRight:Float = Math.NEGATIVE_INFINITY;
	  private var orthoTop:Float = Math.NEGATIVE_INFINITY;
	  private	var orthoBottom:Float = Math.POSITIVE_INFINITY;
	 
		
	public function new(light:Vector3) 
    {
		
	    shadowOrthoScale = 0.5;
		width = 1024;
		height = 1024;
            		 fbo = Gdx.gl.createFramebuffer();
					fboTexture = Gdx.gl.createTexture();
					rbo = Gdx.gl.createRenderbuffer();
		
		shadow = new ShaderCast();

		shadow_nodes = [];
		lightPosition = light;
		quad = new ScreenQuad();
		minBound = new Vector3(99999, 99999, 99999);
		maxBound = new Vector3(-99999, -99999, -99999);
		lightMatrix = Matrix.Zero();
		viewMatrix = Matrix.LookAtLH(lightPosition, new Vector3(0,1,0), Vector3.Up());
		bound = new BoundingBox(minBound, maxBound);
		
		blocks = [];
	}
		public function addNode(node:SceneNode):Void
	{
		shadow_nodes.push(node);
     }
	
	
	public function addBound(m:SceneNode):Void
	{
		 var tempVector3 = Vector3.Zero();
		 
		if (m.mesh != null)
		{
		blocks.push(m);
		for (i in 0...m.mesh.numMeshBuffer())
		{
			
			var boundingBox = m.mesh.getMeshBuffer(i).Bounding.boundingBox;
		    bound.addInternalBox(boundingBox);
		
		for (index in 0...boundingBox.vectorsWorld.length)
		{
				Vector3.TransformCoordinatesToRef(boundingBox.vectorsWorld[index], viewMatrix, tempVector3);
				
				if (tempVector3.x < orthoLeft) {
					orthoLeft = tempVector3.x;
				}
				if (tempVector3.y < orthoBottom) {
					orthoBottom = tempVector3.y;
				}
				
				if (tempVector3.x > orthoRight) {
					orthoRight = tempVector3.x;
				}
				if (tempVector3.y > orthoTop) {
					orthoTop = tempVector3.y;
				}
			}	   
		   
		}
		
		bound.calculate();
		bound.update(viewMatrix);
		/*
	
		orthoLeft = bound.minimum.x;
		orthoBottom = bound.minimum.y;
			
		orthoRight = bound.maximum.x;
		orthoTop = bound.maximum.y;
		*/
		}
				
	}
	private function createFBO(cam:Camera,width:Int, height:Int)
			{
				
				

		
				
				
				//create frambuffer object
				Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, fbo);

				//create the texture				
				Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, fboTexture);
		      	Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_S, Gdx.gl.CLAMP_TO_EDGE);
				Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_WRAP_T, Gdx.gl.CLAMP_TO_EDGE);
				Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MAG_FILTER, Gdx.gl.LINEAR);
				Gdx.gl.texParameteri(Gdx.gl.TEXTURE_2D, Gdx.gl.TEXTURE_MIN_FILTER, Gdx.gl.NEAREST);

				Gdx.gl.texImage2D(Gdx.gl.TEXTURE_2D, 0, Gdx.gl.RGBA, width, height, 0,      				Gdx.gl.RGBA, Gdx.gl.UNSIGNED_BYTE, null);
				
				//setup the renderbuffer object
				Gdx.gl.bindRenderbuffer(Gdx.gl.RENDERBUFFER, rbo);
				Gdx.gl.renderbufferStorage(Gdx.gl.RENDERBUFFER, Gdx.gl.DEPTH_COMPONENT16, width, height);
				            
				//setup attachments
			 	 Gdx.gl.framebufferTexture2D(Gdx.gl.FRAMEBUFFER, Gdx.gl.COLOR_ATTACHMENT0,  Gdx.gl.TEXTURE_2D, fboTexture, 0);
				 Gdx.gl.framebufferRenderbuffer(Gdx.gl.FRAMEBUFFER, Gdx.gl.DEPTH_ATTACHMENT, Gdx.gl.RENDERBUFFER, rbo);

			}
	
     public function draw(cam:Camera):Void
	{
	         
				
		
	   
	 
	 
	    viewMatrix.setLookAtLH(lightPosition, new Vector3(0,1,0), Vector3.Up());
	
	
	

		var xOffset = orthoRight - orthoLeft;
		var yOffset = orthoTop - orthoBottom;
		var maxZ:Float = 10000.0;
		
		var projectionMatrix:Matrix =  Matrix.Zero();
		Matrix.OrthoOffCenterLHToRef(orthoLeft   - xOffset * shadowOrthoScale, orthoRight + xOffset * shadowOrthoScale,
                                     orthoBottom - yOffset * shadowOrthoScale, orthoTop   + yOffset * shadowOrthoScale,
                                     -maxZ, maxZ, projectionMatrix);

		
		viewMatrix.multiplyToRef(projectionMatrix, lightMatrix);							  
	 
		
	
				
	   createFBO(cam, width, height);
	   
  		Gdx.gl.clearColor(0.1, 0.1, 0.1, 1.0); 	
		Gdx.gl.clear( Gdx.gl.COLOR_BUFFER_BIT | Gdx.gl.DEPTH_BUFFER_BIT); 	
				
				 Gdx.gl.enable(Gdx.gl.DEPTH_TEST);
				Gdx.gl.clearDepth(1.0);
				//Gdx.gl.disable(Gdx.gl.CULL_FACE);
				Gdx.gl.enable(Gdx.gl.CULL_FACE);
				Gdx.gl.cullFace(Gdx.gl.FRONT);
			//	Gdx.gl.depthMask(false);
				Gdx.gl.viewport(0, 0, width, height);   
	   	      
         	    
			
	  
  

	  shadow.Begin();	
	  
	  for (i in 0...shadow_nodes.length)
	  {
		  var node:SceneNode = shadow_nodes[i];
		  if (node != null)
		  {
		    shadow.setMatrix(lightMatrix,node.world_tform);
		    node.renderTo(shadow, cam, false);
		  }
		  
	  }

	  shadow.End();   
	  
	  
	         //   Gdx.gl.enable(Gdx.gl.CULL_FACE);
	         //   Gdx.gl.depthMask(true);
	            Gdx.gl.cullFace(Gdx.gl.BACK);
	            Gdx.gl.activeTexture(Gdx.gl.TEXTURE0);
			    Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, null);
				Gdx.gl.bindFramebuffer(Gdx.gl.FRAMEBUFFER, null);
				Gdx.gl.viewport(0, 0, Gdx.Instance().width,Gdx.Instance().height);
				
				
	}
	
	private function rayClear(ray:Ray):Bool
	{
		for ( i in 0...this.blocks.length)
		{
			for ( m in 0...this.blocks[i].mesh.numMeshBuffer())
			{
				var buffer:MeshBuffer = this.blocks[i].mesh.getMeshBuffer(m);
				if (buffer.rayBoundHit(ray)) return false;
			}
		}
		return true;
	}
	
	public function bindBuffer(layer:Int):Void
	{
      Gdx.gl.activeTexture(Gdx.gl.TEXTURE0+layer);
      Gdx.gl.bindTexture(Gdx.gl.TEXTURE_2D, fboTexture);
	}
	
	public function drawQuad():Void
	{
		        Gdx.gl.viewport(0, Gdx.Instance().height-256, 256,256);
				quad.render(fboTexture, 256, 256);
			
			   
				  
	}
	
}