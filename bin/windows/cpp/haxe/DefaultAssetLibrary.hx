package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		path.set ("data/align.jpg", "data/align.jpg");
		type.set ("data/align.jpg", AssetType.IMAGE);
		path.set ("data/arial.png", "data/arial.png");
		type.set ("data/arial.png", AssetType.IMAGE);
		path.set ("data/brick-diffuse.jpg", "data/brick-diffuse.jpg");
		type.set ("data/brick-diffuse.jpg", AssetType.IMAGE);
		path.set ("data/color_map.jpg", "data/color_map.jpg");
		type.set ("data/color_map.jpg", AssetType.IMAGE);
		path.set ("data/f.jpg", "data/f.jpg");
		type.set ("data/f.jpg", AssetType.IMAGE);
		path.set ("data/Fire.png", "data/Fire.png");
		type.set ("data/Fire.png", AssetType.IMAGE);
		path.set ("data/flares.png", "data/flares.png");
		type.set ("data/flares.png", AssetType.IMAGE);
		path.set ("data/flares.xml", "data/flares.xml");
		type.set ("data/flares.xml", AssetType.TEXT);
		path.set ("data/g.jpg", "data/g.jpg");
		type.set ("data/g.jpg", AssetType.IMAGE);
		path.set ("data/grass.dat", "data/grass.dat");
		type.set ("data/grass.dat", AssetType.BINARY);
		path.set ("data/grass1.png", "data/grass1.png");
		type.set ("data/grass1.png", AssetType.IMAGE);
		path.set ("data/grass2.png", "data/grass2.png");
		type.set ("data/grass2.png", AssetType.IMAGE);
		path.set ("data/hire.png", "data/hire.png");
		type.set ("data/hire.png", AssetType.IMAGE);
		path.set ("data/light.jpg", "data/light.jpg");
		type.set ("data/light.jpg", AssetType.IMAGE);
		path.set ("data/lime.svg", "data/lime.svg");
		type.set ("data/lime.svg", AssetType.TEXT);
		path.set ("data/marble.jpg", "data/marble.jpg");
		type.set ("data/marble.jpg", AssetType.IMAGE);
		path.set ("data/model/Bird.md2", "data/model/Bird.md2");
		type.set ("data/model/Bird.md2", AssetType.BINARY);
		path.set ("data/model/Bird_Skin.png", "data/model/Bird_Skin.png");
		type.set ("data/model/Bird_Skin.png", AssetType.IMAGE);
		path.set ("data/model/body.jpg", "data/model/body.jpg");
		type.set ("data/model/body.jpg", AssetType.IMAGE);
		path.set ("data/model/Canyon.h3d", "data/model/Canyon.h3d");
		type.set ("data/model/Canyon.h3d", AssetType.BINARY);
		path.set ("data/model/gad1.bsp", "data/model/gad1.bsp");
		type.set ("data/model/gad1.bsp", AssetType.BINARY);
		path.set ("data/model/gun.jpg", "data/model/gun.jpg");
		type.set ("data/model/gun.jpg", AssetType.IMAGE);
		path.set ("data/model/gun.md3", "data/model/gun.md3");
		type.set ("data/model/gun.md3", AssetType.BINARY);
		path.set ("data/model/head.jpg", "data/model/head.jpg");
		type.set ("data/model/head.jpg", AssetType.IMAGE);
		path.set ("data/model/head.md3", "data/model/head.md3");
		type.set ("data/model/head.md3", AssetType.BINARY);
		path.set ("data/model/legs.xml", "data/model/legs.xml");
		type.set ("data/model/legs.xml", AssetType.TEXT);
		path.set ("data/model/Level.bsp", "data/model/Level.bsp");
		type.set ("data/model/Level.bsp", AssetType.BINARY);
		path.set ("data/model/lower.md3", "data/model/lower.md3");
		type.set ("data/model/lower.md3", AssetType.BINARY);
		path.set ("data/model/Moss.jpg", "data/model/Moss.jpg");
		type.set ("data/model/Moss.jpg", AssetType.IMAGE);
		path.set ("data/model/Rock.jpg", "data/model/Rock.jpg");
		type.set ("data/model/Rock.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/afrik_wall1a.jpg", "data/model/textures/afrik_wall1a.jpg");
		type.set ("data/model/textures/afrik_wall1a.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/afrik_wall1b.jpg", "data/model/textures/afrik_wall1b.jpg");
		type.set ("data/model/textures/afrik_wall1b.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/battery_side.jpg", "data/model/textures/battery_side.jpg");
		type.set ("data/model/textures/battery_side.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/blackboard2.jpg", "data/model/textures/blackboard2.jpg");
		type.set ("data/model/textures/blackboard2.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/box.jpg", "data/model/textures/box.jpg");
		type.set ("data/model/textures/box.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/crate_reinforced1_top.jpg", "data/model/textures/crate_reinforced1_top.jpg");
		type.set ("data/model/textures/crate_reinforced1_top.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/defenses.jpg", "data/model/textures/defenses.jpg");
		type.set ("data/model/textures/defenses.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/gothic_ceiling/stucco7top.jpg", "data/model/textures/gothic_ceiling/stucco7top.jpg");
		type.set ("data/model/textures/gothic_ceiling/stucco7top.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/gothic_ceiling/woodceiling1a.jpg", "data/model/textures/gothic_ceiling/woodceiling1a.jpg");
		type.set ("data/model/textures/gothic_ceiling/woodceiling1a.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/iron_floor3.jpg", "data/model/textures/iron_floor3.jpg");
		type.set ("data/model/textures/iron_floor3.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/kibako.jpg", "data/model/textures/kibako.jpg");
		type.set ("data/model/textures/kibako.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/kontena.jpg", "data/model/textures/kontena.jpg");
		type.set ("data/model/textures/kontena.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/kontena2.jpg", "data/model/textures/kontena2.jpg");
		type.set ("data/model/textures/kontena2.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/Lamp.jpg", "data/model/textures/Lamp.jpg");
		type.set ("data/model/textures/Lamp.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/lamp2.jpg", "data/model/textures/lamp2.jpg");
		type.set ("data/model/textures/lamp2.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/minen_post.jpg", "data/model/textures/minen_post.jpg");
		type.set ("data/model/textures/minen_post.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/misc_crate1e.jpg", "data/model/textures/misc_crate1e.jpg");
		type.set ("data/model/textures/misc_crate1e.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/nor_panel2_v2.jpg", "data/model/textures/nor_panel2_v2.jpg");
		type.set ("data/model/textures/nor_panel2_v2.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/persnl_lockerfrnt.jpg", "data/model/textures/persnl_lockerfrnt.jpg");
		type.set ("data/model/textures/persnl_lockerfrnt.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/persnl_lockerside.jpg", "data/model/textures/persnl_lockerside.jpg");
		type.set ("data/model/textures/persnl_lockerside.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/personel_lockertall.jpg", "data/model/textures/personel_lockertall.jpg");
		type.set ("data/model/textures/personel_lockertall.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/raildoor.jpg", "data/model/textures/raildoor.jpg");
		type.set ("data/model/textures/raildoor.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/rivetplate.jpg", "data/model/textures/rivetplate.jpg");
		type.set ("data/model/textures/rivetplate.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/tiledfloor_manordark.jpg", "data/model/textures/tiledfloor_manordark.jpg");
		type.set ("data/model/textures/tiledfloor_manordark.jpg", AssetType.IMAGE);
		path.set ("data/model/textures/yuka.jpg", "data/model/textures/yuka.jpg");
		type.set ("data/model/textures/yuka.jpg", AssetType.IMAGE);
		path.set ("data/model/torso.xml", "data/model/torso.xml");
		type.set ("data/model/torso.xml", AssetType.TEXT);
		path.set ("data/model/upper.md3", "data/model/upper.md3");
		type.set ("data/model/upper.md3", AssetType.BINARY);
		path.set ("data/models/bird.h3d", "data/models/bird.h3d");
		type.set ("data/models/bird.h3d", AssetType.BINARY);
		path.set ("data/models/Blade.jpg", "data/models/Blade.jpg");
		type.set ("data/models/Blade.jpg", AssetType.IMAGE);
		path.set ("data/models/Blade.md2", "data/models/Blade.md2");
		type.set ("data/models/Blade.md2", AssetType.BINARY);
		path.set ("data/models/bob.h3d", "data/models/bob.h3d");
		type.set ("data/models/bob.h3d", AssetType.BINARY);
		path.set ("data/models/bones.h3d", "data/models/bones.h3d");
		type.set ("data/models/bones.h3d", AssetType.BINARY);
		path.set ("data/models/bones2.h3d", "data/models/bones2.h3d");
		type.set ("data/models/bones2.h3d", AssetType.BINARY);
		path.set ("data/models/Canyon.h3d", "data/models/Canyon.h3d");
		type.set ("data/models/Canyon.h3d", AssetType.BINARY);
		path.set ("data/models/Canyon.ms3d", "data/models/Canyon.ms3d");
		type.set ("data/models/Canyon.ms3d", AssetType.BINARY);
		path.set ("data/models/carbody.B3D", "data/models/carbody.B3D");
		type.set ("data/models/carbody.B3D", AssetType.BINARY);
		path.set ("data/models/castel.b3d", "data/models/castel.b3d");
		type.set ("data/models/castel.b3d", AssetType.BINARY);
		path.set ("data/models/castel.h3d", "data/models/castel.h3d");
		type.set ("data/models/castel.h3d", AssetType.BINARY);
		path.set ("data/models/cube.h3d", "data/models/cube.h3d");
		type.set ("data/models/cube.h3d", AssetType.BINARY);
		path.set ("data/models/dance.b3d", "data/models/dance.b3d");
		type.set ("data/models/dance.b3d", AssetType.BINARY);
		path.set ("data/models/doska.b3d", "data/models/doska.b3d");
		type.set ("data/models/doska.b3d", AssetType.BINARY);
		path.set ("data/models/dwarf.h3d", "data/models/dwarf.h3d");
		type.set ("data/models/dwarf.h3d", AssetType.BINARY);
		path.set ("data/models/faerie.md2", "data/models/faerie.md2");
		type.set ("data/models/faerie.md2", AssetType.BINARY);
		path.set ("data/models/faerie2.jpg", "data/models/faerie2.jpg");
		type.set ("data/models/faerie2.jpg", AssetType.IMAGE);
		path.set ("data/models/guard1_body.png", "data/models/guard1_body.png");
		type.set ("data/models/guard1_body.png", AssetType.IMAGE);
		path.set ("data/models/guard1_face.png", "data/models/guard1_face.png");
		type.set ("data/models/guard1_face.png", AssetType.IMAGE);
		path.set ("data/models/guard1_helmet.png", "data/models/guard1_helmet.png");
		type.set ("data/models/guard1_helmet.png", AssetType.IMAGE);
		path.set ("data/models/H1.b3d", "data/models/H1.b3d");
		type.set ("data/models/H1.b3d", AssetType.BINARY);
		path.set ("data/models/H2.b3d", "data/models/H2.b3d");
		type.set ("data/models/H2.b3d", AssetType.BINARY);
		path.set ("data/models/HellKnight.b3d", "data/models/HellKnight.b3d");
		type.set ("data/models/HellKnight.b3d", AssetType.BINARY);
		path.set ("data/models/hellknight.h3d", "data/models/hellknight.h3d");
		type.set ("data/models/hellknight.h3d", AssetType.BINARY);
		path.set ("data/models/hellknight.png", "data/models/hellknight.png");
		type.set ("data/models/hellknight.png", AssetType.IMAGE);
		path.set ("data/models/hellknightn.png", "data/models/hellknightn.png");
		type.set ("data/models/hellknightn.png", AssetType.IMAGE);
		path.set ("data/models/hog.h3d", "data/models/hog.h3d");
		type.set ("data/models/hog.h3d", AssetType.BINARY);
		path.set ("data/models/human.h3d", "data/models/human.h3d");
		type.set ("data/models/human.h3d", AssetType.BINARY);
		path.set ("data/models/iron_grill.png", "data/models/iron_grill.png");
		type.set ("data/models/iron_grill.png", AssetType.IMAGE);
		path.set ("data/models/lara/default.bmp", "data/models/lara/default.bmp");
		type.set ("data/models/lara/default.bmp", AssetType.BINARY);
		path.set ("data/models/lara/default.png", "data/models/lara/default.png");
		type.set ("data/models/lara/default.png", AssetType.IMAGE);
		path.set ("data/models/lara/default_h.bmp", "data/models/lara/default_h.bmp");
		type.set ("data/models/lara/default_h.bmp", AssetType.BINARY);
		path.set ("data/models/lara/LaraCroft - ReadMe.txt", "data/models/lara/LaraCroft - ReadMe.txt");
		type.set ("data/models/lara/LaraCroft - ReadMe.txt", AssetType.TEXT);
		path.set ("data/models/lara/lara_animation.cfg", "data/models/lara/lara_animation.cfg");
		type.set ("data/models/lara/lara_animation.cfg", AssetType.TEXT);
		path.set ("data/models/lara/lara_head.MD3", "data/models/lara/lara_head.MD3");
		type.set ("data/models/lara/lara_head.MD3", AssetType.BINARY);
		path.set ("data/models/lara/lara_head.skin", "data/models/lara/lara_head.skin");
		type.set ("data/models/lara/lara_head.skin", AssetType.TEXT);
		path.set ("data/models/lara/lara_lower.md3", "data/models/lara/lara_lower.md3");
		type.set ("data/models/lara/lara_lower.md3", AssetType.BINARY);
		path.set ("data/models/lara/lara_lower.skin", "data/models/lara/lara_lower.skin");
		type.set ("data/models/lara/lara_lower.skin", AssetType.TEXT);
		path.set ("data/models/lara/lara_upper.md3", "data/models/lara/lara_upper.md3");
		type.set ("data/models/lara/lara_upper.md3", AssetType.BINARY);
		path.set ("data/models/lara/lara_upper.skin", "data/models/lara/lara_upper.skin");
		type.set ("data/models/lara/lara_upper.skin", AssetType.TEXT);
		path.set ("data/models/lara/railgun.bmp", "data/models/lara/railgun.bmp");
		type.set ("data/models/lara/railgun.bmp", AssetType.BINARY);
		path.set ("data/models/lara/railgun.jpg", "data/models/lara/railgun.jpg");
		type.set ("data/models/lara/railgun.jpg", AssetType.IMAGE);
		path.set ("data/models/lara/railgun.md3", "data/models/lara/railgun.md3");
		type.set ("data/models/lara/railgun.md3", AssetType.BINARY);
		path.set ("data/models/lara/railgun.png", "data/models/lara/railgun.png");
		type.set ("data/models/lara/railgun.png", AssetType.IMAGE);
		path.set ("data/models/lara/railgun.shader", "data/models/lara/railgun.shader");
		type.set ("data/models/lara/railgun.shader", AssetType.TEXT);
		path.set ("data/models/lara/railgun2.bmp", "data/models/lara/railgun2.bmp");
		type.set ("data/models/lara/railgun2.bmp", AssetType.BINARY);
		path.set ("data/models/lara/railgun2.md3", "data/models/lara/railgun2.md3");
		type.set ("data/models/lara/railgun2.md3", AssetType.BINARY);
		path.set ("data/models/lara/railgun3.bmp", "data/models/lara/railgun3.bmp");
		type.set ("data/models/lara/railgun3.bmp", AssetType.TEXT);
		path.set ("data/models/lara/railgun4.bmp", "data/models/lara/railgun4.bmp");
		type.set ("data/models/lara/railgun4.bmp", AssetType.BINARY);
		path.set ("data/models/LL3.b3d", "data/models/LL3.b3d");
		type.set ("data/models/LL3.b3d", AssetType.BINARY);
		path.set ("data/models/ninja.b3d", "data/models/ninja.b3d");
		type.set ("data/models/ninja.b3d", AssetType.BINARY);
		path.set ("data/models/ninja.h3d", "data/models/ninja.h3d");
		type.set ("data/models/ninja.h3d", AssetType.BINARY);
		path.set ("data/models/ninjas.h3d", "data/models/ninjas.h3d");
		type.set ("data/models/ninjas.h3d", AssetType.BINARY);
		path.set ("data/models/normals.ms3d", "data/models/normals.ms3d");
		type.set ("data/models/normals.ms3d", AssetType.BINARY);
		path.set ("data/models/nskinbl.jpg", "data/models/nskinbl.jpg");
		type.set ("data/models/nskinbl.jpg", AssetType.IMAGE);
		path.set ("data/models/nskingr.jpg", "data/models/nskingr.jpg");
		type.set ("data/models/nskingr.jpg", AssetType.IMAGE);
		path.set ("data/models/nskinn.png", "data/models/nskinn.png");
		type.set ("data/models/nskinn.png", AssetType.IMAGE);
		path.set ("data/models/nskinrd.jpg", "data/models/nskinrd.jpg");
		type.set ("data/models/nskinrd.jpg", AssetType.IMAGE);
		path.set ("data/models/nskinwh.jpg", "data/models/nskinwh.jpg");
		type.set ("data/models/nskinwh.jpg", AssetType.IMAGE);
		path.set ("data/models/ogre.b3d", "data/models/ogre.b3d");
		type.set ("data/models/ogre.b3d", AssetType.BINARY);
		path.set ("data/models/ogre.h3d", "data/models/ogre.h3d");
		type.set ("data/models/ogre.h3d", AssetType.BINARY);
		path.set ("data/models/porco.h3d", "data/models/porco.h3d");
		type.set ("data/models/porco.h3d", AssetType.BINARY);
		path.set ("data/models/round_grill.png", "data/models/round_grill.png");
		type.set ("data/models/round_grill.png", AssetType.IMAGE);
		path.set ("data/models/sarge/animation.cfg", "data/models/sarge/animation.cfg");
		type.set ("data/models/sarge/animation.cfg", AssetType.TEXT);
		path.set ("data/models/sarge/band.jpg", "data/models/sarge/band.jpg");
		type.set ("data/models/sarge/band.jpg", AssetType.IMAGE);
		path.set ("data/models/sarge/band.tga", "data/models/sarge/band.tga");
		type.set ("data/models/sarge/band.tga", AssetType.BINARY);
		path.set ("data/models/sarge/cigar.jpg", "data/models/sarge/cigar.jpg");
		type.set ("data/models/sarge/cigar.jpg", AssetType.IMAGE);
		path.set ("data/models/sarge/cigar.tga", "data/models/sarge/cigar.tga");
		type.set ("data/models/sarge/cigar.tga", AssetType.BINARY);
		path.set ("data/models/sarge/head.md3", "data/models/sarge/head.md3");
		type.set ("data/models/sarge/head.md3", AssetType.BINARY);
		path.set ("data/models/sarge/head_default.skin", "data/models/sarge/head_default.skin");
		type.set ("data/models/sarge/head_default.skin", AssetType.TEXT);
		path.set ("data/models/sarge/legs.animation", "data/models/sarge/legs.animation");
		type.set ("data/models/sarge/legs.animation", AssetType.TEXT);
		path.set ("data/models/sarge/legs.rar", "data/models/sarge/legs.rar");
		type.set ("data/models/sarge/legs.rar", AssetType.BINARY);
		path.set ("data/models/sarge/legs.xml", "data/models/sarge/legs.xml");
		type.set ("data/models/sarge/legs.xml", AssetType.TEXT);
		path.set ("data/models/sarge/lower.md3", "data/models/sarge/lower.md3");
		type.set ("data/models/sarge/lower.md3", AssetType.BINARY);
		path.set ("data/models/sarge/lower_default.skin", "data/models/sarge/lower_default.skin");
		type.set ("data/models/sarge/lower_default.skin", AssetType.TEXT);
		path.set ("data/models/sarge/torso.animation", "data/models/sarge/torso.animation");
		type.set ("data/models/sarge/torso.animation", AssetType.TEXT);
		path.set ("data/models/sarge/torso.xml", "data/models/sarge/torso.xml");
		type.set ("data/models/sarge/torso.xml", AssetType.TEXT);
		path.set ("data/models/sarge/upper.md3", "data/models/sarge/upper.md3");
		type.set ("data/models/sarge/upper.md3", AssetType.BINARY);
		path.set ("data/models/sarge/upper_default.skin", "data/models/sarge/upper_default.skin");
		type.set ("data/models/sarge/upper_default.skin", AssetType.TEXT);
		path.set ("data/models/sinbad.b3d", "data/models/sinbad.b3d");
		type.set ("data/models/sinbad.b3d", AssetType.BINARY);
		path.set ("data/models/sinbad.h3d", "data/models/sinbad.h3d");
		type.set ("data/models/sinbad.h3d", AssetType.BINARY);
		path.set ("data/models/Sinbad_big.h3d", "data/models/Sinbad_big.h3d");
		type.set ("data/models/Sinbad_big.h3d", AssetType.BINARY);
		path.set ("data/models/sniper.b3d", "data/models/sniper.b3d");
		type.set ("data/models/sniper.b3d", AssetType.BINARY);
		path.set ("data/models/soldier.b3d", "data/models/soldier.b3d");
		type.set ("data/models/soldier.b3d", AssetType.BINARY);
		path.set ("data/models/sowtex3.jpg", "data/models/sowtex3.jpg");
		type.set ("data/models/sowtex3.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/axe.jpg", "data/models/textures/axe.jpg");
		type.set ("data/models/textures/axe.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/b3d.jpg", "data/models/textures/b3d.jpg");
		type.set ("data/models/textures/b3d.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Blade.jpg", "data/models/textures/Blade.jpg");
		type.set ("data/models/textures/Blade.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/dwarf.jpg", "data/models/textures/dwarf.jpg");
		type.set ("data/models/textures/dwarf.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/dwarf2.jpg", "data/models/textures/dwarf2.jpg");
		type.set ("data/models/textures/dwarf2.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/faerie2.jpg", "data/models/textures/faerie2.jpg");
		type.set ("data/models/textures/faerie2.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Faerie5.jpg", "data/models/textures/Faerie5.jpg");
		type.set ("data/models/textures/Faerie5.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Floor02.jpg", "data/models/textures/Floor02.jpg");
		type.set ("data/models/textures/Floor02.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Floor04.jpg", "data/models/textures/Floor04.jpg");
		type.set ("data/models/textures/Floor04.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Floor10.jpg", "data/models/textures/Floor10.jpg");
		type.set ("data/models/textures/Floor10.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/glass.jpg", "data/models/textures/glass.jpg");
		type.set ("data/models/textures/glass.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/guard1_body.png", "data/models/textures/guard1_body.png");
		type.set ("data/models/textures/guard1_body.png", AssetType.IMAGE);
		path.set ("data/models/textures/guard1_face.png", "data/models/textures/guard1_face.png");
		type.set ("data/models/textures/guard1_face.png", AssetType.IMAGE);
		path.set ("data/models/textures/guard1_face.psd", "data/models/textures/guard1_face.psd");
		type.set ("data/models/textures/guard1_face.psd", AssetType.BINARY);
		path.set ("data/models/textures/guard1_helmet.png", "data/models/textures/guard1_helmet.png");
		type.set ("data/models/textures/guard1_helmet.png", AssetType.IMAGE);
		path.set ("data/models/textures/HellKnight_Diffuse.jpg", "data/models/textures/HellKnight_Diffuse.jpg");
		type.set ("data/models/textures/HellKnight_Diffuse.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/HellKnight_Normal.jpg", "data/models/textures/HellKnight_Normal.jpg");
		type.set ("data/models/textures/HellKnight_Normal.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/iron_grill.png", "data/models/textures/iron_grill.png");
		type.set ("data/models/textures/iron_grill.png", AssetType.IMAGE);
		path.set ("data/models/textures/josh.jpg", "data/models/textures/josh.jpg");
		type.set ("data/models/textures/josh.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/LM_0014.jpg", "data/models/textures/LM_0014.jpg");
		type.set ("data/models/textures/LM_0014.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Moss.jpg", "data/models/textures/Moss.jpg");
		type.set ("data/models/textures/Moss.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/nskinbl.jpg", "data/models/textures/nskinbl.jpg");
		type.set ("data/models/textures/nskinbl.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/nskingr.jpg", "data/models/textures/nskingr.jpg");
		type.set ("data/models/textures/nskingr.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/nskinrd.jpg", "data/models/textures/nskinrd.jpg");
		type.set ("data/models/textures/nskinrd.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/nskinwh.jpg", "data/models/textures/nskinwh.jpg");
		type.set ("data/models/textures/nskinwh.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Rock.jpg", "data/models/textures/Rock.jpg");
		type.set ("data/models/textures/Rock.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Roof03.jpg", "data/models/textures/Roof03.jpg");
		type.set ("data/models/textures/Roof03.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/round_grill.png", "data/models/textures/round_grill.png");
		type.set ("data/models/textures/round_grill.png", AssetType.IMAGE);
		path.set ("data/models/textures/sinbad_body.png", "data/models/textures/sinbad_body.png");
		type.set ("data/models/textures/sinbad_body.png", AssetType.IMAGE);
		path.set ("data/models/textures/sinbad_clothes.png", "data/models/textures/sinbad_clothes.png");
		type.set ("data/models/textures/sinbad_clothes.png", AssetType.IMAGE);
		path.set ("data/models/textures/sinbad_sword.png", "data/models/textures/sinbad_sword.png");
		type.set ("data/models/textures/sinbad_sword.png", AssetType.IMAGE);
		path.set ("data/models/textures/sowtex3.jpg", "data/models/textures/sowtex3.jpg");
		type.set ("data/models/textures/sowtex3.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/t001.jpg", "data/models/textures/t001.jpg");
		type.set ("data/models/textures/t001.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/t003.jpg", "data/models/textures/t003.jpg");
		type.set ("data/models/textures/t003.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/t004.jpg", "data/models/textures/t004.jpg");
		type.set ("data/models/textures/t004.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/t008.jpg", "data/models/textures/t008.jpg");
		type.set ("data/models/textures/t008.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Wall01.jpg", "data/models/textures/Wall01.jpg");
		type.set ("data/models/textures/Wall01.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Wall02.jpg", "data/models/textures/Wall02.jpg");
		type.set ("data/models/textures/Wall02.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/wall3.jpg", "data/models/textures/wall3.jpg");
		type.set ("data/models/textures/wall3.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Wood01.jpg", "data/models/textures/Wood01.jpg");
		type.set ("data/models/textures/Wood01.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Wood02.jpg", "data/models/textures/Wood02.jpg");
		type.set ("data/models/textures/Wood02.jpg", AssetType.IMAGE);
		path.set ("data/models/textures/Zombie.jpg", "data/models/textures/Zombie.jpg");
		type.set ("data/models/textures/Zombie.jpg", AssetType.IMAGE);
		path.set ("data/models/Turrel.b3d", "data/models/Turrel.b3d");
		type.set ("data/models/Turrel.b3d", AssetType.BINARY);
		path.set ("data/models/vegeta.b3d", "data/models/vegeta.b3d");
		type.set ("data/models/vegeta.b3d", AssetType.BINARY);
		path.set ("data/models/zombie.b3d", "data/models/zombie.b3d");
		type.set ("data/models/zombie.b3d", AssetType.BINARY);
		path.set ("data/models/zombie.h3d", "data/models/zombie.h3d");
		type.set ("data/models/zombie.h3d", AssetType.BINARY);
		path.set ("data/models/Zombie.jpg", "data/models/Zombie.jpg");
		type.set ("data/models/Zombie.jpg", AssetType.IMAGE);
		path.set ("data/Moss.jpg", "data/Moss.jpg");
		type.set ("data/Moss.jpg", AssetType.IMAGE);
		path.set ("data/point.jpg", "data/point.jpg");
		type.set ("data/point.jpg", AssetType.IMAGE);
		path.set ("data/Rock.jpg", "data/Rock.jpg");
		type.set ("data/Rock.jpg", AssetType.IMAGE);
		path.set ("data/skybox01_nx.jpg", "data/skybox01_nx.jpg");
		type.set ("data/skybox01_nx.jpg", AssetType.IMAGE);
		path.set ("data/skybox01_ny.jpg", "data/skybox01_ny.jpg");
		type.set ("data/skybox01_ny.jpg", AssetType.IMAGE);
		path.set ("data/skybox01_nz.jpg", "data/skybox01_nz.jpg");
		type.set ("data/skybox01_nz.jpg", AssetType.IMAGE);
		path.set ("data/skybox01_px.jpg", "data/skybox01_px.jpg");
		type.set ("data/skybox01_px.jpg", AssetType.IMAGE);
		path.set ("data/skybox01_py.jpg", "data/skybox01_py.jpg");
		type.set ("data/skybox01_py.jpg", AssetType.IMAGE);
		path.set ("data/skybox01_pz.jpg", "data/skybox01_pz.jpg");
		type.set ("data/skybox01_pz.jpg", AssetType.IMAGE);
		path.set ("data/spark.png", "data/spark.png");
		type.set ("data/spark.png", AssetType.IMAGE);
		path.set ("data/sprites.png", "data/sprites.png");
		type.set ("data/sprites.png", AssetType.IMAGE);
		path.set ("data/sprites.xml", "data/sprites.xml");
		type.set ("data/sprites.xml", AssetType.TEXT);
		path.set ("data/t351sml.jpg", "data/t351sml.jpg");
		type.set ("data/t351sml.jpg", AssetType.IMAGE);
		path.set ("data/terra/detail.jpg", "data/terra/detail.jpg");
		type.set ("data/terra/detail.jpg", AssetType.IMAGE);
		path.set ("data/terra/detailmap3.jpg", "data/terra/detailmap3.jpg");
		type.set ("data/terra/detailmap3.jpg", AssetType.IMAGE);
		path.set ("data/terra/detail_texture.jpg", "data/terra/detail_texture.jpg");
		type.set ("data/terra/detail_texture.jpg", AssetType.IMAGE);
		path.set ("data/terra/dirt.png", "data/terra/dirt.png");
		type.set ("data/terra/dirt.png", AssetType.IMAGE);
		path.set ("data/terra/island-height-small.jpg", "data/terra/island-height-small.jpg");
		type.set ("data/terra/island-height-small.jpg", AssetType.IMAGE);
		path.set ("data/terra/island-height.jpg", "data/terra/island-height.jpg");
		type.set ("data/terra/island-height.jpg", AssetType.IMAGE);
		path.set ("data/terra/island.jpg", "data/terra/island.jpg");
		type.set ("data/terra/island.jpg", AssetType.IMAGE);
		path.set ("data/terra/noise.jpg", "data/terra/noise.jpg");
		type.set ("data/terra/noise.jpg", AssetType.IMAGE);
		path.set ("data/terra/Raid.png", "data/terra/Raid.png");
		type.set ("data/terra/Raid.png", AssetType.IMAGE);
		path.set ("data/terra/raidtexture.jpg", "data/terra/raidtexture.jpg");
		type.set ("data/terra/raidtexture.jpg", AssetType.IMAGE);
		path.set ("data/terra/Sand.jpg", "data/terra/Sand.jpg");
		type.set ("data/terra/Sand.jpg", AssetType.IMAGE);
		path.set ("data/terra/terrain-heightmap.jpg", "data/terra/terrain-heightmap.jpg");
		type.set ("data/terra/terrain-heightmap.jpg", AssetType.IMAGE);
		path.set ("data/terra/terrain-texture.jpg", "data/terra/terrain-texture.jpg");
		type.set ("data/terra/terrain-texture.jpg", AssetType.IMAGE);
		path.set ("data/textures/Floor02.jpg", "data/textures/Floor02.jpg");
		type.set ("data/textures/Floor02.jpg", AssetType.IMAGE);
		path.set ("data/textures/Floor04.jpg", "data/textures/Floor04.jpg");
		type.set ("data/textures/Floor04.jpg", AssetType.IMAGE);
		path.set ("data/textures/Floor10.jpg", "data/textures/Floor10.jpg");
		type.set ("data/textures/Floor10.jpg", AssetType.IMAGE);
		path.set ("data/textures/Roof03.jpg", "data/textures/Roof03.jpg");
		type.set ("data/textures/Roof03.jpg", AssetType.IMAGE);
		path.set ("data/textures/Wall01.jpg", "data/textures/Wall01.jpg");
		type.set ("data/textures/Wall01.jpg", AssetType.IMAGE);
		path.set ("data/textures/Wall02.jpg", "data/textures/Wall02.jpg");
		type.set ("data/textures/Wall02.jpg", AssetType.IMAGE);
		path.set ("data/textures/wall3.jpg", "data/textures/wall3.jpg");
		type.set ("data/textures/wall3.jpg", AssetType.IMAGE);
		path.set ("data/textures/Wood01.jpg", "data/textures/Wood01.jpg");
		type.set ("data/textures/Wood01.jpg", AssetType.IMAGE);
		path.set ("data/textures/Wood02.jpg", "data/textures/Wood02.jpg");
		type.set ("data/textures/Wood02.jpg", AssetType.IMAGE);
		path.set ("data/trail.png", "data/trail.png");
		type.set ("data/trail.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "data/align.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/arial.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/brick-diffuse.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/color_map.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/f.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/Fire.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/flares.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/flares.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/g.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/grass.dat";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/grass1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/grass2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/hire.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/light.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/lime.svg";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/marble.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/Bird.md2";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/Bird_Skin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/body.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/Canyon.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/gad1.bsp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/gun.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/gun.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/head.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/head.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/legs.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/model/Level.bsp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/lower.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/model/Moss.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/Rock.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/afrik_wall1a.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/afrik_wall1b.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/battery_side.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/blackboard2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/box.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/crate_reinforced1_top.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/defenses.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/gothic_ceiling/stucco7top.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/gothic_ceiling/woodceiling1a.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/iron_floor3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/kibako.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/kontena.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/kontena2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/Lamp.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/lamp2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/minen_post.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/misc_crate1e.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/nor_panel2_v2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/persnl_lockerfrnt.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/persnl_lockerside.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/personel_lockertall.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/raildoor.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/rivetplate.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/tiledfloor_manordark.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/textures/yuka.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/model/torso.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/model/upper.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/bird.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/Blade.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/Blade.md2";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/bob.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/bones.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/bones2.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/Canyon.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/Canyon.ms3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/carbody.B3D";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/castel.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/castel.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/cube.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/dance.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/doska.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/dwarf.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/faerie.md2";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/faerie2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/guard1_body.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/guard1_face.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/guard1_helmet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/H1.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/H2.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/HellKnight.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/hellknight.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/hellknight.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/hellknightn.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/hog.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/human.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/iron_grill.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/lara/default.bmp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/default.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/lara/default_h.bmp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/LaraCroft - ReadMe.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/lara_animation.cfg";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/lara_head.MD3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/lara_head.skin";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/lara_lower.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/lara_lower.skin";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/lara_upper.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/lara_upper.skin";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/railgun.bmp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/railgun.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/lara/railgun.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/railgun.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/lara/railgun.shader";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/railgun2.bmp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/railgun2.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/lara/railgun3.bmp";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/lara/railgun4.bmp";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/LL3.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/ninja.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/ninja.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/ninjas.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/normals.ms3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/nskinbl.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/nskingr.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/nskinn.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/nskinrd.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/nskinwh.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/ogre.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/ogre.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/porco.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/round_grill.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/sarge/animation.cfg";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/band.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/sarge/band.tga";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sarge/cigar.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/sarge/cigar.tga";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sarge/head.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sarge/head_default.skin";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/legs.animation";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/legs.rar";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sarge/legs.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/lower.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sarge/lower_default.skin";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/torso.animation";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/torso.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sarge/upper.md3";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sarge/upper_default.skin";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/models/sinbad.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sinbad.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/Sinbad_big.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sniper.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/soldier.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/sowtex3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/axe.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/b3d.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Blade.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/dwarf.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/dwarf2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/faerie2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Faerie5.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Floor02.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Floor04.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Floor10.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/glass.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/guard1_body.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/guard1_face.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/guard1_face.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/textures/guard1_helmet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/HellKnight_Diffuse.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/HellKnight_Normal.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/iron_grill.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/josh.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/LM_0014.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Moss.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/nskinbl.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/nskingr.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/nskinrd.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/nskinwh.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Rock.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Roof03.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/round_grill.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/sinbad_body.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/sinbad_clothes.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/sinbad_sword.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/sowtex3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/t001.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/t003.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/t004.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/t008.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Wall01.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Wall02.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/wall3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Wood01.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Wood02.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/textures/Zombie.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/models/Turrel.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/vegeta.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/zombie.b3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/zombie.h3d";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "data/models/Zombie.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/Moss.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/point.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/Rock.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/skybox01_nx.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/skybox01_ny.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/skybox01_nz.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/skybox01_px.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/skybox01_py.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/skybox01_pz.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/spark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/sprites.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/sprites.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "data/t351sml.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/detail.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/detailmap3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/detail_texture.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/dirt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/island-height-small.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/island-height.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/island.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/noise.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/Raid.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/raidtexture.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/Sand.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/terrain-heightmap.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/terra/terrain-texture.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Floor02.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Floor04.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Floor10.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Roof03.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Wall01.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Wall02.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/wall3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Wood01.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/textures/Wood02.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "data/trail.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash




































































































































































































































#elseif html5




































































































































































































































#else



#if (windows || mac || linux || cpp)





#end
#end

#if (openfl && !flash)

#end

#end