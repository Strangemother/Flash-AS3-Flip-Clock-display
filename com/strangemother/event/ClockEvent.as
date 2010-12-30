package com.strangemother.event
{
	import com.greensock.easing.Strong;
	
	import flash.events.Event;
	
	public class ClockEvent extends Event
	{
		public static const TICK:String = 'tick';
		
		public function ClockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var event:ClockEvent = new ClockEvent(type, bubbles, cancelable);
			return event;
		}
	}
}