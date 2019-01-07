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
class DemoH3DMesh extends Screen
{

	
	
		var font:ImageFont;

	var camera:TargetCamera;
	
	var scene:SceneManager;

	
	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2= Vector2.Zero();
	

	
	var currFrame:Int = 0;
	var nextFrame:Int = 0;



	override public function show():Void 
	{
		Gdx.Instance().clearColor(0, 0, 0.4);
		
			scene = new SceneManager(4000);
		
		camera = scene.addTargetCamera(20, 4, -30, 10, 0, 100);
	
		font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);




var ha3d = new MeshH3D();
ha3d.load("data/models/ninja.h3d", "data/models/");
for (x in 0...8)
{
	for (y in 0...8)
	{
var node = scene.addAnimatedSceneNode(ha3d);
node.setTexture(getTexture("data/models/nskinrd.jpg", false, false, true));
node.setPos(x*5, 0, y*5);
	}
}
/*
var ha3d = new MeshH3D();
ha3d.load("data/models/ninja.h3d", "data/models/");

var node = scene.addAnimatedSceneNode(ha3d);

*/


/*
var ha3d = new MeshH3D();
ha3d.load("data/models/bob.h3d", "data/models/");

var node = scene.addAnimatedSceneNode(ha3d);
var id:Int = 0;
for (b in ha3d.Joints)
{
	
	var debug:SceneNode = scene.addSceneNode( MeshCreator.createCube(), b,100,"debug"+id);
    debug.setShader(Gdx.SHADERCOLOR);
	id++;
//	debug.scale(0.2);

}

node.scale(0.2);
node.Translate(-4, 0, 0);
node.onUpdate = function()
{
	node.Turn(0, 1, 0);
}
//ha3d.setTexture(Gdx.Instance().getTexture("data/models/dwarf.jpg", true));


var l = scene.addSceneNode(MeshCreator.createCube(), ha3d.getJoint("lamp"),0,"lamp");
l.scale(2);
l.setShader(Gdx.SHADERCOLOR);
*/




	}
	override public function resize(width:Int, height:Int):Void 
	{			
	Gdx.Instance().setViewPort(0, 0, width, height);
	}
	
	override public function update(delta:Float):Void 
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
		 
			 scene.update();
		
	}
	
	
	override public function render():Void 
	{
		
	
		 
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
