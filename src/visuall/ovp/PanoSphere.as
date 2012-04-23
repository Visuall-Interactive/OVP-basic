package visuall.ovp
{
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.materials.utils.IVideoPlayer;
	import away3d.primitives.SphereGeometry;
	import away3d.textures.VideoTexture;

	/**
	 * PanoSphere is able to show omnidirectional videos by texturing a sphere with an equirectangular video and placing a camera at its centre, owing to a 3D engine (here we use Away3D 4.0.0 beta).
	 * It is to be used in conjunction with PanoVideoNav for allowing the user to navigate in the panorama.
	 * 
	 * References that helped when coding this:
	 * - http://www.adobe.com/devnet/flashplayer/articles/creating-games-away3d.html
	 * - tutorials on http://www.allforthecode.co.uk/aftc/forum/user/modules/forum/welcome.php?index=4
	 * - tutorials on http://www.flashmagazine.com/Tutorials/category/away3d/
	 * - http://www.jasonsturges.com/2012/03/3d-skybox-primitive-using-away3d-4-and-stage3d/
	 * - http://blog.nvalois.com/away3d-panorama-360°-les-differentes-solutions/
	 * Note that some of these references concern Away3D 3.6.
	 * 
	 * @author Louis Dorard (louis@dorard.me), Visu'all Interactive / Concept Immo Global
	 * 
	 */
	public class PanoSphere
	{
		// Away config: constants
		private var antiAlias:Number = 2;
		private var sphereRadius:int = 1500;
		private var sphereSegmentsW:int = 30; // seems to be a good trade-off between distortion and performance
		private var sphereSegmentsH:int = 30;
				
		// class variables that need to be used by PanoVideoNav's event handlers
		internal var view:View3D;
		internal var cameraController:HoverController;
		internal var lens:PerspectiveLens = new PerspectiveLens();
		internal var player:IVideoPlayer;
		
		/**
		 * Initialises the panosphere setting (3D view, camera, texture material, sphere) and adds event listeners to handle user interactions. 
		 * @param assetPath: path to asset used for texturing the sphere
		 */
		public function PanoSphere(assetPath:String, assetWidth:int, assetHeight:int)
		{
			initView();
			initCamera();
			
			var texture:VideoTexture = new VideoTexture(assetPath, assetWidth, assetHeight, false, true);
			var mat:TextureMaterial = new TextureMaterial(texture);
			player = texture.player;
			mat.smooth = true;
			initSphere(mat);
		}
		
		/**
		 * Creates (and adds to the scene) a sphere that is textured in the inside with the material specified in parameter.  
		 * @param mat
		 * 
		 */
		private function initSphere(mat:TextureMaterial):void
		{
			var sphereGeometry:SphereGeometry = new SphereGeometry(sphereRadius, sphereSegmentsW, sphereSegmentsH);
			var sphere:Mesh = new Mesh(sphereGeometry, mat); // the default position of the centre of the sphere is at the centre of the 3D environment, which is where our camera is 
			sphere.scaleX = -1; // texture the inside of the sphere
			view.scene.addChild(sphere);
		}
		
		private function initView():void
		{
			view = new View3D(); // in the following we'll be working with the default scene created here
			view.antiAlias = antiAlias;
		}
		
		private function initCamera():void
		{
			// setup a camera that uses our lens
			var camera:Camera3D = new Camera3D(lens);
			view.camera = camera;
			
			// setup a HoverController (aka HoverCamera3D in older versions of Away3D) to control this camera
			cameraController = new HoverController(view.camera);
			
			// set pan and tilt angles (by default we'd be looking at our feet)
			cameraController.panAngle = 0;
			cameraController.tiltAngle = 0;
			
			// loopings are not allowed!
			cameraController.minTiltAngle = -90;
			
			// we want to be at the centre of the 3D environment
			// when not using a camera controller we would do view.camera.position = new Vector3D(0,0,0);
			// here we need to set the distance property of the camera controller; strangely a value of 0 does not work...
			cameraController.distance = 1;
		}
		
	}
}