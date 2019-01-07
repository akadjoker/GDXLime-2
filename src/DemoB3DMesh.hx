package ;

import com.gdx.Gdx;
import com.gdx.gl.shaders.ColorShader;
import com.gdx.scene2d.ui.ImageFont;
import com.gdx.scene3d.MeshCreator;
import com.gdx.scene3d.SceneManager;
import com.gdx.scene3d.SceneNode;


import com.gdx.input.Keys;

import com.gdx.scene3d.cameras.TargetCamera;

import com.gdx.scene3d.MeshH3D;
import com.gdx.scene3d.MeshB3D;


import com.gdx.Screen;
import com.gdx.math.*;
import com.gdx.scene3d.cameras.Camera;
import com.gdx.scene3d.Node;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class DemoB3DMesh extends Screen
{

	
	
		var font:ImageFont;

	var camera:TargetCamera;
	
	var scene:SceneManager;

	
	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2= Vector2.Zero();
	



	override public function show():Void 
	{
		Gdx.Instance().clearColor(0, 0, 0.4);
		
			scene = new SceneManager(4000);
		
		camera = scene.addTargetCamera(0, 4, -10, 0, 0, 100);
	
		font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);

		/*
blitz = new MeshB3D();
blitz.load("data/models/ninja.b3d", "data/models/");
var node = scene.addAnimatedSceneNode(blitz);
for (b in blitz.Bones)
{
	
	var debug:SceneNode = scene.addSceneNode( MeshCreator.createCube(), b,100,"debug");
    debug.setShader(Gdx.SHADERCOLOR);
	debug.scale(0.1);
	//b.addChild(debug);
//	scene.addNode(debug);

}		
//node.scale(0.2);
node.Translate(-4, 0, 0);
node.onUpdate = function()
{
	node.Turn(0, 1, 0);
}
*/

var mesh = new MeshB3D();mesh.load("data/models/sinbad.b3d", "data/models/textures/");

//var mesh = new MeshH3D();mesh.load("data/models/sinbad.h3d", "data/models/textures/");


//blitz.Optimize();
var node = scene.addAnimatedSceneNode(mesh);
node.Translate( -4, 0, 0);

node.addAnimation("run", 346, 366, 30);
node.addAnimation("hit1", 367, 383, 12);
node.addAnimation("hit2", 384, 398, 12);

node.setAnimationByName("run");

node.onUpdate = function()
{
	node.Turn(0, 1, 0);
}


//node.setTexture(getTexture("data/models/textures/nskinwh.jpg",false,false,true));

/*
for (x in 0 ... 4) 
{

for (y in 0 ... 4) 
{



var node = scene.addAnimatedSceneNode(blitz);
node.setPos(x * 4, 0, y * 4);
}
}

	}
	*/
	}
	
	override public function resize(width:Int, height:Int):Void 
	{			
	Gdx.Instance().setViewPort(0, 0, width, height);
	}
	
	override public function update(delta:Float):Void 
	{
	
		scene.update;
		
		
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
