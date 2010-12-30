package com.strangemother.projects
{
	import com.strangemother.display.clock.Clock;
	
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
			clock = new Clock();
			clock.addDigit(d1);
			clock.addDigit(d2);
			clock.addDigit(d3);
			clock.addDigit(d4);
			
			timer = new Timer(200);
			timer.addEventListener(TimerEvent.TIMER, timerTimerEventHandler);
			timer.start();
			clock.delay = timer.delay;
		}
		
		private function timerTimerEventHandler(ev:TimerEvent):void
		{
			clock.value = timer.currentCount.toString();
			
		}
												
	}
}