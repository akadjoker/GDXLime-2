package;

import com.gdx.input.Keys;
import lime.ui.KeyModifier;



import com.gdx.App;
import com.gdx.Screen;
import lime.ui.KeyCode;
import lime.ui.Window;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */

class Main extends App
{
	

	var demos:Array<Screen>;
	var demoIndex:Int;
	
	public function new () 
	{
		
		super ();
		
	}
	override function OnStart():Void 
	{
		
		
		demos = new Array<Screen>();
		
		
	demos.push(new Demo1());
	demos.push(new Demo2());
	demos.push(new Demo3());
	demos.push(new DemoBoxEmmiter());
	demos.push(new DemoGeoTerrain());
	demos.push(new DemoGrass());
	demos.push(new DemoParticles());
	demos.push(new DemoScreen_Decals());
	demos.push(new DemoScreen_Terrain());
	demos.push(new DemoScreen_TerrainGrass());
	demos.push(new DemoWaterFall());
	demos.push(new DemoBS3DMeshStatic4());
	demos.push(new DemoBS3DMeshStatic3());
	demos.push(new DemoH3DMesh());
	demos.push(new DemoH3DMeshStatic());
	demos.push(new DemoMD2Mesh());
	demos.push(new DemoScreen_LargeLanscape());	
	demos.push(new Screen_1());

	
	demoIndex = demos.length-1;
	//demoIndex = 10;
	
	
	gdx.setScreen(demos[demoIndex]);
	//gdx.setScreen(new DemoBoxEmmiter());
	//gdx.setScreen(new DemoGrass());
//gdx.setScreen(new Demo1());
//gdx.setScreen(new DemoGeoTerrain());
//gdx.setScreen(new DemoGeoTerrain());
	}
	
	override public function onKeyUp( keyCode:KeyCode, modifier:KeyModifier):Void 
	{
		
		//trace (keyCode);
		
		if (keyCode == 110)
		{
			demoIndex -= 1;
			if (demoIndex <= 0) demoIndex = 0;
			gdx.setScreen(demos[demoIndex]);
		} else
		if (keyCode == 109)
		{
			demoIndex += 1;
			if (demoIndex >= demos.length-1) demoIndex = demos.length-1;
			gdx.setScreen(demos[demoIndex]);
		}
		super.onKeyUp( keyCode, modifier);
	}
	
	
}
