package ;

import com.gdx.collision.Collider;
import com.gdx.collision.Octree;
import com.gdx.collision.OctSelector;
import com.gdx.color.Color3;
import com.gdx.Gdx;
import com.gdx.gl.Imidiatemode;
import com.gdx.input.Keys;
import com.gdx.scene2d.ui.ImageFont;
import com.gdx.scene3d.cameras.FreeCamera;
import com.gdx.scene3d.cameras.TargetCamera;
import com.gdx.scene3d.lensflare.LensFlareSystem;



import com.gdx.scene3d.MeshSkyBox;


import com.gdx.scene3d.SceneManager;
import com.gdx.Screen;
import com.gdx.math.*;
import com.gdx.scene3d.cameras.Camera;
import com.gdx.scene3d.Node;
import com.gdx.gl.MeshBuffer;

import com.gdx.util.SpriteSheet;

import com.gdx.scene2d.render.BatchPrimitives;
import com.gdx.scene2d.render.SpriteAtlas;
import com.gdx.scene2d.render.SpriteBatch;
import com.gdx.scene2d.render.SpriteCloud;

import com.gdx.scene2d.ui.BitmapFont;
import com.gdx.scene2d.ui.Font;


/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class DemoScreen_TerrainColide extends Screen
{
	var octree:OctSelector;
	  
   public var _finalPosition:Vector3=Vector3.Zero();
	private var _scaledPosition:Vector3 = Vector3.Zero();
	private var _scaledVelocity:Vector3 = Vector3.Zero();
      public  var ellipsoid:Vector3 = new Vector3(4, 10, 4);
          public  var ellipsoidOffset:Vector3 = new Vector3(0, 0, 0);
          private  var _oldPositionForCollisions:Vector3 = new Vector3(0, 0, 0);
          private  var _diffPositionForCollisions:Vector3 = new Vector3(0, 0, 0);
          private  var _newPositionForCollisions:Vector3 = new Vector3(0, 0, 0);
		  private  var collisionsEpsilon:Float = 0.05;//0.001;
		   private var _previousPosition:Vector3 = Vector3.Zero();
         private  var _collisionVelocity:Vector3 = Vector3.Zero();
         private  var _newPosition:Vector3 = Vector3.Zero();
		  

	var font:ImageFont;

	var velocity:Vector3 = Vector3.zero;
	var LastPosition:Vector3 = Vector3.zero;

	var camera:TargetCamera;

	var mousex:Float = 0;
	var mousey:Float = 0;
	
	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2 = Vector2.Zero();
	var lines:Imidiatemode;
	var canvas:BatchPrimitives;


var lensflare:LensFlareSystem;

var scene:SceneManager;

var triangles:Array<Triangle>;


var collider:Collider;



	override public function show():Void 
	{
		
		scene = new SceneManager( 500);
		
		camera = scene.addTargetCamera(10, 200, -200,0,0,100);
		
	font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);

	collider = new Collider();
	
	
	scene.addSkyBox(500,"data/skybox01");
	
		
	var land = scene.addGroundHeighMapMesh("data/island-height.jpg", 1000, 1000,20,0,140);
	land.setTexture( Gdx.Instance().getTexture("data/island.jpg",true,true, true));
	land.setDetail( Gdx.Instance().getTexture("data/Sand.jpg", true,true,true));
	land.getMeshBuffer(0).scaleTexCoords(20, 20, 1);
	triangles=land.getMeshBuffer(0).getTriangles();

	octree = new OctSelector(150, 3);
	octree.addMeshBuffer(land.getMeshBuffer(0));
	octree.build();
	
	
var spr:SpriteSheet = new SpriteSheet();
spr.loadSparrow("flares.xml", "data/");
		

lensflare =scene.addLensFlare( spr,20,450,450);
         lensflare.addFlare(5, 0.9, 0 ,Color3.YELLOW);
		 lensflare.addFlare(3, 0.5, 0.2);
		 lensflare.addFlare(1, 0.6, 0.4);
		 lensflare.addFlare(4, 0.7, 0.6);
		 lensflare.addFlare(0, 0.5, 0.7);
		 lensflare.addFlare(3, 0.8, 0.8);
		 lensflare.addFlare(2, 0.5, 0.9);
		 lensflare.addFlare(1, 0.4, 1.0);
		 
		
	
	}
	override public function resize(width:Int, height:Int):Void 
	{			
	Gdx.Instance().setViewPort(0, 0, width, height);
	}
	
	override public function update(delta:Float):Void 
	{
	
	}
	
	
	override public function render():Void 
	{
		SceneManager.lines.reset();
	
	
		
		 var dt:Float =  Gdx.Instance().deltaTime *3 ;
		 var speed:Float= 80;
		 
		     if (keyPress(Keys.D))
		 {
			camera.Strafe( speed*dt);
		 } else
		 if (keyPress(Keys.A))
		 {
			 camera.Strafe( -speed*dt);
		 } 
		 
		 if (keyPress(Keys.W))
		 {
			 camera.Move( speed*dt);
		 } else
		 if (keyPress(Keys.S))
		 {
			 camera.Move( -speed*dt);
		 }
		 
		

		

		 
		velocity.x = camera.position.x - LastPosition.x;
		velocity.y = camera.position.y - LastPosition.y;
		velocity.z = camera.position.z - LastPosition.z;
	
		 moveCameraAndSlide(camera.position,velocity,camera.LookAt);
		 
		 font.caption = Gdx.Instance().status + camera.position +","+velocity;
		 
		 
		 scene.update();
		 scene.renderUI();
		 
		 LastPosition.copyFrom(camera.position);
		 
		 
		 var ray:Ray=camera.getPointRay(mousex, mousey);
		 
		 octree.RayTrace(ray);
		 
		 octree.debug();
		 
	
		 SceneManager.lines.render(camera, SceneManager.matIden);
		
	 
	}

	override public function TouchMove(mx:Float, my:Float, num:Int):Void 
	{
		mousex = mx;
		mousey = my;
		
		if (mouseDow)
		{
		 MouseSpeed.x = mx - previousMouse.x ;
		 MouseSpeed.y = my - previousMouse.y  ;
		 MouseSpeed.normalize();
				 camera.MouseLook(MouseSpeed.x, MouseSpeed.y, 8, 10, 8.0 * Gdx.Instance().deltaTime );
		 
		 
		// camera.MouseLook(MouseSpeed.x, MouseSpeed.y, 8, 10, 8.0 * Gdx.Instance().deltaTime );
		 previousMouse.set( mx,my);
		}
	}
	override public function TouchUp(x:Float, y:Float, num:Int):Void 
	{
		mouseDow = false; 
	}
	override public function TouchDown(mx:Float, my:Float, num:Int):Void 
	{
		mouseDow = true;
		
		
	}
	
	
	
	inline public function moveAndStop(position:Vector3) 
	{
	           collider.radius = ellipsoid;
               position.subtractToRef(this._previousPosition, this._collisionVelocity);
               traceBoxNewPosition(this._previousPosition, this._collisionVelocity,  3, this._newPosition);
                if (!this._newPosition.equalsWithEpsilon( position))
				{
                     position.copyFrom(this._previousPosition);
				}
		
    }
	inline public function moveAndSlide(position:Vector3,velocity:Vector3) 
	{
			var collisionsEpsilon:Float = 0.001;
	        var globalPosition:Vector3 = position;
            globalPosition.subtractFromFloatsToRef(0, 0, 0, this._oldPositionForCollisions);
            this._oldPositionForCollisions.addInPlace(this.ellipsoidOffset);
            collider.radius = this.ellipsoid;
            traceBoxNewPosition(this._oldPositionForCollisions, velocity,  3, this._newPositionForCollisions);
            this._newPositionForCollisions.subtractToRef(this._oldPositionForCollisions, this._diffPositionForCollisions);

            if (this._diffPositionForCollisions.length() > collisionsEpsilon)
			{
                position.addInPlace(this._diffPositionForCollisions);
				
			}
    }
		inline public function moveCameraAndSlide(position:Vector3,velocity:Vector3,look:Vector3) 
	{
			var collisionsEpsilon:Float = 0.001;
	        var globalPosition:Vector3 = position;
            globalPosition.subtractFromFloatsToRef(0, 0, 0, this._oldPositionForCollisions);
            this._oldPositionForCollisions.addInPlace(this.ellipsoidOffset);
            collider.radius = this.ellipsoid;
            traceBoxNewPosition(this._oldPositionForCollisions, velocity,  3, this._newPositionForCollisions);
            this._newPositionForCollisions.subtractToRef(this._oldPositionForCollisions, this._diffPositionForCollisions);

            if (this._diffPositionForCollisions.length() > collisionsEpsilon)
			{
                position.addInPlace(this._diffPositionForCollisions);
				look.addInPlace(this._diffPositionForCollisions);
			}
    }
	private function traceBoxNewPosition( position:Vector3, velocity:Vector3,  maximumRetry:Int, finalPosition:Vector3 )
	 {
		position.divideToRef(collider.radius, this._scaledPosition);
        velocity.divideToRef(collider.radius, this._scaledVelocity);
        collider.retry = 0;
    	collider.triangleHits = 0;
		collider.Falling = false;
        collideWithWorld(this._scaledPosition, this._scaledVelocity,collider,  maximumRetry, finalPosition);
	    finalPosition.multiplyInPlace(collider.radius);
	    collider.Falling = (collider.triangleHits == 0);
		
				
		
	}

	
	private function collideWithWorld(position:Vector3, velocity:Vector3, collider:Collider, maximumRetry:Int, finalPosition:Vector3)
	{
		var closeDistance = 0.000001;
		
		if (collider.retry >= maximumRetry) 
		{
			finalPosition.copyFrom(position);
			return;
		}
		
		collider.initialize(position, velocity, closeDistance);
		
		collider.collide(triangles);
		
		
		if (!collider.collisionFound) 
		{
			position.addToRef(velocity, finalPosition);
		
			return;
		}
		
		if (velocity.x != 0 || velocity.y != 0 || velocity.z != 0) {
			collider.getResponse(position, velocity);
		}
		
		if (velocity.length() <= closeDistance) {
			finalPosition.copyFrom(position);
			return;
		}
		
		collider.retry++;
		collideWithWorld(position, velocity, collider, maximumRetry, finalPosition);
	}

	
}
