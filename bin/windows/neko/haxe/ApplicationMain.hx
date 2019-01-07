import Main;
import lime.utils.Assets;


@:access(lime.app.Application)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:lime.app.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		preloader = new lime.app.Preloader ();
		
		#if !munit
		app = new Main ();
		app.setPreloader (preloader);
		app.create (config);
		#end
		
		preloader.onComplete.add (start);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "23",
			company: "Luis Santos AKA DJOKER",
			file: "opn3d",
			fps: 1000,
			name: "Keys n/m to change demos. ",
			orientation: "",
			packageName: "com.djokersoft.landscape",
			version: "1.0.0",
			windows: [
				
				{
					antialiasing: 4,
					background: 0,
					borderless: false,
					depthBuffer: true,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 600,
					parameters: "{}",
					resizable: true,
					stencilBuffer: false,
					title: "Keys n/m to change demos. ",
					vsync: false,
					width: 800,
					x: null,
					y: null
				},
			]
			
		};
		
		#if (!html5 || munit)
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		#if !munit
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
		#else
		
		new Main ();
		
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}
