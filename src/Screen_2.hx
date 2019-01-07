package ;
import com.gdx.color.Color3;
import com.gdx.Gdx;
import com.gdx.gl.batch.SpriteBatch;
import com.gdx.input.Keys;
import com.gdx.math.Vector3;
import com.gdx.scene2d.CameraOrtho;
import com.gdx.scene2d.ImageFont;
import com.gdx.scene3d.FreeCamera;
import com.gdx.scene3d.H3DMesh;
import com.gdx.scene3d.land.LandScape;
import com.gdx.scene3d.lensflare.LensFlareSystem;
import com.gdx.scene3d.Mesh;
import com.gdx.scene3d.land.SplattingTerrain;
import com.gdx.scene3d.Scene;
import com.gdx.Screen;
import com.gdx.SpriteSheet;
import com.gdx.util.HeightMap;


/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Screen_2 extends DemoScreen
{
public var camera:FreeCamera;

public var mesh:H3DMesh;
	
	override public function Start():Void 
	{
		Gdx.Instance().clearColor(0, 0, 0.4);
		
		 camera = scene.addFreeCamera( new Vector3(0, 20, 100), new Vector3(0, 0, -1000));
	     camera.setPerspective(45, Gdx.Instance().width / Gdx.Instance().height, 0.1, 5000);
	
			
	scene.setAmbientColor(0.2, 0.2, 0.2);
scene.setLightPosition( 200, 130, -110);
	

	
mesh = new  H3DMesh(scene);
mesh.load("data/models/bob.h3d", "data/models/");

scene.addChild(mesh);

for (i in 0... mesh.CountSurfaces())
{
mesh.getBrush(i).DepthMask = false;
mesh.getBrush(i).DepthTest = false;
}


		
	}

	
	override public function Update(delta:Float):Void 
	{
	
		 var dt:Float =  Gdx.Instance().deltaTime *3 ;
		 var speed:Float= 80;
		 
	
		 	 
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
			 camera.Move( speed*dt);
		 } else
		 if (keyPress(Keys.S))
		 {
			 camera.Move( -speed*dt);
		 }
		 
			camera.MouseLook(8, 10, 5.5 * dt );
		
		//mesh.addYaw(0.01);
	
	}
	
		override	public function draw2d():Void
	{
		 font.print(batch, "farme:" + mesh.getFrameNr(), 10, 20, 0);
		
		
	}
	override public function Render():Void 
	{
	
	  
	 
	}

	
	
	override public function Close():Void 
	{
	}
	
	
}
