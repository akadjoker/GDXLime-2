package ;

import com.gdx.collision.Collider;
import com.gdx.collision.Octree;
import com.gdx.collision.OctSelector;
import com.gdx.color.Color3;
import com.gdx.Gdx;
import com.gdx.gl.Imidiatemode;
import com.gdx.input.Keys;
import com.gdx.scene2d.ui.ImageFont;
import com.gdx.scene3d.cameras.ArcBallCamera;
import com.gdx.scene3d.cameras.FreeCamera;
import com.gdx.scene3d.cameras.OrbitCamera;
import com.gdx.scene3d.cameras.TargetCamera;
import com.gdx.scene3d.lensflare.LensFlareSystem;
import com.gdx.scene3d.MeshCone;
import com.gdx.scene3d.MeshCylinder;
import com.gdx.scene3d.MeshCylinderEx;
import com.gdx.scene3d.MeshGrid;
import com.gdx.scene3d.MeshH3D;
import com.gdx.scene3d.MeshMD2;
import com.gdx.scene3d.MeshMD3;
import com.gdx.scene3d.MeshB3D;
import com.gdx.scene3d.MeshSkyBox;
import com.gdx.scene3d.MeshLandScape;
import com.gdx.scene3d.MeshTorus;
import com.gdx.scene3d.SceneManager;
import com.gdx.Screen;
import com.gdx.math.*;
import com.gdx.scene3d.cameras.Camera;
import com.gdx.scene3d.Node;
import com.gdx.gl.MeshBuffer;
import com.gdx.scene3d.MeshCube;
import com.gdx.scene3d.MeshSphere;
import com.gdx.util.Util;

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
class DemoScreen_MeshOctree extends Screen
{

	var octree:OctSelector;

		  

	var font:ImageFont;

	var velocity:Vector3 = Vector3.zero;
	var LastPosition:Vector3 = Vector3.zero;

	var camera:ArcBallCamera;

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
var camYaw:Float = 90;

var collider:Collider;

var player:MeshSphere;
var mesh:MeshH3D;

var yaw:Float=0;


	override public function show():Void 
	{
		
		scene = new SceneManager( 500);
		
		//camera = scene.addTargetCamera(100, 100, -20, 0, 0, 1000);
		camera = scene.addArcBallCamera( new Vector3(64, 16, 64),
		Util.ToRadians( -30), 0, 32, 192, 128);
		//(new Vector3(-50, 30, 0));
		
		player=scene.addSphereMesh(8);
	//player=scene.addCubeMesh();
		player.setTexture( Gdx.Instance().getTexture("data/marble.jpg"));
		
		player.setScale(3, 6, 3);
		player.setPos(100,150,100);

		
		
var cube=scene.addCubeMesh(player);
		cube.setTexture( Gdx.Instance().getTexture("data/marble.jpg"));
		cube.setScale(1,0.5,0.5);
		cube.setPos(0.7,0.8,0);


mesh=scene.addH3DMesh("data/models/castel.h3d","data/models/textures/");
mesh.MeshScale(0.4,0.4,0.4);
mesh.MeshTranslate(-780,40,0);
mesh.MeshRotate(90,0,0);

		
	font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);

	collider = new Collider();
	
	
	scene.addSkyBox(500,"data/skybox01");
	
		
	var land = scene.addGroundHeighMapMesh("data/island-height.jpg", 1000, 1000,20,0,140);
	land.setTexture( Gdx.Instance().getTexture("data/island.jpg",true,true, true));
	land.setDetail( Gdx.Instance().getTexture("data/Sand.jpg", true,true,true));
	land.getMeshBuffer(0).scaleTexCoords(20, 20, 1);

