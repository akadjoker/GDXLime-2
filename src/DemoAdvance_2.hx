package ;

import com.gdx.Gdx;
import com.gdx.gl.Imidiatemode;
import com.gdx.gl.PostProcess;
import com.gdx.input.Keys;
import com.gdx.scene2d.ui.ImageFont;
import com.gdx.scene3d.cameras.FreeCamera;
import com.gdx.scene3d.cameras.TargetCamera;
import com.gdx.scene3d.MeshCreator;
import com.gdx.scene3d.MeshH3D;
import lime.utils.Assets;

import com.gdx.scene3d.SceneManager;
import com.gdx.Screen;
import com.gdx.math.*;
import com.gdx.scene3d.cameras.Camera;
import com.gdx.scene3d.Node;
import com.gdx.scene3d.SceneNode;
import com.gdx.gl.MeshBuffer;


/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class DemoAdvance_2 extends Screen
{

	var font:ImageFont;
	var Cube:SceneNode;
	var light0:SceneNode;
	var light1:SceneNode;

	var camera:TargetCamera;


	var px:Float;
	var py:Float;
	

	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2= Vector2.Zero();
	
	var scene:SceneManager;
	
	var efect:PostProcess;
	
	 var blurH:PostProcess;
	 var blurV:PostProcess;

	override public function show():Void 
	{
		Gdx.Instance().clearColor(0, 0, 0.4);
		
		scene = new SceneManager( 500);
		camera = scene.addTargetCamera(0,2,-20,0,0,100);
	     font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);

		
	{
	 var m = MeshCreator.createGround(20, 20, 2);
   	m.ComputeTangents(); 
	m.Translate(0, 0,0);
	 m.setShader(Gdx.SHADERPARALLAXMAP);
	 m.scaleTexCoords(5, 5,0);
		var t =  scene.addSceneNode(m);
	    t.setTexture(Gdx.Instance().getTexture("data/rockwall.jpg", true));
		t.setTexture(Gdx.Instance().getTexture("data/rockwallNormal.png", true),1);

		
		}	 
	
		
		
{
var mesh = new MeshH3D();
mesh.load("data/models/ninja.h3d", "data/models/");

mesh.setShader(Gdx.SHADERSKINNORMALMAP);
mesh.ComputeTangents();


var node = scene.addAnimatedSceneNode(mesh);
node.setTexture(getTexture("data/models/nskinrd.jpg", false, false, true));
node.setTexture(getTexture("data/models/nskinn.png"), 1);
node.scale(0.5);

	}
		

		
		{
			var m = MeshCreator.createSphere();
			m.setColor(255, 255, 255);
			m.ScaleEx(0.2);
			m.UpdateNormals();
			m.setShader(Gdx.SHADERCOLOR);
		    light0 =  scene.addSceneNode(m);
			light0.setPos(8, 8, 0);
			
		}
		
		{
			var m = MeshCreator.createSphere();
			m.setColor(0, 255, 0);
			m.setShader(Gdx.SHADERCOLOR);
			m.UpdateNormals();
			m.ScaleEx(0.2);
		    light1 =  scene.addSceneNode(m);
			light1.setPos(-8, 8, 0);
			
		}
		
		
		px = 2;
		py = 2;
		
		Gdx.Instance().getLight(0).Radius = 5;
		Gdx.Instance().getLight(0).color.set(255, 255, 255);
		Gdx.Instance().getLight(1).color.set(0, 255, 0);

		
		//efect = new PostProcess(Assets.getText("data/shaders/color/protanopia.frag"));
		
		var radius = 1.2;

		blurH = new PostProcess("data/shaders/blur.frag");
		blurH.setUniform("radius", radius);
		blurH.setUniform("dirx", 1.0);
		blurH.setUniform("diry", 0.0);

		blurV = new PostProcess("data/shaders/blur.frag");
		blurV.setUniform("radius", radius);
		blurV.setUniform("dirx", 0.0);
		blurV.setUniform("diry", 10.0);

		blurH.enable(blurV);
		blurV.enable();
		
		
	}
	override public function resize(width:Int, height:Int):Void 
	{			
	Gdx.Instance().setViewPort(0, 0, width, height);
	
	if (blurH != null) blurH.rebuild();
		if (blurV != null) blurV.rebuild();
		
	}
	
	override public function update(delta:Float):Void 
	{
	
		
		
		 
		
		
	}
	
	
	override public function render():Void 
	{
		
		 var dt:Float =  Gdx.Instance().deltaTime *3 ;
		 var speed:Float= 20;
		 
	
		  if (keyPress(Keys.P))
		 {
		 px += 0.1;
		 } else
		 if (keyPress(Keys.O))
		 {
		 px -= 0.1;
		 }
		 
		 if (keyPress(Keys.L))
		 {
		 py -= 0.1;
		 } else
		 if (keyPress(Keys.I))
		 {
		 py += 0.1;
		 } 
		 
		 	 
	   if (keyPress(Keys.A))
		 {
			camera.Strafe( speed*dt);
		 } else
		 if (keyPress(Keys.D))
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
		 
		 
		 light0.setPos(px, py, -2);
	//	 light0.setPos(Math.sin(getTimer() / 1000) * 5, Math.cos(getTimer() / 1000) * 5, Math.cos(getTimer() / 1000) * 5);
	//	 light1.setPos(Math.cos(getTimer() / 1000) * 5, Math.sin(getTimer() / 1000) * 5, Math.sin(getTimer() / 1000) * 5);
		 
		 
	 
		 
		 Gdx.Instance().getLight(0).position.copyFrom(light0.local_pos);
		 Gdx.Instance().getLight(1).position.copyFrom(light1.local_pos);
		 
		 
		 
	
 font.caption = Gdx.Instance().status+Gdx.Instance().ParallaxMapScale ;
		
        blurV.capture();
		blurH.capture();
		
		
		 scene.update();
		 scene.renderUI();
		 
		 blurH.render();
		 blurV.render();
	 	 
		
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
