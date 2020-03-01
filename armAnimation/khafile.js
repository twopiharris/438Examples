// Auto-generated
let project = new Project('armAnimation');

project.addSources('Sources');
project.addLibrary("/home/ajharris/Desktop/ArmorySDK/armory");
project.addLibrary("/home/ajharris/Desktop/ArmorySDK/iron");
project.addParameter('arm.node.Waveandrun');
project.addParameter("--macro keep('arm.node.Waveandrun')");
project.addParameter('armory.trait.internal.Bridge');
project.addParameter("--macro keep('armory.trait.internal.Bridge')");
project.addParameter('armory.trait.internal.DebugConsole');
project.addParameter("--macro keep('armory.trait.internal.DebugConsole')");
project.addShaders("build_armAnimation/compiled/Shaders/*.glsl", { noembed: false});
project.addAssets("build_armAnimation/compiled/Assets/**", { notinlist: true });
project.addAssets("build_armAnimation/compiled/Shaders/*.arm", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/brdf.png", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/smaa_area.png", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/smaa_search.png", { notinlist: true });
project.addShaders("/home/ajharris/Desktop/ArmorySDK/armory/Shaders/debug_draw/**");
project.addParameter('--times');
project.addLibrary("/home/ajharris/Desktop/ArmorySDK/lib/zui");
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/font_default.ttf", { notinlist: false });
project.addDefine('arm_deferred');
project.addDefine('arm_csm');
project.addDefine('rp_hdr');
project.addDefine('rp_renderer=Deferred');
project.addDefine('rp_shadowmap');
project.addDefine('rp_shadowmap_cascade=1024');
project.addDefine('rp_shadowmap_cube=512');
project.addDefine('rp_background=World');
project.addDefine('rp_render_to_texture');
project.addDefine('rp_compositornodes');
project.addDefine('rp_antialiasing=SMAA');
project.addDefine('rp_supersampling=1');
project.addDefine('rp_ssgi=SSAO');
project.addDefine('arm_audio');
project.addDefine('arm_soundcompress');
project.addDefine('arm_debug');
project.addDefine('arm_ui');
project.addDefine('arm_skin');
project.addDefine('arm_particles');


resolve(project);
