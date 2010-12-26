package com.strangemother.projects
{
	import com.strangemother.display.clock.Clock;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Main extends MovieClip
	{
		public var clock:Clock;
		
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageEventHandler);
		}
		
		private function addedToStageEventHandler(ev:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageEventHandler);
			clock = new Clock();
			clock.addDigit(d1);
			clock.addDigit(d2);
			clock.addDigit(d3);
			clock.addDigit(d4);
			clock.addDigit(d5);
		}
	}
}