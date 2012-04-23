package 
{	
	import visuall.ovp.PanoVideoNav;
	
	[SWF(backgroundColor="#ffffff", frameRate="60", width="1024", height="768")]
	/**
	 * Omnidirectional Video Player
	 * @author Louis Dorard (louis@dorard.me), Visu'all Interactive / Concept Immo Global
	 * 
	 */
	public class Main extends PanoVideoNav
	{
		public function Main():void {
			super("http://www.concept-immoglobal.com/wp-content/uploads/OVP-basic/paramotor.mp4", 2048, 1024);
		}
	}
}