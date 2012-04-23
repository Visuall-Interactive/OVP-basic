package visuall.ovp
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * Visual component used to display debug information related to the navigation of the pano video: field of view, pan/tilt angles. 
	 * @author Louis Dorard (louis@dorard.me), Visu'all Interactive / Concept Immo Global
	 * 
	 */
	public class DebugPanel extends Sprite
	{
		private var pSphere:PanoSphere;
		private var fov:TextField;
		public function DebugPanel(pSphere:PanoSphere)
		{
			super();
			this.pSphere = pSphere;
			this.graphics.beginFill(0xffffff);
			this.graphics.drawRect(5, 100, 125, 50);
			this.graphics.endFill();
			var txtFormat:TextFormat = new TextFormat("_sans", 10);
			
			var label:TextField = new TextField();
			label.x = 10;
			label.y = 105;
			label.defaultTextFormat = txtFormat;
			label.text = "Field of view:";
			this.addChild(label);
			
			fov = new TextField;
			fov.x = 10;
			fov.y = 120;
			fov.defaultTextFormat = txtFormat;
			fov.text = pSphere.lens.fieldOfView.toString();
			this.addChild(fov);
		}
		
		public function update():void
		{
			fov.text = pSphere.lens.fieldOfView.toString();
		}
	}
}