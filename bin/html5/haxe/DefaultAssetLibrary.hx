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
		
		className.set ("data/align.jpg", __ASSET__data_align_jpg);
		type.set ("data/align.jpg", AssetType.IMAGE);
		className.set ("data/arial.png", __ASSET__data_arial_png);
		type.set ("data/arial.png", AssetType.IMAGE);
		className.set ("data/brick-diffuse.jpg", __ASSET__data_brick_diffuse_jpg);
		type.set ("data/brick-diffuse.jpg", AssetType.IMAGE);
		className.set ("data/color_map.jpg", __ASSET__data_color_map_jpg);
		type.set ("data/color_map.jpg", AssetType.IMAGE);
		className.set ("data/f.jpg", __ASSET__data_f_jpg);
		type.set ("data/f.jpg", AssetType.IMAGE);
		className.set ("data/Fire.png", __ASSET__data_fire_png);
		type.set ("data/Fire.png", AssetType.IMAGE);
		className.set ("data/flares.png", __ASSET__data_flares_png);
		type.set ("data/flares.png", AssetType.IMAGE);
		className.set ("data/flares.xml", __ASSET__data_flares_xml);
		type.set ("data/flares.xml", AssetType.TEXT);
		className.set ("data/g.jpg", __ASSET__data_g_jpg);
		type.set ("data/g.jpg", AssetType.IMAGE);
		className.set ("data/grass.dat", __ASSET__data_grass_dat);
		type.set ("data/grass.dat", AssetType.BINARY);
		className.set ("data/grass1.png", __ASSET__data_grass1_png);
		type.set ("data/grass1.png", AssetType.IMAGE);
		className.set ("data/grass2.png", __ASSET__data_grass2_png);
		type.set ("data/grass2.png", AssetType.IMAGE);
		className.set ("data/hire.png", __ASSET__data_hire_png);
		type.set ("data/hire.png", AssetType.IMAGE);
		className.set ("data/light.jpg", __ASSET__data_light_jpg);
		type.set ("data/light.jpg", AssetType.IMAGE);
		className.set ("data/lime.svg", __ASSET__data_lime_svg);
		type.set ("data/lime.svg", AssetType.TEXT);
		className.set ("data/marble.jpg", __ASSET__data_marble_jpg);
		type.set ("data/marble.jpg", AssetType.IMAGE);
		className.set ("data/model/Bird.md2", __ASSET__data_model_bird_md2);
		type.set ("data/model/Bird.md2", AssetType.BINARY);
		className.set ("data/model/Bird_Skin.png", __ASSET__data_model_bird_skin_png);
		type.set ("data/model/Bird_Skin.png", AssetType.IMAGE);
		className.set ("data/model/body.jpg", __ASSET__data_model_body_jpg);
		type.set ("data/model/body.jpg", AssetType.IMAGE);
		className.set ("data/model/Canyon.h3d", __ASSET__data_model_canyon_h3d);
		type.set ("data/model/Canyon.h3d", AssetType.BINARY);
		className.set ("data/model/gad1.bsp", __ASSET__data_model_gad1_bsp);
		type.set ("data/model/gad1.bsp", AssetType.BINARY);
		className.set ("data/model/gun.jpg", __ASSET__data_model_gun_jpg);
		type.set ("data/model/gun.jpg", AssetType.IMAGE);
		className.set ("data/model/gun.md3", __ASSET__data_model_gun_md3);
		type.set ("data/model/gun.md3", AssetType.BINARY);
		className.set ("data/model/head.jpg", __ASSET__data_model_head_jpg);
		type.set ("data/model/head.jpg", AssetType.IMAGE);
		className.set ("data/model/head.md3", __ASSET__data_model_head_md3);
		type.set ("data/model/head.md3", AssetType.BINARY);
		className.set ("data/model/legs.xml", __ASSET__data_model_legs_xml);
		type.set ("data/model/legs.xml", AssetType.TEXT);
		className.set ("data/model/Level.bsp", __ASSET__data_model_level_bsp);
		type.set ("data/model/Level.bsp", AssetType.BINARY);
		className.set ("data/model/lower.md3", __ASSET__data_model_lower_md3);
		type.set ("data/model/lower.md3", AssetType.BINARY);
		className.set ("data/model/Moss.jpg", __ASSET__data_model_moss_jpg);
		type.set ("data/model/Moss.jpg", AssetType.IMAGE);
		className.set ("data/model/Rock.jpg", __ASSET__data_model_rock_jpg);
		type.set ("data/model/Rock.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/afrik_wall1a.jpg", __ASSET__data_model_textures_afrik_wall1a_jpg);
		type.set ("data/model/textures/afrik_wall1a.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/afrik_wall1b.jpg", __ASSET__data_model_textures_afrik_wall1b_jpg);
		type.set ("data/model/textures/afrik_wall1b.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/battery_side.jpg", __ASSET__data_model_textures_battery_side_jpg);
		type.set ("data/model/textures/battery_side.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/blackboard2.jpg", __ASSET__data_model_textures_blackboard2_jpg);
		type.set ("data/model/textures/blackboard2.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/box.jpg", __ASSET__data_model_textures_box_jpg);
		type.set ("data/model/textures/box.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/crate_reinforced1_top.jpg", __ASSET__data_model_textures_crate_reinforced1_top_jpg);
		type.set ("data/model/textures/crate_reinforced1_top.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/defenses.jpg", __ASSET__data_model_textures_defenses_jpg);
		type.set ("data/model/textures/defenses.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/gothic_ceiling/stucco7top.jpg", __ASSET__data_model_textures_gothic_ceiling_stucco7top_jpg);
		type.set ("data/model/textures/gothic_ceiling/stucco7top.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/gothic_ceiling/woodceiling1a.jpg", __ASSET__data_model_textures_gothic_ceiling_woodceiling1a_jpg);
		type.set ("data/model/textures/gothic_ceiling/woodceiling1a.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/iron_floor3.jpg", __ASSET__data_model_textures_iron_floor3_jpg);
		type.set ("data/model/textures/iron_floor3.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/kibako.jpg", __ASSET__data_model_textures_kibako_jpg);
		type.set ("data/model/textures/kibako.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/kontena.jpg", __ASSET__data_model_textures_kontena_jpg);
		type.set ("data/model/textures/kontena.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/kontena2.jpg", __ASSET__data_model_textures_kontena2_jpg);
		type.set ("data/model/textures/kontena2.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/Lamp.jpg", __ASSET__data_model_textures_lamp_jpg);
		type.set ("data/model/textures/Lamp.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/lamp2.jpg", __ASSET__data_model_textures_lamp2_jpg);
		type.set ("data/model/textures/lamp2.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/minen_post.jpg", __ASSET__data_model_textures_minen_post_jpg);
		type.set ("data/model/textures/minen_post.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/misc_crate1e.jpg", __ASSET__data_model_textures_misc_crate1e_jpg);
		type.set ("data/model/textures/misc_crate1e.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/nor_panel2_v2.jpg", __ASSET__data_model_textures_nor_panel2_v2_jpg);
		type.set ("data/model/textures/nor_panel2_v2.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/persnl_lockerfrnt.jpg", __ASSET__data_model_textures_persnl_lockerfrnt_jpg);
		type.set ("data/model/textures/persnl_lockerfrnt.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/persnl_lockerside.jpg", __ASSET__data_model_textures_persnl_lockerside_jpg);
		type.set ("data/model/textures/persnl_lockerside.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/personel_lockertall.jpg", __ASSET__data_model_textures_personel_lockertall_jpg);
		type.set ("data/model/textures/personel_lockertall.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/raildoor.jpg", __ASSET__data_model_textures_raildoor_jpg);
		type.set ("data/model/textures/raildoor.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/rivetplate.jpg", __ASSET__data_model_textures_rivetplate_jpg);
		type.set ("data/model/textures/rivetplate.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/tiledfloor_manordark.jpg", __ASSET__data_model_textures_tiledfloor_manordark_jpg);
		type.set ("data/model/textures/tiledfloor_manordark.jpg", AssetType.IMAGE);
		className.set ("data/model/textures/yuka.jpg", __ASSET__data_model_textures_yuka_jpg);
		type.set ("data/model/textures/yuka.jpg", AssetType.IMAGE);
		className.set ("data/model/torso.xml", __ASSET__data_model_torso_xml);
		type.set ("data/model/torso.xml", AssetType.TEXT);
		className.set ("data/model/upper.md3", __ASSET__data_model_upper_md3);
		type.set ("data/model/upper.md3", AssetType.BINARY);
		className.set ("data/models/bird.h3d", __ASSET__data_models_bird_h3d);
		type.set ("data/models/bird.h3d", AssetType.BINARY);
		className.set ("data/models/Bird.ms3d", __ASSET__data_models_bird_ms3d);
		type.set ("data/models/Bird.ms3d", AssetType.BINARY);
		className.set ("data/models/Blade.jpg", __ASSET__data_models_blade_jpg);
		type.set ("data/models/Blade.jpg", AssetType.IMAGE);
		className.set ("data/models/Blade.md2", __ASSET__data_models_blade_md2);
		type.set ("data/models/Blade.md2", AssetType.BINARY);
		className.set ("data/models/bob.h3d", __ASSET__data_models_bob_h3d);
		type.set ("data/models/bob.h3d", AssetType.BINARY);
		className.set ("data/models/bones.h3d", __ASSET__data_models_bones_h3d);
		type.set ("data/models/bones.h3d", AssetType.BINARY);
		className.set ("data/models/bones2.h3d", __ASSET__data_models_bones2_h3d);
		type.set ("data/models/bones2.h3d", AssetType.BINARY);
		className.set ("data/models/Canyon.h3d", __ASSET__data_models_canyon_h3d);
		type.set ("data/models/Canyon.h3d", AssetType.BINARY);
		className.set ("data/models/Canyon.ms3d", __ASSET__data_models_canyon_ms3d);
		type.set ("data/models/Canyon.ms3d", AssetType.BINARY);
		className.set ("data/models/carbody.B3D", __ASSET__data_models_carbody_b3d);
		type.set ("data/models/carbody.B3D", AssetType.BINARY);
		className.set ("data/models/castel.b3d", __ASSET__data_models_castel_b3d);
		type.set ("data/models/castel.b3d", AssetType.BINARY);
		className.set ("data/models/castel.h3d", __ASSET__data_models_castel_h3d);
		type.set ("data/models/castel.h3d", AssetType.BINARY);
		className.set ("data/models/cube.h3d", __ASSET__data_models_cube_h3d);
		type.set ("data/models/cube.h3d", AssetType.BINARY);
		className.set ("data/models/cube.ms3d", __ASSET__data_models_cube_ms3d);
		type.set ("data/models/cube.ms3d", AssetType.BINARY);
		className.set ("data/models/dance.b3d", __ASSET__data_models_dance_b3d);
		type.set ("data/models/dance.b3d", AssetType.BINARY);
		className.set ("data/models/doska.b3d", __ASSET__data_models_doska_b3d);
		type.set ("data/models/doska.b3d", AssetType.BINARY);
		className.set ("data/models/dwarf.h3d", __ASSET__data_models_dwarf_h3d);
		type.set ("data/models/dwarf.h3d", AssetType.BINARY);
		className.set ("data/models/faerie.md2", __ASSET__data_models_faerie_md2);
		type.set ("data/models/faerie.md2", AssetType.BINARY);
		className.set ("data/models/faerie2.jpg", __ASSET__data_models_faerie2_jpg);
		type.set ("data/models/faerie2.jpg", AssetType.IMAGE);
		className.set ("data/models/guard1_body.png", __ASSET__data_models_guard1_body_png);
		type.set ("data/models/guard1_body.png", AssetType.IMAGE);
		className.set ("data/models/guard1_face.png", __ASSET__data_models_guard1_face_png);
		type.set ("data/models/guard1_face.png", AssetType.IMAGE);
		className.set ("data/models/guard1_helmet.png", __ASSET__data_models_guard1_helmet_png);
		type.set ("data/models/guard1_helmet.png", AssetType.IMAGE);
		className.set ("data/models/H1.b3d", __ASSET__data_models_h1_b3d);
		type.set ("data/models/H1.b3d", AssetType.BINARY);
		className.set ("data/models/H2.b3d", __ASSET__data_models_h2_b3d);
		type.set ("data/models/H2.b3d", AssetType.BINARY);
		className.set ("data/models/HellKnight.b3d", __ASSET__data_models_hellknight_b3d);
		type.set ("data/models/HellKnight.b3d", AssetType.BINARY);
		className.set ("data/models/hellknight.h3d", __ASSET__data_models_hellknight_h3d);
		type.set ("data/models/hellknight.h3d", AssetType.BINARY);
		className.set ("data/models/hellknight.png", __ASSET__data_models_hellknight_png);
		type.set ("data/models/hellknight.png", AssetType.IMAGE);
		className.set ("data/models/hellknightn.png", __ASSET__data_models_hellknightn_png);
		type.set ("data/models/hellknightn.png", AssetType.IMAGE);
		className.set ("data/models/hog.h3d", __ASSET__data_models_hog_h3d);
		type.set ("data/models/hog.h3d", AssetType.BINARY);
		className.set ("data/models/human.h3d", __ASSET__data_models_human_h3d);
		type.set ("data/models/human.h3d", AssetType.BINARY);
		className.set ("data/models/iron_grill.png", __ASSET__data_models_iron_grill_png);
		type.set ("data/models/iron_grill.png", AssetType.IMAGE);
		className.set ("data/models/lara/default.bmp", __ASSET__data_models_lara_default_bmp);
		type.set ("data/models/lara/default.bmp", AssetType.BINARY);
		className.set ("data/models/lara/default.png", __ASSET__data_models_lara_default_png);
		type.set ("data/models/lara/default.png", AssetType.IMAGE);
		className.set ("data/models/lara/default_h.bmp", __ASSET__data_models_lara_default_h_bmp);
		type.set ("data/models/lara/default_h.bmp", AssetType.BINARY);
		className.set ("data/models/lara/LaraCroft - ReadMe.txt", __ASSET__data_models_lara_laracroft___readme_txt);
		type.set ("data/models/lara/LaraCroft - ReadMe.txt", AssetType.TEXT);
		className.set ("data/models/lara/lara_animation.cfg", __ASSET__data_models_lara_lara_animation_cfg);
		type.set ("data/models/lara/lara_animation.cfg", AssetType.TEXT);
		className.set ("data/models/lara/lara_head.MD3", __ASSET__data_models_lara_lara_head_md3);
		type.set ("data/models/lara/lara_head.MD3", AssetType.BINARY);
		className.set ("data/models/lara/lara_head.skin", __ASSET__data_models_lara_lara_head_skin);
		type.set ("data/models/lara/lara_head.skin", AssetType.TEXT);
		className.set ("data/models/lara/lara_lower.md3", __ASSET__data_models_lara_lara_lower_md3);
		type.set ("data/models/lara/lara_lower.md3", AssetType.BINARY);
		className.set ("data/models/lara/lara_lower.skin", __ASSET__data_models_lara_lara_lower_skin);
		type.set ("data/models/lara/lara_lower.skin", AssetType.TEXT);
		className.set ("data/models/lara/lara_upper.md3", __ASSET__data_models_lara_lara_upper_md3);
		type.set ("data/models/lara/lara_upper.md3", AssetType.BINARY);
		className.set ("data/models/lara/lara_upper.skin", __ASSET__data_models_lara_lara_upper_skin);
		type.set ("data/models/lara/lara_upper.skin", AssetType.TEXT);
		className.set ("data/models/lara/railgun.bmp", __ASSET__data_models_lara_railgun_bmp);
		type.set ("data/models/lara/railgun.bmp", AssetType.BINARY);
		className.set ("data/models/lara/railgun.jpg", __ASSET__data_models_lara_railgun_jpg);
		type.set ("data/models/lara/railgun.jpg", AssetType.IMAGE);
		className.set ("data/models/lara/railgun.md3", __ASSET__data_models_lara_railgun_md3);
		type.set ("data/models/lara/railgun.md3", AssetType.BINARY);
		className.set ("data/models/lara/railgun.png", __ASSET__data_models_lara_railgun_png);
		type.set ("data/models/lara/railgun.png", AssetType.IMAGE);
		className.set ("data/models/lara/railgun.shader", __ASSET__data_models_lara_railgun_shader);
		type.set ("data/models/lara/railgun.shader", AssetType.TEXT);
		className.set ("data/models/lara/railgun2.bmp", __ASSET__data_models_lara_railgun2_bmp);
		type.set ("data/models/lara/railgun2.bmp", AssetType.BINARY);
		className.set ("data/models/lara/railgun2.md3", __ASSET__data_models_lara_railgun2_md3);
		type.set ("data/models/lara/railgun2.md3", AssetType.BINARY);
		className.set ("data/models/lara/railgun3.bmp", __ASSET__data_models_lara_railgun3_bmp);
		type.set ("data/models/lara/railgun3.bmp", AssetType.TEXT);
		className.set ("data/models/lara/railgun4.bmp", __ASSET__data_models_lara_railgun4_bmp);
		type.set ("data/models/lara/railgun4.bmp", AssetType.BINARY);
		className.set ("data/models/LL3.b3d", __ASSET__data_models_ll3_b3d);
		type.set ("data/models/LL3.b3d", AssetType.BINARY);
		className.set ("data/models/ninja.b3d", __ASSET__data_models_ninja_b3d);
		type.set ("data/models/ninja.b3d", AssetType.BINARY);
		className.set ("data/models/ninja.h3d", __ASSET__data_models_ninja_h3d);
		type.set ("data/models/ninja.h3d", AssetType.BINARY);
		className.set ("data/models/ninja.ms3d", __ASSET__data_models_ninja_ms3d);
		type.set ("data/models/ninja.ms3d", AssetType.BINARY);
		className.set ("data/models/ninjas.h3d", __ASSET__data_models_ninjas_h3d);
		type.set ("data/models/ninjas.h3d", AssetType.BINARY);
		className.set ("data/models/normals.ms3d", __ASSET__data_models_normals_ms3d);
		type.set ("data/models/normals.ms3d", AssetType.BINARY);
		className.set ("data/models/nskinbl.jpg", __ASSET__data_models_nskinbl_jpg);
		type.set ("data/models/nskinbl.jpg", AssetType.IMAGE);
		className.set ("data/models/nskingr.jpg", __ASSET__data_models_nskingr_jpg);
		type.set ("data/models/nskingr.jpg", AssetType.IMAGE);
		className.set ("data/models/nskinn.png", __ASSET__data_models_nskinn_png);
		type.set ("data/models/nskinn.png", AssetType.IMAGE);
		className.set ("data/models/nskinrd.jpg", __ASSET__data_models_nskinrd_jpg);
		type.set ("data/models/nskinrd.jpg", AssetType.IMAGE);
		className.set ("data/models/nskinwh.jpg", __ASSET__data_models_nskinwh_jpg);
		type.set ("data/models/nskinwh.jpg", AssetType.IMAGE);
		className.set ("data/models/ogre.b3d", __ASSET__data_models_ogre_b3d);
		type.set ("data/models/ogre.b3d", AssetType.BINARY);
		className.set ("data/models/ogre.h3d", __ASSET__data_models_ogre_h3d);
		type.set ("data/models/ogre.h3d", AssetType.BINARY);
		className.set ("data/models/porco.h3d", __ASSET__data_models_porco_h3d);
		type.set ("data/models/porco.h3d", AssetType.BINARY);
		className.set ("data/models/round_grill.png", __ASSET__data_models_round_grill_png);
		type.set ("data/models/round_grill.png", AssetType.IMAGE);
		className.set ("data/models/sarge/animation.cfg", __ASSET__data_models_sarge_animation_cfg);
		type.set ("data/models/sarge/animation.cfg", AssetType.TEXT);
		className.set ("data/models/sarge/band.jpg", __ASSET__data_models_sarge_band_jpg);
		type.set ("data/models/sarge/band.jpg", AssetType.IMAGE);
		className.set ("data/models/sarge/band.tga", __ASSET__data_models_sarge_band_tga);
		type.set ("data/models/sarge/band.tga", AssetType.BINARY);
		className.set ("data/models/sarge/cigar.jpg", __ASSET__data_models_sarge_cigar_jpg);
		type.set ("data/models/sarge/cigar.jpg", AssetType.IMAGE);
		className.set ("data/models/sarge/cigar.tga", __ASSET__data_models_sarge_cigar_tga);
		type.set ("data/models/sarge/cigar.tga", AssetType.BINARY);
		className.set ("data/models/sarge/head.md3", __ASSET__data_models_sarge_head_md3);
		type.set ("data/models/sarge/head.md3", AssetType.BINARY);
		className.set ("data/models/sarge/head_default.skin", __ASSET__data_models_sarge_head_default_skin);
		type.set ("data/models/sarge/head_default.skin", AssetType.TEXT);
		className.set ("data/models/sarge/legs.animation", __ASSET__data_models_sarge_legs_animation);
		type.set ("data/models/sarge/legs.animation", AssetType.TEXT);
		className.set ("data/models/sarge/legs.rar", __ASSET__data_models_sarge_legs_rar);
		type.set ("data/models/sarge/legs.rar", AssetType.BINARY);
		className.set ("data/models/sarge/legs.xml", __ASSET__data_models_sarge_legs_xml);
		type.set ("data/models/sarge/legs.xml", AssetType.TEXT);
		className.set ("data/models/sarge/lower.md3", __ASSET__data_models_sarge_lower_md3);
		type.set ("data/models/sarge/lower.md3", AssetType.BINARY);
		className.set ("data/models/sarge/lower_default.skin", __ASSET__data_models_sarge_lower_default_skin);
		type.set ("data/models/sarge/lower_default.skin", AssetType.TEXT);
		className.set ("data/models/sarge/torso.animation", __ASSET__data_models_sarge_torso_animation);
		type.set ("data/models/sarge/torso.animation", AssetType.TEXT);
		className.set ("data/models/sarge/torso.xml", __ASSET__data_models_sarge_torso_xml);
		type.set ("data/models/sarge/torso.xml", AssetType.TEXT);
		className.set ("data/models/sarge/upper.md3", __ASSET__data_models_sarge_upper_md3);
		type.set ("data/models/sarge/upper.md3", AssetType.BINARY);
		className.set ("data/models/sarge/upper_default.skin", __ASSET__data_models_sarge_upper_default_skin);
		type.set ("data/models/sarge/upper_default.skin", AssetType.TEXT);
		className.set ("data/models/sinbad.b3d", __ASSET__data_models_sinbad_b3d);
		type.set ("data/models/sinbad.b3d", AssetType.BINARY);
		className.set ("data/models/sinbad.h3d", __ASSET__data_models_sinbad_h3d);
		type.set ("data/models/sinbad.h3d", AssetType.BINARY);
		className.set ("data/models/Sinbad_big.h3d", __ASSET__data_models_sinbad_big_h3d);
		type.set ("data/models/Sinbad_big.h3d", AssetType.BINARY);
		className.set ("data/models/sniper.b3d", __ASSET__data_models_sniper_b3d);
		type.set ("data/models/sniper.b3d", AssetType.BINARY);
		className.set ("data/models/soldier.b3d", __ASSET__data_models_soldier_b3d);
		type.set ("data/models/soldier.b3d", AssetType.BINARY);
		className.set ("data/models/sowtex3.jpg", __ASSET__data_models_sowtex3_jpg);
		type.set ("data/models/sowtex3.jpg", AssetType.IMAGE);
		className.set ("data/models/t351sml.jpg", __ASSET__data_models_t351sml_jpg);
		type.set ("data/models/t351sml.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/axe.jpg", __ASSET__data_models_textures_axe_jpg);
		type.set ("data/models/textures/axe.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/b3d.jpg", __ASSET__data_models_textures_b3d_jpg);
		type.set ("data/models/textures/b3d.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Blade.jpg", __ASSET__data_models_textures_blade_jpg);
		type.set ("data/models/textures/Blade.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/dwarf.jpg", __ASSET__data_models_textures_dwarf_jpg);
		type.set ("data/models/textures/dwarf.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/dwarf2.jpg", __ASSET__data_models_textures_dwarf2_jpg);
		type.set ("data/models/textures/dwarf2.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/faerie2.jpg", __ASSET__data_models_textures_faerie2_jpg);
		type.set ("data/models/textures/faerie2.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Faerie5.jpg", __ASSET__data_models_textures_faerie5_jpg);
		type.set ("data/models/textures/Faerie5.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Floor02.jpg", __ASSET__data_models_textures_floor02_jpg);
		type.set ("data/models/textures/Floor02.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Floor04.jpg", __ASSET__data_models_textures_floor04_jpg);
		type.set ("data/models/textures/Floor04.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Floor10.jpg", __ASSET__data_models_textures_floor10_jpg);
		type.set ("data/models/textures/Floor10.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/glass.jpg", __ASSET__data_models_textures_glass_jpg);
		type.set ("data/models/textures/glass.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/guard1_body.png", __ASSET__data_models_textures_guard1_body_png);
		type.set ("data/models/textures/guard1_body.png", AssetType.IMAGE);
		className.set ("data/models/textures/guard1_face.png", __ASSET__data_models_textures_guard1_face_png);
		type.set ("data/models/textures/guard1_face.png", AssetType.IMAGE);
		className.set ("data/models/textures/guard1_face.psd", __ASSET__data_models_textures_guard1_face_psd);
		type.set ("data/models/textures/guard1_face.psd", AssetType.BINARY);
		className.set ("data/models/textures/guard1_helmet.png", __ASSET__data_models_textures_guard1_helmet_png);
		type.set ("data/models/textures/guard1_helmet.png", AssetType.IMAGE);
		className.set ("data/models/textures/HellKnight_Diffuse.jpg", __ASSET__data_models_textures_hellknight_diffuse_jpg);
		type.set ("data/models/textures/HellKnight_Diffuse.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/HellKnight_Normal.jpg", __ASSET__data_models_textures_hellknight_normal_jpg);
		type.set ("data/models/textures/HellKnight_Normal.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/iron_grill.png", __ASSET__data_models_textures_iron_grill_png);
		type.set ("data/models/textures/iron_grill.png", AssetType.IMAGE);
		className.set ("data/models/textures/josh.jpg", __ASSET__data_models_textures_josh_jpg);
		type.set ("data/models/textures/josh.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/LM_0014.jpg", __ASSET__data_models_textures_lm_0014_jpg);
		type.set ("data/models/textures/LM_0014.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Moss.jpg", __ASSET__data_models_textures_moss_jpg);
		type.set ("data/models/textures/Moss.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/nskinbl.jpg", __ASSET__data_models_textures_nskinbl_jpg);
		type.set ("data/models/textures/nskinbl.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/nskingr.jpg", __ASSET__data_models_textures_nskingr_jpg);
		type.set ("data/models/textures/nskingr.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/nskinrd.jpg", __ASSET__data_models_textures_nskinrd_jpg);
		type.set ("data/models/textures/nskinrd.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/nskinwh.jpg", __ASSET__data_models_textures_nskinwh_jpg);
		type.set ("data/models/textures/nskinwh.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Rock.jpg", __ASSET__data_models_textures_rock_jpg);
		type.set ("data/models/textures/Rock.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Roof03.jpg", __ASSET__data_models_textures_roof03_jpg);
		type.set ("data/models/textures/Roof03.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/round_grill.png", __ASSET__data_models_textures_round_grill_png);
		type.set ("data/models/textures/round_grill.png", AssetType.IMAGE);
		className.set ("data/models/textures/sinbad_body.png", __ASSET__data_models_textures_sinbad_body_png);
		type.set ("data/models/textures/sinbad_body.png", AssetType.IMAGE);
		className.set ("data/models/textures/sinbad_clothes.png", __ASSET__data_models_textures_sinbad_clothes_png);
		type.set ("data/models/textures/sinbad_clothes.png", AssetType.IMAGE);
		className.set ("data/models/textures/sinbad_sword.png", __ASSET__data_models_textures_sinbad_sword_png);
		type.set ("data/models/textures/sinbad_sword.png", AssetType.IMAGE);
		className.set ("data/models/textures/sowtex3.jpg", __ASSET__data_models_textures_sowtex3_jpg);
		type.set ("data/models/textures/sowtex3.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/t001.jpg", __ASSET__data_models_textures_t001_jpg);
		type.set ("data/models/textures/t001.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/t003.jpg", __ASSET__data_models_textures_t003_jpg);
		type.set ("data/models/textures/t003.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/t004.jpg", __ASSET__data_models_textures_t004_jpg);
		type.set ("data/models/textures/t004.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/t008.jpg", __ASSET__data_models_textures_t008_jpg);
		type.set ("data/models/textures/t008.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Wall01.jpg", __ASSET__data_models_textures_wall01_jpg);
		type.set ("data/models/textures/Wall01.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Wall02.jpg", __ASSET__data_models_textures_wall02_jpg);
		type.set ("data/models/textures/Wall02.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/wall3.jpg", __ASSET__data_models_textures_wall3_jpg);
		type.set ("data/models/textures/wall3.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Wood01.jpg", __ASSET__data_models_textures_wood01_jpg);
		type.set ("data/models/textures/Wood01.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Wood02.jpg", __ASSET__data_models_textures_wood02_jpg);
		type.set ("data/models/textures/Wood02.jpg", AssetType.IMAGE);
		className.set ("data/models/textures/Zombie.jpg", __ASSET__data_models_textures_zombie_jpg);
		type.set ("data/models/textures/Zombie.jpg", AssetType.IMAGE);
		className.set ("data/models/Turrel.b3d", __ASSET__data_models_turrel_b3d);
		type.set ("data/models/Turrel.b3d", AssetType.BINARY);
		className.set ("data/models/vegeta.b3d", __ASSET__data_models_vegeta_b3d);
		type.set ("data/models/vegeta.b3d", AssetType.BINARY);
		className.set ("data/models/zombie.b3d", __ASSET__data_models_zombie_b3d);
		type.set ("data/models/zombie.b3d", AssetType.BINARY);
		className.set ("data/models/zombie.h3d", __ASSET__data_models_zombie_h3d);
		type.set ("data/models/zombie.h3d", AssetType.BINARY);
		className.set ("data/models/Zombie.jpg", __ASSET__data_models_zombie_jpg);
		type.set ("data/models/Zombie.jpg", AssetType.IMAGE);
		className.set ("data/Moss.jpg", __ASSET__data_moss_jpg);
		type.set ("data/Moss.jpg", AssetType.IMAGE);
		className.set ("data/point.jpg", __ASSET__data_point_jpg);
		type.set ("data/point.jpg", AssetType.IMAGE);
		className.set ("data/Rock.jpg", __ASSET__data_rock_jpg);
		type.set ("data/Rock.jpg", AssetType.IMAGE);
		className.set ("data/skybox01_nx.jpg", __ASSET__data_skybox01_nx_jpg);
		type.set ("data/skybox01_nx.jpg", AssetType.IMAGE);
		className.set ("data/skybox01_ny.jpg", __ASSET__data_skybox01_ny_jpg);
		type.set ("data/skybox01_ny.jpg", AssetType.IMAGE);
		className.set ("data/skybox01_nz.jpg", __ASSET__data_skybox01_nz_jpg);
		type.set ("data/skybox01_nz.jpg", AssetType.IMAGE);
		className.set ("data/skybox01_px.jpg", __ASSET__data_skybox01_px_jpg);
		type.set ("data/skybox01_px.jpg", AssetType.IMAGE);
		className.set ("data/skybox01_py.jpg", __ASSET__data_skybox01_py_jpg);
		type.set ("data/skybox01_py.jpg", AssetType.IMAGE);
		className.set ("data/skybox01_pz.jpg", __ASSET__data_skybox01_pz_jpg);
		type.set ("data/skybox01_pz.jpg", AssetType.IMAGE);
		className.set ("data/spark.png", __ASSET__data_spark_png);
		type.set ("data/spark.png", AssetType.IMAGE);
		className.set ("data/sprites.png", __ASSET__data_sprites_png);
		type.set ("data/sprites.png", AssetType.IMAGE);
		className.set ("data/sprites.xml", __ASSET__data_sprites_xml);
		type.set ("data/sprites.xml", AssetType.TEXT);
		className.set ("data/t351sml.jpg", __ASSET__data_t351sml_jpg);
		type.set ("data/t351sml.jpg", AssetType.IMAGE);
		className.set ("data/terra/detail.jpg", __ASSET__data_terra_detail_jpg);
		type.set ("data/terra/detail.jpg", AssetType.IMAGE);
		className.set ("data/terra/detailmap3.jpg", __ASSET__data_terra_detailmap3_jpg);
		type.set ("data/terra/detailmap3.jpg", AssetType.IMAGE);
		className.set ("data/terra/detail_texture.jpg", __ASSET__data_terra_detail_texture_jpg);
		type.set ("data/terra/detail_texture.jpg", AssetType.IMAGE);
		className.set ("data/terra/dirt.png", __ASSET__data_terra_dirt_png);
		type.set ("data/terra/dirt.png", AssetType.IMAGE);
		className.set ("data/terra/island-height-small.jpg", __ASSET__data_terra_island_height_small_jpg);
		type.set ("data/terra/island-height-small.jpg", AssetType.IMAGE);
		className.set ("data/terra/island-height.jpg", __ASSET__data_terra_island_height_jpg);
		type.set ("data/terra/island-height.jpg", AssetType.IMAGE);
		className.set ("data/terra/island.jpg", __ASSET__data_terra_island_jpg);
		type.set ("data/terra/island.jpg", AssetType.IMAGE);
		className.set ("data/terra/noise.jpg", __ASSET__data_terra_noise_jpg);
		type.set ("data/terra/noise.jpg", AssetType.IMAGE);
		className.set ("data/terra/Raid.png", __ASSET__data_terra_raid_png);
		type.set ("data/terra/Raid.png", AssetType.IMAGE);
		className.set ("data/terra/raidtexture.jpg", __ASSET__data_terra_raidtexture_jpg);
		type.set ("data/terra/raidtexture.jpg", AssetType.IMAGE);
		className.set ("data/terra/Sand.jpg", __ASSET__data_terra_sand_jpg);
		type.set ("data/terra/Sand.jpg", AssetType.IMAGE);
		className.set ("data/terra/terrain-heightmap.jpg", __ASSET__data_terra_terrain_heightmap_jpg);
		type.set ("data/terra/terrain-heightmap.jpg", AssetType.IMAGE);
		className.set ("data/terra/terrain-texture.jpg", __ASSET__data_terra_terrain_texture_jpg);
		type.set ("data/terra/terrain-texture.jpg", AssetType.IMAGE);
		className.set ("data/textures/Floor02.jpg", __ASSET__data_textures_floor02_jpg);
		type.set ("data/textures/Floor02.jpg", AssetType.IMAGE);
		className.set ("data/textures/Floor04.jpg", __ASSET__data_textures_floor04_jpg);
		type.set ("data/textures/Floor04.jpg", AssetType.IMAGE);
		className.set ("data/textures/Floor10.jpg", __ASSET__data_textures_floor10_jpg);
		type.set ("data/textures/Floor10.jpg", AssetType.IMAGE);
		className.set ("data/textures/Roof03.jpg", __ASSET__data_textures_roof03_jpg);
		type.set ("data/textures/Roof03.jpg", AssetType.IMAGE);
		className.set ("data/textures/Wall01.jpg", __ASSET__data_textures_wall01_jpg);
		type.set ("data/textures/Wall01.jpg", AssetType.IMAGE);
		className.set ("data/textures/Wall02.jpg", __ASSET__data_textures_wall02_jpg);
		type.set ("data/textures/Wall02.jpg", AssetType.IMAGE);
		className.set ("data/textures/wall3.jpg", __ASSET__data_textures_wall3_jpg);
		type.set ("data/textures/wall3.jpg", AssetType.IMAGE);
		className.set ("data/textures/Wood01.jpg", __ASSET__data_textures_wood01_jpg);
		type.set ("data/textures/Wood01.jpg", AssetType.IMAGE);
		className.set ("data/textures/Wood02.jpg", __ASSET__data_textures_wood02_jpg);
		type.set ("data/textures/Wood02.jpg", AssetType.IMAGE);
		className.set ("data/trail.png", __ASSET__data_trail_png);
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
		id = "data/models/Bird.ms3d";
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
		id = "data/models/cube.ms3d";
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
		id = "data/models/ninja.ms3d";
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
		id = "data/models/t351sml.jpg";
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
		
		className.set ("data/align.jpg", __ASSET__data_align_jpg);
		type.set ("data/align.jpg", AssetType.IMAGE);
		
		className.set ("data/arial.png", __ASSET__data_arial_png);
		type.set ("data/arial.png", AssetType.IMAGE);
		
		className.set ("data/brick-diffuse.jpg", __ASSET__data_brick_diffuse_jpg);
		type.set ("data/brick-diffuse.jpg", AssetType.IMAGE);
		
		className.set ("data/color_map.jpg", __ASSET__data_color_map_jpg);
		type.set ("data/color_map.jpg", AssetType.IMAGE);
		
		className.set ("data/f.jpg", __ASSET__data_f_jpg);
		type.set ("data/f.jpg", AssetType.IMAGE);
		
		className.set ("data/Fire.png", __ASSET__data_fire_png);
		type.set ("data/Fire.png", AssetType.IMAGE);
		
		className.set ("data/flares.png", __ASSET__data_flares_png);
		type.set ("data/flares.png", AssetType.IMAGE);
		
		className.set ("data/flares.xml", __ASSET__data_flares_xml);
		type.set ("data/flares.xml", AssetType.TEXT);
		
		className.set ("data/g.jpg", __ASSET__data_g_jpg);
		type.set ("data/g.jpg", AssetType.IMAGE);
		
		className.set ("data/grass.dat", __ASSET__data_grass_dat);
		type.set ("data/grass.dat", AssetType.BINARY);
		
		className.set ("data/grass1.png", __ASSET__data_grass1_png);
		type.set ("data/grass1.png", AssetType.IMAGE);
		
		className.set ("data/grass2.png", __ASSET__data_grass2_png);
		type.set ("data/grass2.png", AssetType.IMAGE);
		
		className.set ("data/hire.png", __ASSET__data_hire_png);
		type.set ("data/hire.png", AssetType.IMAGE);
		
		className.set ("data/light.jpg", __ASSET__data_light_jpg);
		type.set ("data/light.jpg", AssetType.IMAGE);
		
		className.set ("data/lime.svg", __ASSET__data_lime_svg);
		type.set ("data/lime.svg", AssetType.TEXT);
		
		className.set ("data/marble.jpg", __ASSET__data_marble_jpg);
		type.set ("data/marble.jpg", AssetType.IMAGE);
		
		className.set ("data/model/Bird.md2", __ASSET__data_model_bird_md2);
		type.set ("data/model/Bird.md2", AssetType.BINARY);
		
		className.set ("data/model/Bird_Skin.png", __ASSET__data_model_bird_skin_png);
		type.set ("data/model/Bird_Skin.png", AssetType.IMAGE);
		
		className.set ("data/model/body.jpg", __ASSET__data_model_body_jpg);
		type.set ("data/model/body.jpg", AssetType.IMAGE);
		
		className.set ("data/model/Canyon.h3d", __ASSET__data_model_canyon_h3d);
		type.set ("data/model/Canyon.h3d", AssetType.BINARY);
		
		className.set ("data/model/gad1.bsp", __ASSET__data_model_gad1_bsp);
		type.set ("data/model/gad1.bsp", AssetType.BINARY);
		
		className.set ("data/model/gun.jpg", __ASSET__data_model_gun_jpg);
		type.set ("data/model/gun.jpg", AssetType.IMAGE);
		
		className.set ("data/model/gun.md3", __ASSET__data_model_gun_md3);
		type.set ("data/model/gun.md3", AssetType.BINARY);
		
		className.set ("data/model/head.jpg", __ASSET__data_model_head_jpg);
		type.set ("data/model/head.jpg", AssetType.IMAGE);
		
		className.set ("data/model/head.md3", __ASSET__data_model_head_md3);
		type.set ("data/model/head.md3", AssetType.BINARY);
		
		className.set ("data/model/legs.xml", __ASSET__data_model_legs_xml);
		type.set ("data/model/legs.xml", AssetType.TEXT);
		
		className.set ("data/model/Level.bsp", __ASSET__data_model_level_bsp);
		type.set ("data/model/Level.bsp", AssetType.BINARY);
		
		className.set ("data/model/lower.md3", __ASSET__data_model_lower_md3);
		type.set ("data/model/lower.md3", AssetType.BINARY);
		
		className.set ("data/model/Moss.jpg", __ASSET__data_model_moss_jpg);
		type.set ("data/model/Moss.jpg", AssetType.IMAGE);
		
		className.set ("data/model/Rock.jpg", __ASSET__data_model_rock_jpg);
		type.set ("data/model/Rock.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/afrik_wall1a.jpg", __ASSET__data_model_textures_afrik_wall1a_jpg);
		type.set ("data/model/textures/afrik_wall1a.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/afrik_wall1b.jpg", __ASSET__data_model_textures_afrik_wall1b_jpg);
		type.set ("data/model/textures/afrik_wall1b.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/battery_side.jpg", __ASSET__data_model_textures_battery_side_jpg);
		type.set ("data/model/textures/battery_side.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/blackboard2.jpg", __ASSET__data_model_textures_blackboard2_jpg);
		type.set ("data/model/textures/blackboard2.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/box.jpg", __ASSET__data_model_textures_box_jpg);
		type.set ("data/model/textures/box.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/crate_reinforced1_top.jpg", __ASSET__data_model_textures_crate_reinforced1_top_jpg);
		type.set ("data/model/textures/crate_reinforced1_top.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/defenses.jpg", __ASSET__data_model_textures_defenses_jpg);
		type.set ("data/model/textures/defenses.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/gothic_ceiling/stucco7top.jpg", __ASSET__data_model_textures_gothic_ceiling_stucco7top_jpg);
		type.set ("data/model/textures/gothic_ceiling/stucco7top.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/gothic_ceiling/woodceiling1a.jpg", __ASSET__data_model_textures_gothic_ceiling_woodceiling1a_jpg);
		type.set ("data/model/textures/gothic_ceiling/woodceiling1a.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/iron_floor3.jpg", __ASSET__data_model_textures_iron_floor3_jpg);
		type.set ("data/model/textures/iron_floor3.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/kibako.jpg", __ASSET__data_model_textures_kibako_jpg);
		type.set ("data/model/textures/kibako.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/kontena.jpg", __ASSET__data_model_textures_kontena_jpg);
		type.set ("data/model/textures/kontena.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/kontena2.jpg", __ASSET__data_model_textures_kontena2_jpg);
		type.set ("data/model/textures/kontena2.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/Lamp.jpg", __ASSET__data_model_textures_lamp_jpg);
		type.set ("data/model/textures/Lamp.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/lamp2.jpg", __ASSET__data_model_textures_lamp2_jpg);
		type.set ("data/model/textures/lamp2.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/minen_post.jpg", __ASSET__data_model_textures_minen_post_jpg);
		type.set ("data/model/textures/minen_post.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/misc_crate1e.jpg", __ASSET__data_model_textures_misc_crate1e_jpg);
		type.set ("data/model/textures/misc_crate1e.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/nor_panel2_v2.jpg", __ASSET__data_model_textures_nor_panel2_v2_jpg);
		type.set ("data/model/textures/nor_panel2_v2.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/persnl_lockerfrnt.jpg", __ASSET__data_model_textures_persnl_lockerfrnt_jpg);
		type.set ("data/model/textures/persnl_lockerfrnt.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/persnl_lockerside.jpg", __ASSET__data_model_textures_persnl_lockerside_jpg);
		type.set ("data/model/textures/persnl_lockerside.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/personel_lockertall.jpg", __ASSET__data_model_textures_personel_lockertall_jpg);
		type.set ("data/model/textures/personel_lockertall.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/raildoor.jpg", __ASSET__data_model_textures_raildoor_jpg);
		type.set ("data/model/textures/raildoor.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/rivetplate.jpg", __ASSET__data_model_textures_rivetplate_jpg);
		type.set ("data/model/textures/rivetplate.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/tiledfloor_manordark.jpg", __ASSET__data_model_textures_tiledfloor_manordark_jpg);
		type.set ("data/model/textures/tiledfloor_manordark.jpg", AssetType.IMAGE);
		
		className.set ("data/model/textures/yuka.jpg", __ASSET__data_model_textures_yuka_jpg);
		type.set ("data/model/textures/yuka.jpg", AssetType.IMAGE);
		
		className.set ("data/model/torso.xml", __ASSET__data_model_torso_xml);
		type.set ("data/model/torso.xml", AssetType.TEXT);
		
		className.set ("data/model/upper.md3", __ASSET__data_model_upper_md3);
		type.set ("data/model/upper.md3", AssetType.BINARY);
		
		className.set ("data/models/bird.h3d", __ASSET__data_models_bird_h3d);
		type.set ("data/models/bird.h3d", AssetType.BINARY);
		
		className.set ("data/models/Bird.ms3d", __ASSET__data_models_bird_ms3d);
		type.set ("data/models/Bird.ms3d", AssetType.BINARY);
		
		className.set ("data/models/Blade.jpg", __ASSET__data_models_blade_jpg);
		type.set ("data/models/Blade.jpg", AssetType.IMAGE);
		
		className.set ("data/models/Blade.md2", __ASSET__data_models_blade_md2);
		type.set ("data/models/Blade.md2", AssetType.BINARY);
		
		className.set ("data/models/bob.h3d", __ASSET__data_models_bob_h3d);
		type.set ("data/models/bob.h3d", AssetType.BINARY);
		
		className.set ("data/models/bones.h3d", __ASSET__data_models_bones_h3d);
		type.set ("data/models/bones.h3d", AssetType.BINARY);
		
		className.set ("data/models/bones2.h3d", __ASSET__data_models_bones2_h3d);
		type.set ("data/models/bones2.h3d", AssetType.BINARY);
		
		className.set ("data/models/Canyon.h3d", __ASSET__data_models_canyon_h3d);
		type.set ("data/models/Canyon.h3d", AssetType.BINARY);
		
		className.set ("data/models/Canyon.ms3d", __ASSET__data_models_canyon_ms3d);
		type.set ("data/models/Canyon.ms3d", AssetType.BINARY);
		
		className.set ("data/models/carbody.B3D", __ASSET__data_models_carbody_b3d);
		type.set ("data/models/carbody.B3D", AssetType.BINARY);
		
		className.set ("data/models/castel.b3d", __ASSET__data_models_castel_b3d);
		type.set ("data/models/castel.b3d", AssetType.BINARY);
		
		className.set ("data/models/castel.h3d", __ASSET__data_models_castel_h3d);
		type.set ("data/models/castel.h3d", AssetType.BINARY);
		
		className.set ("data/models/cube.h3d", __ASSET__data_models_cube_h3d);
		type.set ("data/models/cube.h3d", AssetType.BINARY);
		
		className.set ("data/models/cube.ms3d", __ASSET__data_models_cube_ms3d);
		type.set ("data/models/cube.ms3d", AssetType.BINARY);
		
		className.set ("data/models/dance.b3d", __ASSET__data_models_dance_b3d);
		type.set ("data/models/dance.b3d", AssetType.BINARY);
		
		className.set ("data/models/doska.b3d", __ASSET__data_models_doska_b3d);
		type.set ("data/models/doska.b3d", AssetType.BINARY);
		
		className.set ("data/models/dwarf.h3d", __ASSET__data_models_dwarf_h3d);
		type.set ("data/models/dwarf.h3d", AssetType.BINARY);
		
		className.set ("data/models/faerie.md2", __ASSET__data_models_faerie_md2);
		type.set ("data/models/faerie.md2", AssetType.BINARY);
		
		className.set ("data/models/faerie2.jpg", __ASSET__data_models_faerie2_jpg);
		type.set ("data/models/faerie2.jpg", AssetType.IMAGE);
		
		className.set ("data/models/guard1_body.png", __ASSET__data_models_guard1_body_png);
		type.set ("data/models/guard1_body.png", AssetType.IMAGE);
		
		className.set ("data/models/guard1_face.png", __ASSET__data_models_guard1_face_png);
		type.set ("data/models/guard1_face.png", AssetType.IMAGE);
		
		className.set ("data/models/guard1_helmet.png", __ASSET__data_models_guard1_helmet_png);
		type.set ("data/models/guard1_helmet.png", AssetType.IMAGE);
		
		className.set ("data/models/H1.b3d", __ASSET__data_models_h1_b3d);
		type.set ("data/models/H1.b3d", AssetType.BINARY);
		
		className.set ("data/models/H2.b3d", __ASSET__data_models_h2_b3d);
		type.set ("data/models/H2.b3d", AssetType.BINARY);
		
		className.set ("data/models/HellKnight.b3d", __ASSET__data_models_hellknight_b3d);
		type.set ("data/models/HellKnight.b3d", AssetType.BINARY);
		
		className.set ("data/models/hellknight.h3d", __ASSET__data_models_hellknight_h3d);
		type.set ("data/models/hellknight.h3d", AssetType.BINARY);
		
		className.set ("data/models/hellknight.png", __ASSET__data_models_hellknight_png);
		type.set ("data/models/hellknight.png", AssetType.IMAGE);
		
		className.set ("data/models/hellknightn.png", __ASSET__data_models_hellknightn_png);
		type.set ("data/models/hellknightn.png", AssetType.IMAGE);
		
		className.set ("data/models/hog.h3d", __ASSET__data_models_hog_h3d);
		type.set ("data/models/hog.h3d", AssetType.BINARY);
		
		className.set ("data/models/human.h3d", __ASSET__data_models_human_h3d);
		type.set ("data/models/human.h3d", AssetType.BINARY);
		
		className.set ("data/models/iron_grill.png", __ASSET__data_models_iron_grill_png);
		type.set ("data/models/iron_grill.png", AssetType.IMAGE);
		
		className.set ("data/models/lara/default.bmp", __ASSET__data_models_lara_default_bmp);
		type.set ("data/models/lara/default.bmp", AssetType.BINARY);
		
		className.set ("data/models/lara/default.png", __ASSET__data_models_lara_default_png);
		type.set ("data/models/lara/default.png", AssetType.IMAGE);
		
		className.set ("data/models/lara/default_h.bmp", __ASSET__data_models_lara_default_h_bmp);
		type.set ("data/models/lara/default_h.bmp", AssetType.BINARY);
		
		className.set ("data/models/lara/LaraCroft - ReadMe.txt", __ASSET__data_models_lara_laracroft___readme_txt);
		type.set ("data/models/lara/LaraCroft - ReadMe.txt", AssetType.TEXT);
		
		className.set ("data/models/lara/lara_animation.cfg", __ASSET__data_models_lara_lara_animation_cfg);
		type.set ("data/models/lara/lara_animation.cfg", AssetType.TEXT);
		
		className.set ("data/models/lara/lara_head.MD3", __ASSET__data_models_lara_lara_head_md3);
		type.set ("data/models/lara/lara_head.MD3", AssetType.BINARY);
		
		className.set ("data/models/lara/lara_head.skin", __ASSET__data_models_lara_lara_head_skin);
		type.set ("data/models/lara/lara_head.skin", AssetType.TEXT);
		
		className.set ("data/models/lara/lara_lower.md3", __ASSET__data_models_lara_lara_lower_md3);
		type.set ("data/models/lara/lara_lower.md3", AssetType.BINARY);
		
		className.set ("data/models/lara/lara_lower.skin", __ASSET__data_models_lara_lara_lower_skin);
		type.set ("data/models/lara/lara_lower.skin", AssetType.TEXT);
		
		className.set ("data/models/lara/lara_upper.md3", __ASSET__data_models_lara_lara_upper_md3);
		type.set ("data/models/lara/lara_upper.md3", AssetType.BINARY);
		
		className.set ("data/models/lara/lara_upper.skin", __ASSET__data_models_lara_lara_upper_skin);
		type.set ("data/models/lara/lara_upper.skin", AssetType.TEXT);
		
		className.set ("data/models/lara/railgun.bmp", __ASSET__data_models_lara_railgun_bmp);
		type.set ("data/models/lara/railgun.bmp", AssetType.BINARY);
		
		className.set ("data/models/lara/railgun.jpg", __ASSET__data_models_lara_railgun_jpg);
		type.set ("data/models/lara/railgun.jpg", AssetType.IMAGE);
		
		className.set ("data/models/lara/railgun.md3", __ASSET__data_models_lara_railgun_md3);
		type.set ("data/models/lara/railgun.md3", AssetType.BINARY);
		
		className.set ("data/models/lara/railgun.png", __ASSET__data_models_lara_railgun_png);
		type.set ("data/models/lara/railgun.png", AssetType.IMAGE);
		
		className.set ("data/models/lara/railgun.shader", __ASSET__data_models_lara_railgun_shader);
		type.set ("data/models/lara/railgun.shader", AssetType.TEXT);
		
		className.set ("data/models/lara/railgun2.bmp", __ASSET__data_models_lara_railgun2_bmp);
		type.set ("data/models/lara/railgun2.bmp", AssetType.BINARY);
		
		className.set ("data/models/lara/railgun2.md3", __ASSET__data_models_lara_railgun2_md3);
		type.set ("data/models/lara/railgun2.md3", AssetType.BINARY);
		
		className.set ("data/models/lara/railgun3.bmp", __ASSET__data_models_lara_railgun3_bmp);
		type.set ("data/models/lara/railgun3.bmp", AssetType.TEXT);
		
		className.set ("data/models/lara/railgun4.bmp", __ASSET__data_models_lara_railgun4_bmp);
		type.set ("data/models/lara/railgun4.bmp", AssetType.BINARY);
		
		className.set ("data/models/LL3.b3d", __ASSET__data_models_ll3_b3d);
		type.set ("data/models/LL3.b3d", AssetType.BINARY);
		
		className.set ("data/models/ninja.b3d", __ASSET__data_models_ninja_b3d);
		type.set ("data/models/ninja.b3d", AssetType.BINARY);
		
		className.set ("data/models/ninja.h3d", __ASSET__data_models_ninja_h3d);
		type.set ("data/models/ninja.h3d", AssetType.BINARY);
		
		className.set ("data/models/ninja.ms3d", __ASSET__data_models_ninja_ms3d);
		type.set ("data/models/ninja.ms3d", AssetType.BINARY);
		
		className.set ("data/models/ninjas.h3d", __ASSET__data_models_ninjas_h3d);
		type.set ("data/models/ninjas.h3d", AssetType.BINARY);
		
		className.set ("data/models/normals.ms3d", __ASSET__data_models_normals_ms3d);
		type.set ("data/models/normals.ms3d", AssetType.BINARY);
		
		className.set ("data/models/nskinbl.jpg", __ASSET__data_models_nskinbl_jpg);
		type.set ("data/models/nskinbl.jpg", AssetType.IMAGE);
		
		className.set ("data/models/nskingr.jpg", __ASSET__data_models_nskingr_jpg);
		type.set ("data/models/nskingr.jpg", AssetType.IMAGE);
		
		className.set ("data/models/nskinn.png", __ASSET__data_models_nskinn_png);
		type.set ("data/models/nskinn.png", AssetType.IMAGE);
		
		className.set ("data/models/nskinrd.jpg", __ASSET__data_models_nskinrd_jpg);
		type.set ("data/models/nskinrd.jpg", AssetType.IMAGE);
		
		className.set ("data/models/nskinwh.jpg", __ASSET__data_models_nskinwh_jpg);
		type.set ("data/models/nskinwh.jpg", AssetType.IMAGE);
		
		className.set ("data/models/ogre.b3d", __ASSET__data_models_ogre_b3d);
		type.set ("data/models/ogre.b3d", AssetType.BINARY);
		
		className.set ("data/models/ogre.h3d", __ASSET__data_models_ogre_h3d);
		type.set ("data/models/ogre.h3d", AssetType.BINARY);
		
		className.set ("data/models/porco.h3d", __ASSET__data_models_porco_h3d);
		type.set ("data/models/porco.h3d", AssetType.BINARY);
		
		className.set ("data/models/round_grill.png", __ASSET__data_models_round_grill_png);
		type.set ("data/models/round_grill.png", AssetType.IMAGE);
		
		className.set ("data/models/sarge/animation.cfg", __ASSET__data_models_sarge_animation_cfg);
		type.set ("data/models/sarge/animation.cfg", AssetType.TEXT);
		
		className.set ("data/models/sarge/band.jpg", __ASSET__data_models_sarge_band_jpg);
		type.set ("data/models/sarge/band.jpg", AssetType.IMAGE);
		
		className.set ("data/models/sarge/band.tga", __ASSET__data_models_sarge_band_tga);
		type.set ("data/models/sarge/band.tga", AssetType.BINARY);
		
		className.set ("data/models/sarge/cigar.jpg", __ASSET__data_models_sarge_cigar_jpg);
		type.set ("data/models/sarge/cigar.jpg", AssetType.IMAGE);
		
		className.set ("data/models/sarge/cigar.tga", __ASSET__data_models_sarge_cigar_tga);
		type.set ("data/models/sarge/cigar.tga", AssetType.BINARY);
		
		className.set ("data/models/sarge/head.md3", __ASSET__data_models_sarge_head_md3);
		type.set ("data/models/sarge/head.md3", AssetType.BINARY);
		
		className.set ("data/models/sarge/head_default.skin", __ASSET__data_models_sarge_head_default_skin);
		type.set ("data/models/sarge/head_default.skin", AssetType.TEXT);
		
		className.set ("data/models/sarge/legs.animation", __ASSET__data_models_sarge_legs_animation);
		type.set ("data/models/sarge/legs.animation", AssetType.TEXT);
		
		className.set ("data/models/sarge/legs.rar", __ASSET__data_models_sarge_legs_rar);
		type.set ("data/models/sarge/legs.rar", AssetType.BINARY);
		
		className.set ("data/models/sarge/legs.xml", __ASSET__data_models_sarge_legs_xml);
		type.set ("data/models/sarge/legs.xml", AssetType.TEXT);
		
		className.set ("data/models/sarge/lower.md3", __ASSET__data_models_sarge_lower_md3);
		type.set ("data/models/sarge/lower.md3", AssetType.BINARY);
		
		className.set ("data/models/sarge/lower_default.skin", __ASSET__data_models_sarge_lower_default_skin);
		type.set ("data/models/sarge/lower_default.skin", AssetType.TEXT);
		
		className.set ("data/models/sarge/torso.animation", __ASSET__data_models_sarge_torso_animation);
		type.set ("data/models/sarge/torso.animation", AssetType.TEXT);
		
		className.set ("data/models/sarge/torso.xml", __ASSET__data_models_sarge_torso_xml);
		type.set ("data/models/sarge/torso.xml", AssetType.TEXT);
		
		className.set ("data/models/sarge/upper.md3", __ASSET__data_models_sarge_upper_md3);
		type.set ("data/models/sarge/upper.md3", AssetType.BINARY);
		
		className.set ("data/models/sarge/upper_default.skin", __ASSET__data_models_sarge_upper_default_skin);
		type.set ("data/models/sarge/upper_default.skin", AssetType.TEXT);
		
		className.set ("data/models/sinbad.b3d", __ASSET__data_models_sinbad_b3d);
		type.set ("data/models/sinbad.b3d", AssetType.BINARY);
		
		className.set ("data/models/sinbad.h3d", __ASSET__data_models_sinbad_h3d);
		type.set ("data/models/sinbad.h3d", AssetType.BINARY);
		
		className.set ("data/models/Sinbad_big.h3d", __ASSET__data_models_sinbad_big_h3d);
		type.set ("data/models/Sinbad_big.h3d", AssetType.BINARY);
		
		className.set ("data/models/sniper.b3d", __ASSET__data_models_sniper_b3d);
		type.set ("data/models/sniper.b3d", AssetType.BINARY);
		
		className.set ("data/models/soldier.b3d", __ASSET__data_models_soldier_b3d);
		type.set ("data/models/soldier.b3d", AssetType.BINARY);
		
		className.set ("data/models/sowtex3.jpg", __ASSET__data_models_sowtex3_jpg);
		type.set ("data/models/sowtex3.jpg", AssetType.IMAGE);
		
		className.set ("data/models/t351sml.jpg", __ASSET__data_models_t351sml_jpg);
		type.set ("data/models/t351sml.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/axe.jpg", __ASSET__data_models_textures_axe_jpg);
		type.set ("data/models/textures/axe.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/b3d.jpg", __ASSET__data_models_textures_b3d_jpg);
		type.set ("data/models/textures/b3d.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Blade.jpg", __ASSET__data_models_textures_blade_jpg);
		type.set ("data/models/textures/Blade.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/dwarf.jpg", __ASSET__data_models_textures_dwarf_jpg);
		type.set ("data/models/textures/dwarf.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/dwarf2.jpg", __ASSET__data_models_textures_dwarf2_jpg);
		type.set ("data/models/textures/dwarf2.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/faerie2.jpg", __ASSET__data_models_textures_faerie2_jpg);
		type.set ("data/models/textures/faerie2.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Faerie5.jpg", __ASSET__data_models_textures_faerie5_jpg);
		type.set ("data/models/textures/Faerie5.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Floor02.jpg", __ASSET__data_models_textures_floor02_jpg);
		type.set ("data/models/textures/Floor02.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Floor04.jpg", __ASSET__data_models_textures_floor04_jpg);
		type.set ("data/models/textures/Floor04.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Floor10.jpg", __ASSET__data_models_textures_floor10_jpg);
		type.set ("data/models/textures/Floor10.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/glass.jpg", __ASSET__data_models_textures_glass_jpg);
		type.set ("data/models/textures/glass.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/guard1_body.png", __ASSET__data_models_textures_guard1_body_png);
		type.set ("data/models/textures/guard1_body.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/guard1_face.png", __ASSET__data_models_textures_guard1_face_png);
		type.set ("data/models/textures/guard1_face.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/guard1_face.psd", __ASSET__data_models_textures_guard1_face_psd);
		type.set ("data/models/textures/guard1_face.psd", AssetType.BINARY);
		
		className.set ("data/models/textures/guard1_helmet.png", __ASSET__data_models_textures_guard1_helmet_png);
		type.set ("data/models/textures/guard1_helmet.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/HellKnight_Diffuse.jpg", __ASSET__data_models_textures_hellknight_diffuse_jpg);
		type.set ("data/models/textures/HellKnight_Diffuse.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/HellKnight_Normal.jpg", __ASSET__data_models_textures_hellknight_normal_jpg);
		type.set ("data/models/textures/HellKnight_Normal.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/iron_grill.png", __ASSET__data_models_textures_iron_grill_png);
		type.set ("data/models/textures/iron_grill.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/josh.jpg", __ASSET__data_models_textures_josh_jpg);
		type.set ("data/models/textures/josh.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/LM_0014.jpg", __ASSET__data_models_textures_lm_0014_jpg);
		type.set ("data/models/textures/LM_0014.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Moss.jpg", __ASSET__data_models_textures_moss_jpg);
		type.set ("data/models/textures/Moss.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/nskinbl.jpg", __ASSET__data_models_textures_nskinbl_jpg);
		type.set ("data/models/textures/nskinbl.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/nskingr.jpg", __ASSET__data_models_textures_nskingr_jpg);
		type.set ("data/models/textures/nskingr.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/nskinrd.jpg", __ASSET__data_models_textures_nskinrd_jpg);
		type.set ("data/models/textures/nskinrd.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/nskinwh.jpg", __ASSET__data_models_textures_nskinwh_jpg);
		type.set ("data/models/textures/nskinwh.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Rock.jpg", __ASSET__data_models_textures_rock_jpg);
		type.set ("data/models/textures/Rock.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Roof03.jpg", __ASSET__data_models_textures_roof03_jpg);
		type.set ("data/models/textures/Roof03.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/round_grill.png", __ASSET__data_models_textures_round_grill_png);
		type.set ("data/models/textures/round_grill.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/sinbad_body.png", __ASSET__data_models_textures_sinbad_body_png);
		type.set ("data/models/textures/sinbad_body.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/sinbad_clothes.png", __ASSET__data_models_textures_sinbad_clothes_png);
		type.set ("data/models/textures/sinbad_clothes.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/sinbad_sword.png", __ASSET__data_models_textures_sinbad_sword_png);
		type.set ("data/models/textures/sinbad_sword.png", AssetType.IMAGE);
		
		className.set ("data/models/textures/sowtex3.jpg", __ASSET__data_models_textures_sowtex3_jpg);
		type.set ("data/models/textures/sowtex3.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/t001.jpg", __ASSET__data_models_textures_t001_jpg);
		type.set ("data/models/textures/t001.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/t003.jpg", __ASSET__data_models_textures_t003_jpg);
		type.set ("data/models/textures/t003.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/t004.jpg", __ASSET__data_models_textures_t004_jpg);
		type.set ("data/models/textures/t004.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/t008.jpg", __ASSET__data_models_textures_t008_jpg);
		type.set ("data/models/textures/t008.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Wall01.jpg", __ASSET__data_models_textures_wall01_jpg);
		type.set ("data/models/textures/Wall01.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Wall02.jpg", __ASSET__data_models_textures_wall02_jpg);
		type.set ("data/models/textures/Wall02.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/wall3.jpg", __ASSET__data_models_textures_wall3_jpg);
		type.set ("data/models/textures/wall3.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Wood01.jpg", __ASSET__data_models_textures_wood01_jpg);
		type.set ("data/models/textures/Wood01.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Wood02.jpg", __ASSET__data_models_textures_wood02_jpg);
		type.set ("data/models/textures/Wood02.jpg", AssetType.IMAGE);
		
		className.set ("data/models/textures/Zombie.jpg", __ASSET__data_models_textures_zombie_jpg);
		type.set ("data/models/textures/Zombie.jpg", AssetType.IMAGE);
		
		className.set ("data/models/Turrel.b3d", __ASSET__data_models_turrel_b3d);
		type.set ("data/models/Turrel.b3d", AssetType.BINARY);
		
		className.set ("data/models/vegeta.b3d", __ASSET__data_models_vegeta_b3d);
		type.set ("data/models/vegeta.b3d", AssetType.BINARY);
		
		className.set ("data/models/zombie.b3d", __ASSET__data_models_zombie_b3d);
		type.set ("data/models/zombie.b3d", AssetType.BINARY);
		
		className.set ("data/models/zombie.h3d", __ASSET__data_models_zombie_h3d);
		type.set ("data/models/zombie.h3d", AssetType.BINARY);
		
		className.set ("data/models/Zombie.jpg", __ASSET__data_models_zombie_jpg);
		type.set ("data/models/Zombie.jpg", AssetType.IMAGE);
		
		className.set ("data/Moss.jpg", __ASSET__data_moss_jpg);
		type.set ("data/Moss.jpg", AssetType.IMAGE);
		
		className.set ("data/point.jpg", __ASSET__data_point_jpg);
		type.set ("data/point.jpg", AssetType.IMAGE);
		
		className.set ("data/Rock.jpg", __ASSET__data_rock_jpg);
		type.set ("data/Rock.jpg", AssetType.IMAGE);
		
		className.set ("data/skybox01_nx.jpg", __ASSET__data_skybox01_nx_jpg);
		type.set ("data/skybox01_nx.jpg", AssetType.IMAGE);
		
		className.set ("data/skybox01_ny.jpg", __ASSET__data_skybox01_ny_jpg);
		type.set ("data/skybox01_ny.jpg", AssetType.IMAGE);
		
		className.set ("data/skybox01_nz.jpg", __ASSET__data_skybox01_nz_jpg);
		type.set ("data/skybox01_nz.jpg", AssetType.IMAGE);
		
		className.set ("data/skybox01_px.jpg", __ASSET__data_skybox01_px_jpg);
		type.set ("data/skybox01_px.jpg", AssetType.IMAGE);
		
		className.set ("data/skybox01_py.jpg", __ASSET__data_skybox01_py_jpg);
		type.set ("data/skybox01_py.jpg", AssetType.IMAGE);
		
		className.set ("data/skybox01_pz.jpg", __ASSET__data_skybox01_pz_jpg);
		type.set ("data/skybox01_pz.jpg", AssetType.IMAGE);
		
		className.set ("data/spark.png", __ASSET__data_spark_png);
		type.set ("data/spark.png", AssetType.IMAGE);
		
		className.set ("data/sprites.png", __ASSET__data_sprites_png);
		type.set ("data/sprites.png", AssetType.IMAGE);
		
		className.set ("data/sprites.xml", __ASSET__data_sprites_xml);
		type.set ("data/sprites.xml", AssetType.TEXT);
		
		className.set ("data/t351sml.jpg", __ASSET__data_t351sml_jpg);
		type.set ("data/t351sml.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/detail.jpg", __ASSET__data_terra_detail_jpg);
		type.set ("data/terra/detail.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/detailmap3.jpg", __ASSET__data_terra_detailmap3_jpg);
		type.set ("data/terra/detailmap3.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/detail_texture.jpg", __ASSET__data_terra_detail_texture_jpg);
		type.set ("data/terra/detail_texture.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/dirt.png", __ASSET__data_terra_dirt_png);
		type.set ("data/terra/dirt.png", AssetType.IMAGE);
		
		className.set ("data/terra/island-height-small.jpg", __ASSET__data_terra_island_height_small_jpg);
		type.set ("data/terra/island-height-small.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/island-height.jpg", __ASSET__data_terra_island_height_jpg);
		type.set ("data/terra/island-height.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/island.jpg", __ASSET__data_terra_island_jpg);
		type.set ("data/terra/island.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/noise.jpg", __ASSET__data_terra_noise_jpg);
		type.set ("data/terra/noise.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/Raid.png", __ASSET__data_terra_raid_png);
		type.set ("data/terra/Raid.png", AssetType.IMAGE);
		
		className.set ("data/terra/raidtexture.jpg", __ASSET__data_terra_raidtexture_jpg);
		type.set ("data/terra/raidtexture.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/Sand.jpg", __ASSET__data_terra_sand_jpg);
		type.set ("data/terra/Sand.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/terrain-heightmap.jpg", __ASSET__data_terra_terrain_heightmap_jpg);
		type.set ("data/terra/terrain-heightmap.jpg", AssetType.IMAGE);
		
		className.set ("data/terra/terrain-texture.jpg", __ASSET__data_terra_terrain_texture_jpg);
		type.set ("data/terra/terrain-texture.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Floor02.jpg", __ASSET__data_textures_floor02_jpg);
		type.set ("data/textures/Floor02.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Floor04.jpg", __ASSET__data_textures_floor04_jpg);
		type.set ("data/textures/Floor04.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Floor10.jpg", __ASSET__data_textures_floor10_jpg);
		type.set ("data/textures/Floor10.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Roof03.jpg", __ASSET__data_textures_roof03_jpg);
		type.set ("data/textures/Roof03.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Wall01.jpg", __ASSET__data_textures_wall01_jpg);
		type.set ("data/textures/Wall01.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Wall02.jpg", __ASSET__data_textures_wall02_jpg);
		type.set ("data/textures/Wall02.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/wall3.jpg", __ASSET__data_textures_wall3_jpg);
		type.set ("data/textures/wall3.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Wood01.jpg", __ASSET__data_textures_wood01_jpg);
		type.set ("data/textures/Wood01.jpg", AssetType.IMAGE);
		
		className.set ("data/textures/Wood02.jpg", __ASSET__data_textures_wood02_jpg);
		type.set ("data/textures/Wood02.jpg", AssetType.IMAGE);
		
		className.set ("data/trail.png", __ASSET__data_trail_png);
		type.set ("data/trail.png", AssetType.IMAGE);
		
		
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
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
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

