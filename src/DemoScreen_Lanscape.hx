package ;

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
import com.gdx.scene3d.SceneNode;
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
class DemoScreen_Lanscape extends Screen
{

	var font:ImageFont;


	var camera:TargetCamera;


	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2 = Vector2.Zero();
	var lines:Imidiatemode;
	var canvas:BatchPrimitives;
	
var land:MeshLandScape;

var lensflare:LensFlareSystem;

var scene:SceneManager;

	override public function show():Void 
	{
		
		scene = new SceneManager(4000);
		
		camera = scene.addTargetCamera(0, 20, -400, 0, 0, 100);
		
	font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);

	
	
	
	scene.addSkyBox(500,"data/skybox01");
	
		
	land = new MeshLandScape("data/island-height.jpg", 20, 40,0,0,0,0,1,1);
	land.getMeshBuffer(0).scaleTexCoords(20, 20, 1);
	
	var l = scene.addSceneNode(land);
	l.setTexture( Gdx.Instance().getTexture("data/island.jpg",true,true, true));
	l.setDetail( Gdx.Instance().getTexture("data/Sand.jpg", true,true,true));
	
	
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
		scene.update();
	
	}
	
	
	override public function render():Void 
	{
		
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
			 camera.Advance( speed*dt);
		 } else
		 if (keyPress(Keys.S))
		 {
			 camera.Advance( -speed*dt);
		 }
		 
		 
		 font.caption = Gdx.Instance().status ;
		 
		 
		 scene.render();
		 scene.renderUI();
		 
	
	 
	}

	override public function TouchMove(mx:Float, my:Float, num:Int):Void 
	{
		if (mouseDow)
		{
			 MouseSpeed.x = mx - previousMouse.x ;
		 MouseSpeed.y = my - previousMouse.y  ;
		 MouseSpeed.normalize();
		 camera.MouseLook(MouseSpeed.x, MouseSpeed.y, 8, 10, 8.0 * Gdx.Instance().deltaTime );
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

	
}
