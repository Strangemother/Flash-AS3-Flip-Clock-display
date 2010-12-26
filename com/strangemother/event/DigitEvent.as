package com.strangemother.event
{
	import com.strangemother.display.clock.Digit;
	
	import flash.events.Event;
	
	public class DigitEvent extends Event
	{
		
		public static const DIGIT_ADDED:String = 'digitAdded';
		public static const DIGIT_REMOVED:String = 'digitRemoved';
		public static const TICK:String = 'tick';
		
		public function DigitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var event:DigitEvent = new DigitEvent(type, bubbles,cancelable);
			return event;
		}
	}
}