@:keep @:bind #if display private #end class __ASSET__data_align_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_arial_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_brick_diffuse_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_color_map_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_f_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_fire_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_flares_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_flares_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__data_g_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_grass_dat extends null { }
@:keep @:bind #if display private #end class __ASSET__data_grass1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_grass2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_hire_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_light_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_lime_svg extends null { }
@:keep @:bind #if display private #end class __ASSET__data_marble_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_bird_md2 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_bird_skin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_body_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_canyon_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_gad1_bsp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_gun_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_gun_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_head_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_head_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_legs_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_level_bsp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_lower_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_moss_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_rock_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_afrik_wall1a_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_afrik_wall1b_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_battery_side_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_blackboard2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_box_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_crate_reinforced1_top_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_defenses_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_gothic_ceiling_stucco7top_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_gothic_ceiling_woodceiling1a_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_iron_floor3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_kibako_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_kontena_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_kontena2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_lamp_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_lamp2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_minen_post_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_misc_crate1e_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_nor_panel2_v2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_persnl_lockerfrnt_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_persnl_lockerside_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_personel_lockertall_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_raildoor_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_rivetplate_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_tiledfloor_manordark_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_textures_yuka_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_model_torso_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__data_model_upper_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_bird_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_bird_ms3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_blade_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_blade_md2 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_bob_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_bones_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_bones2_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_canyon_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_canyon_ms3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_carbody_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_castel_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_castel_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_cube_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_cube_ms3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_dance_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_doska_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_dwarf_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_faerie_md2 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_faerie2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_guard1_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_guard1_face_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_guard1_helmet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_h1_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_h2_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_hellknight_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_hellknight_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_hellknight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_hellknightn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_hog_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_human_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_iron_grill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_default_bmp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_default_h_bmp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_laracroft___readme_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_animation_cfg extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_head_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_head_skin extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_lower_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_lower_skin extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_upper_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_lara_upper_skin extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun_bmp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun_shader extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun2_bmp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun2_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun3_bmp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_lara_railgun4_bmp extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_ll3_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_ninja_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_ninja_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_ninja_ms3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_ninjas_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_normals_ms3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_nskinbl_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_nskingr_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_nskinn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_nskinrd_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_nskinwh_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_ogre_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_ogre_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_porco_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_round_grill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_animation_cfg extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_band_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_band_tga extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_cigar_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_cigar_tga extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_head_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_head_default_skin extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_legs_animation extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_legs_rar extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_legs_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_lower_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_lower_default_skin extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_torso_animation extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_torso_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_upper_md3 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sarge_upper_default_skin extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sinbad_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sinbad_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sinbad_big_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sniper_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_soldier_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_sowtex3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_t351sml_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_axe_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_b3d_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_blade_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_dwarf_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_dwarf2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_faerie2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_faerie5_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_floor02_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_floor04_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_floor10_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_glass_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_guard1_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_guard1_face_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_guard1_face_psd extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_guard1_helmet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_hellknight_diffuse_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_hellknight_normal_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_iron_grill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_josh_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_lm_0014_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_moss_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_nskinbl_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_nskingr_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_nskinrd_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_nskinwh_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_rock_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_roof03_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_round_grill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_sinbad_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_sinbad_clothes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_sinbad_sword_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_sowtex3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_t001_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_t003_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_t004_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_t008_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_wall01_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_wall02_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_wall3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_wood01_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_wood02_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_textures_zombie_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_models_turrel_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_vegeta_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_zombie_b3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_zombie_h3d extends null { }
@:keep @:bind #if display private #end class __ASSET__data_models_zombie_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_moss_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_point_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_rock_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_skybox01_nx_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_skybox01_ny_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_skybox01_nz_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_skybox01_px_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_skybox01_py_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_skybox01_pz_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_spark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_sprites_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_sprites_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__data_t351sml_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_detail_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_detailmap3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_detail_texture_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_dirt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_island_height_small_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_island_height_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_island_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_noise_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_raid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_raidtexture_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_sand_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_terrain_heightmap_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_terra_terrain_texture_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_floor02_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_floor04_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_floor10_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_roof03_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_wall01_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_wall02_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_wall3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_wood01_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_textures_wood02_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_trail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5








































































































































































































































