package ;

import com.gdx.Gdx;
import com.gdx.gl.Imidiatemode;
import com.gdx.input.Keys;
import com.gdx.scene2d.ui.ImageFont;
import com.gdx.scene3d.cameras.FreeCamera;
import com.gdx.scene3d.MeshCone;
import com.gdx.scene3d.MeshCylinder;
import com.gdx.scene3d.MeshCylinderEx;
import com.gdx.scene3d.MeshGrid;
import com.gdx.scene3d.MeshH3D;
import com.gdx.scene3d.MeshMD2;
import com.gdx.scene3d.MeshMD3;
import com.gdx.scene3d.MeshB3D;
import com.gdx.scene3d.MeshSkyBox;
import com.gdx.scene3d.MeshTorus;
import com.gdx.Screen;
import com.gdx.math.*;
import com.gdx.scene3d.cameras.Camera;
import com.gdx.scene3d.Node;
import com.gdx.gl.MeshBuffer;
import com.gdx.scene3d.MeshCube;
import com.gdx.scene3d.MeshSphere;

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
class DemoScreen_2d extends Screen
{

	var font:ImageFont;
	var batch:SpriteBatch;
	var camera2d:Camera;
	var camera:FreeCamera;
	

	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2 = Vector2.Zero();
	
	var canvas:BatchPrimitives;

	override public function show():Void 
	{
		Gdx.Instance().clearColor(0, 0, 0.4);
		
		camera = new FreeCamera(0, 0, -2, 0, 0, 100);
		
		camera2d = new Camera(45, -100, 100, true);
	
		
	

canvas = new BatchPrimitives(camera2d, 1000);
batch = new SpriteBatch(camera2d, 1000);

font = new ImageFont( Gdx.Instance().getTexture("data/arial.png", false, false, false));

	

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
		 
	  camera.update();
	 camera2d.update();
	

	
	 batch.Begin();
	 
	 font.print(batch, Gdx.Instance().status , 50, Gdx.Instance().height-100);
	 
	 batch.End();
	 
	 canvas.begin();
	 canvas.fillcircle(100, 100, 20, 22, 1, 1, 1);
	 canvas.rect(100, 100, 120, 120, 1, 1, 1);
	 canvas.end();
	
	 
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
