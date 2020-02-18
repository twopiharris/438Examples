// Auto-generated
let project = new Project('practice');

project.addSources('Sources');
project.addLibrary("/home/ajharris/Desktop/ArmorySDK/armory");
project.addLibrary("/home/ajharris/Desktop/ArmorySDK/iron");
project.addLibrary("/home/ajharris/Desktop/ArmorySDK/lib/haxebullet");
project.addAssets("/home/ajharris/Desktop/ArmorySDK/lib/haxebullet/ammo/ammo.wasm.js", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/lib/haxebullet/ammo/ammo.wasm.wasm", { notinlist: true });
project.addParameter('arm.node.PlayerControl');
project.addParameter("--macro keep('arm.node.PlayerControl')");
project.addParameter('armory.trait.physics.bullet.PhysicsWorld');
project.addParameter("--macro keep('armory.trait.physics.bullet.PhysicsWorld')");
project.addParameter('armory.trait.physics.bullet.RigidBody');
project.addParameter("--macro keep('armory.trait.physics.bullet.RigidBody')");
project.addShaders("build_fps/compiled/Shaders/*.glsl", { noembed: false});
project.addAssets("build_fps/compiled/Assets/**", { notinlist: true });
project.addAssets("build_fps/compiled/Shaders/*.arm", { notinlist: true });
project.addAssets("../Pew_Pew-DKnight556-1379997159 (1).wav", { notinlist: true , quality: 0.8999999761581421});
project.addAssets("../grass.jpg", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/brdf.png", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/smaa_area.png", { notinlist: true });
project.addAssets("/home/ajharris/Desktop/ArmorySDK/armory/Assets/smaa_search.png", { notinlist: true });
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
project.addDefine('arm_physics');
project.addDefine('arm_bullet');
project.addDefine('arm_noembed');
project.addDefine('arm_soundcompress');
project.addDefine('arm_skin');
project.addDefine('arm_particles');


resolve(project);