	octree = new OctSelector(250, 4);
	octree.addMeshBuffer(land.getMeshBuffer(0));
	octree.addMesh(mesh);
	octree.build();
	
	
		 
		
	
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
			//camera.Strafe( -speed*dt);
		 } else
		 if (keyPress(Keys.A))
		 {
			// camera.Strafe( speed*dt);
		 } 
		 
		 if (keyPress(Keys.W))
		 {
		//	 camera.Move( speed*dt);
		 } else
		 if (keyPress(Keys.S))
		 {
			// camera.Move( -speed*dt);
		 }
		 


           var force:Float= 80;

		   var dx = Math.sin(-yaw) * force;
           var dz = Math.cos(-yaw) * force;
		   velocity.set(0, 0, 0);
	
		  
		 
		 	 
	   if (keyPress(Keys.UP))
		 {
			 velocity.x += dz*dt;
             velocity.z += dx*dt;	
			 
		 } else
		 if (keyPress(Keys.DOWN))
		 {
			 velocity.x -= dz*dt;
             velocity.z -= dx*dt;	
			 
		 } 
		 
		 if (keyPress(Keys.LEFT))
		 {
		 	yaw-=2*dt;
	
		 } else
		 if (keyPress(Keys.RIGHT))
		 {
		 	yaw+=2*dt;
			
		 }
		
		player.setRotate(yaw,0,0);


	camera.Target = player.position;
	
	camera.Rotation = Util.Lerp(camera.Rotation, yaw - Util.ToRadians(camYaw), 1.9*Gdx.Instance().deltaTime);
		 
		 //font.caption = Gdx.Instance().status + player.position +"("+camera+","+camera.pitch+")";
		 
		 
		 scene.update();
		 scene.renderUI();
		

		// octree.debug();

		octree.BoxTrace(player.Bounding,player.position,new Vector3(3,6,3),velocity,new Vector3(0,-9,0),0.002);
		 
		 //octree.RayTrace(ray);
		 
	 
		
		 
	 SceneManager.lines.drawOBox(player.Bounding);
	// SceneManager.lines.drawABox(player.Bounding);


		 SceneManager.lines.render(camera, SceneManager.matIden);
		
	 
	}

	override public function TouchMove(mx:Float, my:Float, num:Int):Void 
	{
		mousex = mx;
		mousey = my;
		
		 
		 
		 var yawSpeed:Float = 50;
		 var pitchSpeed:Float = 100;
	
		   
	//	if (mouseDow)
		{
		
		 MouseSpeed.x = mx - previousMouse.x ;
		 MouseSpeed.y = my - previousMouse.y  ;
		 MouseSpeed.normalize();
		
		 camera.Elevation += MouseSpeed.y * Gdx.Instance().deltaTime;
		 camYaw+= MouseSpeed.x * (5 * Gdx.Instance().deltaTime);
		   
		 //    camera.Rotation += Util.ToRadians( mx - (width/2) / 100 );
			 
		 	
  	  // camera.yaw    = Util.CurveValue(MouseSpeed.x  , camera.yaw  , 1 * Gdx.Instance().deltaTime) / yawSpeed;
      //  camera.pitch =  Util.CurveValue(my , camera.pitch , 1 * Gdx.Instance().deltaTime) / pitchSpeed;

	 //    camera.Rotation +=Util.deg2rad( MouseSpeed.x / 10 *  Gdx.Instance().deltaTime);
	//	 camera.Elevation +=Util.deg2rad( MouseSpeed.y  / 20* Gdx.Instance().deltaTime) ;
		 
	//	 trace(camera.pitch);
			//	 camera.MouseLook(MouseSpeed.x, MouseSpeed.y, 8, 10, 8.0 * Gdx.Instance().deltaTime );
		 
		 
		// camera.MouseLook(MouseSpeed.x, MouseSpeed.y, 8, 10, 8.0 * Gdx.Instance().deltaTime );
		 previousMouse.set( mx,my);
		}
	}
	override public function TouchUp(x:Float, y:Float, num:Int):Void 
	{
		//camera.yaw = 0;
		//camera.pitch = 0;
		mouseDow = false; 
	}
	override public function TouchDown(mx:Float, my:Float, num:Int):Void 
	{
		mouseDow = true;
		
		
	}
	
	
	
	
}
