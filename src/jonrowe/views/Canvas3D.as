package jonrowe.views
{
	import away3d.containers.View3D;
	import away3d.debug.AwayStats;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	/**
	 * Canvas3D is a component to create and display a 3D scene with Away3D 4.0.0 beta. It essentially consists of a View3D and methods that operate on it. 
	 * This class implements methods that are required for inclusion within a UIComponent in Flex mobile projects (see jonrowe.views.UIComponent3D).
	 * Canvas3D is not meant to be instantiated (otherwise we will have a blank scene).
	 * 
	 * @author Louis Dorard (louis@dorard.me), inspired by Jon Rowe (http://artpluscode.com/blog/?p=128) 
	 * 
	 */	
	
	public class Canvas3D extends Sprite
	{
		public static const SCENE_READY:String = 'scene_ready';

		private var _view3D:View3D;
		
		/**
		 * Constructor: wait for addedToStage event before doing anything.
		 * 
		 */		
		public function Canvas3D(...args)
		{
			_view3D = initView(args);
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * Called when this canvas3D instance has been added to stage.
		 * @param e
		 * 
		 */		
		private function onAddedToStage(e:Event):void
		{
			this.addChild(_view3D);
			start();
			dispatchEvent( new Event(SCENE_READY));
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * Start listening for enterframe events 
		 * 
		 */		
		public function start():void // TODO: private?
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			//need to call render here otherwise enterFrame events don't happen?!
			_view3D.render();
			initEventListeners();
			CONFIG::DEBUG
			{
				initDebug();
			}
		}
		
		/**
		 * Creates the view that will be added as this class' View3D instance. Should be overriden for each new 3D application. 
		 * @param args
		 * @return 
		 * 
		 */
		protected function initView(...args):View3D 
		{
			var v:View3D = new View3D();
			return v;
		}
		
		/**
		 * Display debug information. We usually want to show the Away3D stats. 
		 * 
		 */
		protected function initDebug():void
		{
			//the stats
			var stats:AwayStats = new AwayStats(_view3D);
			addChild(stats);
		}
		
		/**
		 * Render loop called every frame. 
		 * @param ev
		 * 
		 */		
		protected function onEnterFrame(e:Event):void
		{
			_view3D.render();
		} 
		
		/**
		 * Initialises any event listeners other than entering a frame. 
		 * 
		 */
		protected function initEventListeners():void
		{
			
		}
		
		/**
		 * Returns the View3D instance. 
		 * @return 
		 * 
		 */		
		public function get view3D():View3D
		{
			return _view3D;
		}
		
		/**
		 * Resize the View3D instance.
		 * @param w (width)
		 * @param h (heigh)
		 * 
		 */		
		public function setSize(w:int, h:int):void
		{
			if (_view3D==null) return;
			_view3D.width = w;
			_view3D.height = h;
		}
	}
}