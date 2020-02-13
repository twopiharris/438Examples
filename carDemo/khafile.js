// Auto-generated
let project = new Project('carDemo');

project.addSources('Sources');
project.addLibrary("E:/ArmorySDK/armory");
project.addLibrary("E:/ArmorySDK/iron");
project.addLibrary("E:/ArmorySDK/lib/haxebullet");
project.addAssets("E:/ArmorySDK/lib/haxebullet/ammo/ammo.wasm.js", { notinlist: true });
project.addAssets("E:/ArmorySDK/lib/haxebullet/ammo/ammo.wasm.wasm", { notinlist: true });
project.addParameter('armory.trait.physics.bullet.PhysicsWorld');
project.addParameter("--macro keep('armory.trait.physics.bullet.PhysicsWorld')");
project.addParameter('arm.node.CarCtrl');
project.addParameter("--macro keep('arm.node.CarCtrl')");
project.addParameter('armory.trait.physics.bullet.RigidBody');
project.addParameter("--macro keep('armory.trait.physics.bullet.RigidBody')");
project.addShaders("build_carDemo/compiled/Shaders/*.glsl", { noembed: false});
project.addShaders("build_carDemo/compiled/Hlsl/*.glsl", { noprocessing: true, noembed: false });
project.addAssets("build_carDemo/compiled/Assets/**", { notinlist: true });
project.addAssets("build_carDemo/compiled/Shaders/*.arm", { notinlist: true });
project.addAssets("E:/ArmorySDK/armory/Assets/brdf.png", { notinlist: true });
project.addAssets("E:/ArmorySDK/armory/Assets/smaa_area.png", { notinlist: true });
project.addAssets("E:/ArmorySDK/armory/Assets/smaa_search.png", { notinlist: true });
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
