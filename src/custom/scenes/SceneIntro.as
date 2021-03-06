package custom.scenes
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import custom.SceneController;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class SceneIntro extends Sprite
	{
		[Embed(source="../../assets/audio/music/jazz fast.mp3")]
		private var Music:Class;
		
		private var sceneController:SceneController;
		
		private var music:Sound;
		private var channel:SoundChannel;
		private var transform:SoundTransform;
		
		public function SceneIntro(sceneController:SceneController)
		{
			super();
			
			this.sceneController = sceneController;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			music = new Music();
			channel = music.play(0, 99999);
			transform = new SoundTransform(1, 0);
			
			animate();
		}
		
		private function animate():void
		{
//			//noise!
//			//splashSound.play();
//			
//			//container
//			var logo:Sprite = new Sprite();
//			logo.x = Main.stageWidth/2;
//			logo.y = Main.stageHeight/2 - 19; // weird offset shit
//			addChild(logo);
//			
//			//contents of container
//			var image:Quad = new Quad(256, 256, 0xff0000);
//			image.x = -image.width/2;
//			image.y = -image.height/2;
//			logo.addChild(image);
//			
//			var text:TextField = new TextField(image.width, image.height, "FUCK YEAH", "Times New Roman", 28, 0xFFFFFF, true);
//			text.x = -text.width/2;
//			text.y = -text.height/2
//			logo.addChild(text);
//			
//			//animation
//			var timeline:TimelineLite = new TimelineLite();
//			timeline.append(TweenLite.from(logo, 1, {scaleX:0, scaleY:0, rotation:6}));
//			timeline.append(TweenLite.to(logo, .3, {scaleX:.7, scaleY:1.2}), 1);
//			timeline.append(TweenLite.to(logo, .2, {scaleX:2, scaleY:0}));
//			
//			sceneController.nav(this, sceneController.START, timeline.duration());
		}
		
		private function stopSound():void
		{
			channel.stop();
		}
		
		private function updateTrans():void
		{
			channel.soundTransform = transform;
		}
	}
}