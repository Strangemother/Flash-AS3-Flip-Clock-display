package com.strangemother.projects
{
	import com.strangemother.display.clock.Clock;
	import com.strangemother.event.ClockEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Main extends MovieClip
	{
		public var clock:Clock;
		public var timer:Timer;
		
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageEventHandler);
		}
		
		private function addedToStageEventHandler(ev:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageEventHandler);
			
			clock = new Clock(d1, d2, d3, d4);
			clock.start();
		}
		
	}
}