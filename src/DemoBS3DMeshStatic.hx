package ;

import com.gdx.Gdx;
import com.gdx.gl.shaders.ShaderLight;
import com.gdx.input.Keys;
import com.gdx.math.*;
import com.gdx.scene2d.ui.ImageFont;
import com.gdx.scene3d.cameras.TargetCamera;
import com.gdx.scene3d.Mesh;
import com.gdx.scene3d.MeshCreator;
import com.gdx.scene3d.SceneManager;
import com.gdx.scene3d.SceneNode;
import com.gdx.Screen;








/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class DemoBS3DMeshStatic extends Screen
{

	
	
		var font:ImageFont;

	var camera:TargetCamera;
	
	var scene:SceneManager;

	
	var mouseDow:Bool = false;
	var MouseSpeed:Vector2=Vector2.Zero();
	var previousMouse:Vector2= Vector2.Zero();
	

	var levelMesh:Mesh;
	var levelNode:SceneNode;
	
	var light:SceneNode;
	
	var currFrame:Int = 0;
	var nextFrame:Int = 0;

	var lightPosition:Vector3 = Vector3.Zero();
	var angle:Float = 0;


	override public function show():Void 
	{
		Gdx.Instance().clearColor(0, 0, 0.4);
		
			scene = new SceneManager(4000);
		
		camera = scene.addTargetCamera(0, 20, -90, 0, 0, 100);
	
		font =	scene.addImageFont("data/arial.png", Gdx.Instance().status , 50, Gdx.Instance().height - 100);

Gdx.Instance().setFogMode(2, 20.0, 60.0, 0.004);


light = scene.addSceneNode(MeshCreator.createSphere());
light.setLocalPosition(lightPosition);
light.setShader(Gdx.SHADERCOLOR);


//var mesh = MeshCreator.loadStaticB3DMesh("data/models/castel.b3d", "data/models/textures/");
levelMesh = MeshCreator.loadMs3dStatic("data/models/normals.ms3d", "data/models/textures/");
levelMesh.UpdateNormals();
levelMesh.setShader(Gdx.SHADERLIGHT);
//var mesh = MeshCreator.loadStaticH3DMesh("data/models/castel.h3d", "data/models/textures/");
//var mesh = MeshCreator.loadStaticB3DMesh("data/models/soldier.b3d", "data/models/textures/");
//var mesh = MeshCreator.loadStaticB3DMesh("data/models/ninja.b3d", "data/models/");

//mesh.Scale(0.1, 0.1, 0.1);
//mesh.CleanMesh();
//var opetMesh:Mesh = new Mesh();
//mesh.CopyMeshTo(opetMesh);
//opetMesh.AddMesh(mesh);

levelNode = scene.addSceneNode(levelMesh);
//node.setTexture(getTexture("data/models/textures/nskinwh.jpg",false,false,true));



	}
	override public function resize(width:Int, height:Int):Void 
	{			
	Gdx.Instance().setViewPort(0, 0, width, height);
	}
	
	override public function update(delta:Float):Void 
	{
	
		 var dt:Float =  Gdx.Instance().deltaTime *3 ;
		 var speed:Float= 80;
		 
		 
		  angle+= 0.5 *dt;
		lightPosition = new Vector3( 100.0 * Math.cos(angle), 60 * -Math.sin(angle), 100.0 * Math.sin(angle));// , 5.0 * sine);
		
		
		 var shader:ShaderLight = cast(levelMesh.pipline, ShaderLight);
	//	 shader.direction.copyFrom(lightPosition);
		shader.camarePosition.copyFrom(camera.local_pos);
 		light.setLocalPosition(lightPosition);
		 	 
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
		
		 scene.update();
	}
	
	
	override public function render():Void 
	{
		
		
//	 showNormals(levelNode.world_tform, levelMesh, 10);
	 
	 
	 scene.render();
	
	 
	 
	 scene.renderUI();
		 
	
	 

	 
	}
	
	public function showNormals(m:Matrix,mesh:Mesh,length:Float)
	{
		
		for (i in 0... mesh.numMeshBuffer())
		{
		var surf = mesh.getMeshBuffer(i);
			
		for (i in 0... surf.no_verts)
		{
			var v:Vector3 = surf.getVertex(i);
			var n:Vector3 = Vector3.Mult( surf.getNormal(i), length);
			
			v = m.transformVector(v);
			n = m.transformVector(n);
			
			
			SceneManager.lines.line3D(
			v.x, v.y, v.z, 
			v.x + n.x, v.y + n.y, v.z + n.z,
			1, 0, 0);
			
		}

		}

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