#else



#if (windows || mac || linux || cpp)


@:image("assets/data/align.jpg") #if display private #end class __ASSET__data_align_jpg extends lime.graphics.Image {}
@:image("assets/data/arial.png") #if display private #end class __ASSET__data_arial_png extends lime.graphics.Image {}
@:image("assets/data/brick-diffuse.jpg") #if display private #end class __ASSET__data_brick_diffuse_jpg extends lime.graphics.Image {}
@:image("assets/data/color_map.jpg") #if display private #end class __ASSET__data_color_map_jpg extends lime.graphics.Image {}
@:image("assets/data/f.jpg") #if display private #end class __ASSET__data_f_jpg extends lime.graphics.Image {}
@:image("assets/data/Fire.png") #if display private #end class __ASSET__data_fire_png extends lime.graphics.Image {}
@:image("assets/data/flares.png") #if display private #end class __ASSET__data_flares_png extends lime.graphics.Image {}
@:file("assets/data/flares.xml") #if display private #end class __ASSET__data_flares_xml extends lime.utils.Bytes {}
@:image("assets/data/g.jpg") #if display private #end class __ASSET__data_g_jpg extends lime.graphics.Image {}
@:file("assets/data/grass.dat") #if display private #end class __ASSET__data_grass_dat extends lime.utils.Bytes {}
@:image("assets/data/grass1.png") #if display private #end class __ASSET__data_grass1_png extends lime.graphics.Image {}
@:image("assets/data/grass2.png") #if display private #end class __ASSET__data_grass2_png extends lime.graphics.Image {}
@:image("assets/data/hire.png") #if display private #end class __ASSET__data_hire_png extends lime.graphics.Image {}
@:image("assets/data/light.jpg") #if display private #end class __ASSET__data_light_jpg extends lime.graphics.Image {}
@:file("assets/data/lime.svg") #if display private #end class __ASSET__data_lime_svg extends lime.utils.Bytes {}
@:image("assets/data/marble.jpg") #if display private #end class __ASSET__data_marble_jpg extends lime.graphics.Image {}
@:file("assets/data/model/Bird.md2") #if display private #end class __ASSET__data_model_bird_md2 extends lime.utils.Bytes {}
@:image("assets/data/model/Bird_Skin.png") #if display private #end class __ASSET__data_model_bird_skin_png extends lime.graphics.Image {}
@:image("assets/data/model/body.jpg") #if display private #end class __ASSET__data_model_body_jpg extends lime.graphics.Image {}
@:file("assets/data/model/Canyon.h3d") #if display private #end class __ASSET__data_model_canyon_h3d extends lime.utils.Bytes {}
@:file("assets/data/model/gad1.bsp") #if display private #end class __ASSET__data_model_gad1_bsp extends lime.utils.Bytes {}
@:image("assets/data/model/gun.jpg") #if display private #end class __ASSET__data_model_gun_jpg extends lime.graphics.Image {}
@:file("assets/data/model/gun.md3") #if display private #end class __ASSET__data_model_gun_md3 extends lime.utils.Bytes {}
@:image("assets/data/model/head.jpg") #if display private #end class __ASSET__data_model_head_jpg extends lime.graphics.Image {}
@:file("assets/data/model/head.md3") #if display private #end class __ASSET__data_model_head_md3 extends lime.utils.Bytes {}
@:file("assets/data/model/legs.xml") #if display private #end class __ASSET__data_model_legs_xml extends lime.utils.Bytes {}
@:file("assets/data/model/Level.bsp") #if display private #end class __ASSET__data_model_level_bsp extends lime.utils.Bytes {}
@:file("assets/data/model/lower.md3") #if display private #end class __ASSET__data_model_lower_md3 extends lime.utils.Bytes {}
@:image("assets/data/model/Moss.jpg") #if display private #end class __ASSET__data_model_moss_jpg extends lime.graphics.Image {}
@:image("assets/data/model/Rock.jpg") #if display private #end class __ASSET__data_model_rock_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/afrik_wall1a.jpg") #if display private #end class __ASSET__data_model_textures_afrik_wall1a_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/afrik_wall1b.jpg") #if display private #end class __ASSET__data_model_textures_afrik_wall1b_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/battery_side.jpg") #if display private #end class __ASSET__data_model_textures_battery_side_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/blackboard2.jpg") #if display private #end class __ASSET__data_model_textures_blackboard2_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/box.jpg") #if display private #end class __ASSET__data_model_textures_box_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/crate_reinforced1_top.jpg") #if display private #end class __ASSET__data_model_textures_crate_reinforced1_top_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/defenses.jpg") #if display private #end class __ASSET__data_model_textures_defenses_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/gothic_ceiling/stucco7top.jpg") #if display private #end class __ASSET__data_model_textures_gothic_ceiling_stucco7top_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/gothic_ceiling/woodceiling1a.jpg") #if display private #end class __ASSET__data_model_textures_gothic_ceiling_woodceiling1a_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/iron_floor3.jpg") #if display private #end class __ASSET__data_model_textures_iron_floor3_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/kibako.jpg") #if display private #end class __ASSET__data_model_textures_kibako_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/kontena.jpg") #if display private #end class __ASSET__data_model_textures_kontena_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/kontena2.jpg") #if display private #end class __ASSET__data_model_textures_kontena2_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/Lamp.jpg") #if display private #end class __ASSET__data_model_textures_lamp_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/lamp2.jpg") #if display private #end class __ASSET__data_model_textures_lamp2_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/minen_post.jpg") #if display private #end class __ASSET__data_model_textures_minen_post_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/misc_crate1e.jpg") #if display private #end class __ASSET__data_model_textures_misc_crate1e_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/nor_panel2_v2.jpg") #if display private #end class __ASSET__data_model_textures_nor_panel2_v2_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/persnl_lockerfrnt.jpg") #if display private #end class __ASSET__data_model_textures_persnl_lockerfrnt_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/persnl_lockerside.jpg") #if display private #end class __ASSET__data_model_textures_persnl_lockerside_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/personel_lockertall.jpg") #if display private #end class __ASSET__data_model_textures_personel_lockertall_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/raildoor.jpg") #if display private #end class __ASSET__data_model_textures_raildoor_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/rivetplate.jpg") #if display private #end class __ASSET__data_model_textures_rivetplate_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/tiledfloor_manordark.jpg") #if display private #end class __ASSET__data_model_textures_tiledfloor_manordark_jpg extends lime.graphics.Image {}
@:image("assets/data/model/textures/yuka.jpg") #if display private #end class __ASSET__data_model_textures_yuka_jpg extends lime.graphics.Image {}
@:file("assets/data/model/torso.xml") #if display private #end class __ASSET__data_model_torso_xml extends lime.utils.Bytes {}
@:file("assets/data/model/upper.md3") #if display private #end class __ASSET__data_model_upper_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/bird.h3d") #if display private #end class __ASSET__data_models_bird_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/Bird.ms3d") #if display private #end class __ASSET__data_models_bird_ms3d extends lime.utils.Bytes {}
@:image("assets/data/models/Blade.jpg") #if display private #end class __ASSET__data_models_blade_jpg extends lime.graphics.Image {}
@:file("assets/data/models/Blade.md2") #if display private #end class __ASSET__data_models_blade_md2 extends lime.utils.Bytes {}
@:file("assets/data/models/bob.h3d") #if display private #end class __ASSET__data_models_bob_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/bones.h3d") #if display private #end class __ASSET__data_models_bones_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/bones2.h3d") #if display private #end class __ASSET__data_models_bones2_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/Canyon.h3d") #if display private #end class __ASSET__data_models_canyon_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/Canyon.ms3d") #if display private #end class __ASSET__data_models_canyon_ms3d extends lime.utils.Bytes {}
@:file("assets/data/models/carbody.B3D") #if display private #end class __ASSET__data_models_carbody_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/castel.b3d") #if display private #end class __ASSET__data_models_castel_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/castel.h3d") #if display private #end class __ASSET__data_models_castel_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/cube.h3d") #if display private #end class __ASSET__data_models_cube_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/cube.ms3d") #if display private #end class __ASSET__data_models_cube_ms3d extends lime.utils.Bytes {}
@:file("assets/data/models/dance.b3d") #if display private #end class __ASSET__data_models_dance_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/doska.b3d") #if display private #end class __ASSET__data_models_doska_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/dwarf.h3d") #if display private #end class __ASSET__data_models_dwarf_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/faerie.md2") #if display private #end class __ASSET__data_models_faerie_md2 extends lime.utils.Bytes {}
@:image("assets/data/models/faerie2.jpg") #if display private #end class __ASSET__data_models_faerie2_jpg extends lime.graphics.Image {}
@:image("assets/data/models/guard1_body.png") #if display private #end class __ASSET__data_models_guard1_body_png extends lime.graphics.Image {}
@:image("assets/data/models/guard1_face.png") #if display private #end class __ASSET__data_models_guard1_face_png extends lime.graphics.Image {}
@:image("assets/data/models/guard1_helmet.png") #if display private #end class __ASSET__data_models_guard1_helmet_png extends lime.graphics.Image {}
@:file("assets/data/models/H1.b3d") #if display private #end class __ASSET__data_models_h1_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/H2.b3d") #if display private #end class __ASSET__data_models_h2_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/HellKnight.b3d") #if display private #end class __ASSET__data_models_hellknight_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/hellknight.h3d") #if display private #end class __ASSET__data_models_hellknight_h3d extends lime.utils.Bytes {}
@:image("assets/data/models/hellknight.png") #if display private #end class __ASSET__data_models_hellknight_png extends lime.graphics.Image {}
@:image("assets/data/models/hellknightn.png") #if display private #end class __ASSET__data_models_hellknightn_png extends lime.graphics.Image {}
@:file("assets/data/models/hog.h3d") #if display private #end class __ASSET__data_models_hog_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/human.h3d") #if display private #end class __ASSET__data_models_human_h3d extends lime.utils.Bytes {}
@:image("assets/data/models/iron_grill.png") #if display private #end class __ASSET__data_models_iron_grill_png extends lime.graphics.Image {}
@:file("assets/data/models/lara/default.bmp") #if display private #end class __ASSET__data_models_lara_default_bmp extends lime.utils.Bytes {}
@:image("assets/data/models/lara/default.png") #if display private #end class __ASSET__data_models_lara_default_png extends lime.graphics.Image {}
@:file("assets/data/models/lara/default_h.bmp") #if display private #end class __ASSET__data_models_lara_default_h_bmp extends lime.utils.Bytes {}
@:file("assets/data/models/lara/LaraCroft - ReadMe.txt") #if display private #end class __ASSET__data_models_lara_laracroft___readme_txt extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_animation.cfg") #if display private #end class __ASSET__data_models_lara_lara_animation_cfg extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_head.MD3") #if display private #end class __ASSET__data_models_lara_lara_head_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_head.skin") #if display private #end class __ASSET__data_models_lara_lara_head_skin extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_lower.md3") #if display private #end class __ASSET__data_models_lara_lara_lower_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_lower.skin") #if display private #end class __ASSET__data_models_lara_lara_lower_skin extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_upper.md3") #if display private #end class __ASSET__data_models_lara_lara_upper_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/lara/lara_upper.skin") #if display private #end class __ASSET__data_models_lara_lara_upper_skin extends lime.utils.Bytes {}
@:file("assets/data/models/lara/railgun.bmp") #if display private #end class __ASSET__data_models_lara_railgun_bmp extends lime.utils.Bytes {}
@:image("assets/data/models/lara/railgun.jpg") #if display private #end class __ASSET__data_models_lara_railgun_jpg extends lime.graphics.Image {}
@:file("assets/data/models/lara/railgun.md3") #if display private #end class __ASSET__data_models_lara_railgun_md3 extends lime.utils.Bytes {}
@:image("assets/data/models/lara/railgun.png") #if display private #end class __ASSET__data_models_lara_railgun_png extends lime.graphics.Image {}
@:file("assets/data/models/lara/railgun.shader") #if display private #end class __ASSET__data_models_lara_railgun_shader extends lime.utils.Bytes {}
@:file("assets/data/models/lara/railgun2.bmp") #if display private #end class __ASSET__data_models_lara_railgun2_bmp extends lime.utils.Bytes {}
@:file("assets/data/models/lara/railgun2.md3") #if display private #end class __ASSET__data_models_lara_railgun2_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/lara/railgun3.bmp") #if display private #end class __ASSET__data_models_lara_railgun3_bmp extends lime.utils.Bytes {}
@:file("assets/data/models/lara/railgun4.bmp") #if display private #end class __ASSET__data_models_lara_railgun4_bmp extends lime.utils.Bytes {}
@:file("assets/data/models/LL3.b3d") #if display private #end class __ASSET__data_models_ll3_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/ninja.b3d") #if display private #end class __ASSET__data_models_ninja_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/ninja.h3d") #if display private #end class __ASSET__data_models_ninja_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/ninja.ms3d") #if display private #end class __ASSET__data_models_ninja_ms3d extends lime.utils.Bytes {}
@:file("assets/data/models/ninjas.h3d") #if display private #end class __ASSET__data_models_ninjas_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/normals.ms3d") #if display private #end class __ASSET__data_models_normals_ms3d extends lime.utils.Bytes {}
@:image("assets/data/models/nskinbl.jpg") #if display private #end class __ASSET__data_models_nskinbl_jpg extends lime.graphics.Image {}
@:image("assets/data/models/nskingr.jpg") #if display private #end class __ASSET__data_models_nskingr_jpg extends lime.graphics.Image {}
@:image("assets/data/models/nskinn.png") #if display private #end class __ASSET__data_models_nskinn_png extends lime.graphics.Image {}
@:image("assets/data/models/nskinrd.jpg") #if display private #end class __ASSET__data_models_nskinrd_jpg extends lime.graphics.Image {}
@:image("assets/data/models/nskinwh.jpg") #if display private #end class __ASSET__data_models_nskinwh_jpg extends lime.graphics.Image {}
@:file("assets/data/models/ogre.b3d") #if display private #end class __ASSET__data_models_ogre_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/ogre.h3d") #if display private #end class __ASSET__data_models_ogre_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/porco.h3d") #if display private #end class __ASSET__data_models_porco_h3d extends lime.utils.Bytes {}
@:image("assets/data/models/round_grill.png") #if display private #end class __ASSET__data_models_round_grill_png extends lime.graphics.Image {}
@:file("assets/data/models/sarge/animation.cfg") #if display private #end class __ASSET__data_models_sarge_animation_cfg extends lime.utils.Bytes {}
@:image("assets/data/models/sarge/band.jpg") #if display private #end class __ASSET__data_models_sarge_band_jpg extends lime.graphics.Image {}
@:file("assets/data/models/sarge/band.tga") #if display private #end class __ASSET__data_models_sarge_band_tga extends lime.utils.Bytes {}
@:image("assets/data/models/sarge/cigar.jpg") #if display private #end class __ASSET__data_models_sarge_cigar_jpg extends lime.graphics.Image {}
@:file("assets/data/models/sarge/cigar.tga") #if display private #end class __ASSET__data_models_sarge_cigar_tga extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/head.md3") #if display private #end class __ASSET__data_models_sarge_head_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/head_default.skin") #if display private #end class __ASSET__data_models_sarge_head_default_skin extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/legs.animation") #if display private #end class __ASSET__data_models_sarge_legs_animation extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/legs.rar") #if display private #end class __ASSET__data_models_sarge_legs_rar extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/legs.xml") #if display private #end class __ASSET__data_models_sarge_legs_xml extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/lower.md3") #if display private #end class __ASSET__data_models_sarge_lower_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/lower_default.skin") #if display private #end class __ASSET__data_models_sarge_lower_default_skin extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/torso.animation") #if display private #end class __ASSET__data_models_sarge_torso_animation extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/torso.xml") #if display private #end class __ASSET__data_models_sarge_torso_xml extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/upper.md3") #if display private #end class __ASSET__data_models_sarge_upper_md3 extends lime.utils.Bytes {}
@:file("assets/data/models/sarge/upper_default.skin") #if display private #end class __ASSET__data_models_sarge_upper_default_skin extends lime.utils.Bytes {}
@:file("assets/data/models/sinbad.b3d") #if display private #end class __ASSET__data_models_sinbad_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/sinbad.h3d") #if display private #end class __ASSET__data_models_sinbad_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/Sinbad_big.h3d") #if display private #end class __ASSET__data_models_sinbad_big_h3d extends lime.utils.Bytes {}
@:file("assets/data/models/sniper.b3d") #if display private #end class __ASSET__data_models_sniper_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/soldier.b3d") #if display private #end class __ASSET__data_models_soldier_b3d extends lime.utils.Bytes {}
@:image("assets/data/models/sowtex3.jpg") #if display private #end class __ASSET__data_models_sowtex3_jpg extends lime.graphics.Image {}
@:image("assets/data/models/t351sml.jpg") #if display private #end class __ASSET__data_models_t351sml_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/axe.jpg") #if display private #end class __ASSET__data_models_textures_axe_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/b3d.jpg") #if display private #end class __ASSET__data_models_textures_b3d_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Blade.jpg") #if display private #end class __ASSET__data_models_textures_blade_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/dwarf.jpg") #if display private #end class __ASSET__data_models_textures_dwarf_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/dwarf2.jpg") #if display private #end class __ASSET__data_models_textures_dwarf2_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/faerie2.jpg") #if display private #end class __ASSET__data_models_textures_faerie2_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Faerie5.jpg") #if display private #end class __ASSET__data_models_textures_faerie5_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Floor02.jpg") #if display private #end class __ASSET__data_models_textures_floor02_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Floor04.jpg") #if display private #end class __ASSET__data_models_textures_floor04_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Floor10.jpg") #if display private #end class __ASSET__data_models_textures_floor10_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/glass.jpg") #if display private #end class __ASSET__data_models_textures_glass_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/guard1_body.png") #if display private #end class __ASSET__data_models_textures_guard1_body_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/guard1_face.png") #if display private #end class __ASSET__data_models_textures_guard1_face_png extends lime.graphics.Image {}
@:file("assets/data/models/textures/guard1_face.psd") #if display private #end class __ASSET__data_models_textures_guard1_face_psd extends lime.utils.Bytes {}
@:image("assets/data/models/textures/guard1_helmet.png") #if display private #end class __ASSET__data_models_textures_guard1_helmet_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/HellKnight_Diffuse.jpg") #if display private #end class __ASSET__data_models_textures_hellknight_diffuse_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/HellKnight_Normal.jpg") #if display private #end class __ASSET__data_models_textures_hellknight_normal_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/iron_grill.png") #if display private #end class __ASSET__data_models_textures_iron_grill_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/josh.jpg") #if display private #end class __ASSET__data_models_textures_josh_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/LM_0014.jpg") #if display private #end class __ASSET__data_models_textures_lm_0014_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Moss.jpg") #if display private #end class __ASSET__data_models_textures_moss_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/nskinbl.jpg") #if display private #end class __ASSET__data_models_textures_nskinbl_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/nskingr.jpg") #if display private #end class __ASSET__data_models_textures_nskingr_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/nskinrd.jpg") #if display private #end class __ASSET__data_models_textures_nskinrd_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/nskinwh.jpg") #if display private #end class __ASSET__data_models_textures_nskinwh_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Rock.jpg") #if display private #end class __ASSET__data_models_textures_rock_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Roof03.jpg") #if display private #end class __ASSET__data_models_textures_roof03_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/round_grill.png") #if display private #end class __ASSET__data_models_textures_round_grill_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/sinbad_body.png") #if display private #end class __ASSET__data_models_textures_sinbad_body_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/sinbad_clothes.png") #if display private #end class __ASSET__data_models_textures_sinbad_clothes_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/sinbad_sword.png") #if display private #end class __ASSET__data_models_textures_sinbad_sword_png extends lime.graphics.Image {}
@:image("assets/data/models/textures/sowtex3.jpg") #if display private #end class __ASSET__data_models_textures_sowtex3_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/t001.jpg") #if display private #end class __ASSET__data_models_textures_t001_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/t003.jpg") #if display private #end class __ASSET__data_models_textures_t003_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/t004.jpg") #if display private #end class __ASSET__data_models_textures_t004_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/t008.jpg") #if display private #end class __ASSET__data_models_textures_t008_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Wall01.jpg") #if display private #end class __ASSET__data_models_textures_wall01_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Wall02.jpg") #if display private #end class __ASSET__data_models_textures_wall02_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/wall3.jpg") #if display private #end class __ASSET__data_models_textures_wall3_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Wood01.jpg") #if display private #end class __ASSET__data_models_textures_wood01_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Wood02.jpg") #if display private #end class __ASSET__data_models_textures_wood02_jpg extends lime.graphics.Image {}
@:image("assets/data/models/textures/Zombie.jpg") #if display private #end class __ASSET__data_models_textures_zombie_jpg extends lime.graphics.Image {}
@:file("assets/data/models/Turrel.b3d") #if display private #end class __ASSET__data_models_turrel_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/vegeta.b3d") #if display private #end class __ASSET__data_models_vegeta_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/zombie.b3d") #if display private #end class __ASSET__data_models_zombie_b3d extends lime.utils.Bytes {}
@:file("assets/data/models/zombie.h3d") #if display private #end class __ASSET__data_models_zombie_h3d extends lime.utils.Bytes {}
@:image("assets/data/models/Zombie.jpg") #if display private #end class __ASSET__data_models_zombie_jpg extends lime.graphics.Image {}
@:image("assets/data/Moss.jpg") #if display private #end class __ASSET__data_moss_jpg extends lime.graphics.Image {}
@:image("assets/data/point.jpg") #if display private #end class __ASSET__data_point_jpg extends lime.graphics.Image {}
@:image("assets/data/Rock.jpg") #if display private #end class __ASSET__data_rock_jpg extends lime.graphics.Image {}
@:image("assets/data/skybox01_nx.jpg") #if display private #end class __ASSET__data_skybox01_nx_jpg extends lime.graphics.Image {}
@:image("assets/data/skybox01_ny.jpg") #if display private #end class __ASSET__data_skybox01_ny_jpg extends lime.graphics.Image {}
@:image("assets/data/skybox01_nz.jpg") #if display private #end class __ASSET__data_skybox01_nz_jpg extends lime.graphics.Image {}
@:image("assets/data/skybox01_px.jpg") #if display private #end class __ASSET__data_skybox01_px_jpg extends lime.graphics.Image {}
@:image("assets/data/skybox01_py.jpg") #if display private #end class __ASSET__data_skybox01_py_jpg extends lime.graphics.Image {}
@:image("assets/data/skybox01_pz.jpg") #if display private #end class __ASSET__data_skybox01_pz_jpg extends lime.graphics.Image {}
@:image("assets/data/spark.png") #if display private #end class __ASSET__data_spark_png extends lime.graphics.Image {}
@:image("assets/data/sprites.png") #if display private #end class __ASSET__data_sprites_png extends lime.graphics.Image {}
@:file("assets/data/sprites.xml") #if display private #end class __ASSET__data_sprites_xml extends lime.utils.Bytes {}
@:image("assets/data/t351sml.jpg") #if display private #end class __ASSET__data_t351sml_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/detail.jpg") #if display private #end class __ASSET__data_terra_detail_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/detailmap3.jpg") #if display private #end class __ASSET__data_terra_detailmap3_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/detail_texture.jpg") #if display private #end class __ASSET__data_terra_detail_texture_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/dirt.png") #if display private #end class __ASSET__data_terra_dirt_png extends lime.graphics.Image {}
@:image("assets/data/terra/island-height-small.jpg") #if display private #end class __ASSET__data_terra_island_height_small_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/island-height.jpg") #if display private #end class __ASSET__data_terra_island_height_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/island.jpg") #if display private #end class __ASSET__data_terra_island_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/noise.jpg") #if display private #end class __ASSET__data_terra_noise_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/Raid.png") #if display private #end class __ASSET__data_terra_raid_png extends lime.graphics.Image {}
@:image("assets/data/terra/raidtexture.jpg") #if display private #end class __ASSET__data_terra_raidtexture_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/Sand.jpg") #if display private #end class __ASSET__data_terra_sand_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/terrain-heightmap.jpg") #if display private #end class __ASSET__data_terra_terrain_heightmap_jpg extends lime.graphics.Image {}
@:image("assets/data/terra/terrain-texture.jpg") #if display private #end class __ASSET__data_terra_terrain_texture_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Floor02.jpg") #if display private #end class __ASSET__data_textures_floor02_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Floor04.jpg") #if display private #end class __ASSET__data_textures_floor04_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Floor10.jpg") #if display private #end class __ASSET__data_textures_floor10_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Roof03.jpg") #if display private #end class __ASSET__data_textures_roof03_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Wall01.jpg") #if display private #end class __ASSET__data_textures_wall01_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Wall02.jpg") #if display private #end class __ASSET__data_textures_wall02_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/wall3.jpg") #if display private #end class __ASSET__data_textures_wall3_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Wood01.jpg") #if display private #end class __ASSET__data_textures_wood01_jpg extends lime.graphics.Image {}
@:image("assets/data/textures/Wood02.jpg") #if display private #end class __ASSET__data_textures_wood02_jpg extends lime.graphics.Image {}
@:image("assets/data/trail.png") #if display private #end class __ASSET__data_trail_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)

#end

#end