package com.strangemother.display.clock
{
	import com.gskinner.utils.StringUtils;
	import com.strangemother.event.ClockEvent;
	
	import flash.display.MovieClip;
	import flash.errors.MemoryError;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Clock extends MovieClip
	{
		private var _digits:Array = [];
		private var _value:String = '';
		private var _delay:Number = 1000;
		
		private var internalTimer:Timer;
		
		public static const NUMERIC_SWITCH:String = 'numericSwitch';
		public static const NUMERIC_RANGE:String = 'numericRange';
		
		/**
		 * Construct - you may pass in as many stage 
		 * instances of Digit as you please
		 * */
		public function Clock(...digits)
		{
			if(digits.length > 0)
				this.addDigits(digits);
			
			internalTimer = new Timer(this.delay);
			internalTimer.addEventListener(TimerEvent.TIMER, interTimerTimerEventHandler)
		}
		
		/**
		 * pass in many instances of on stage Digit
		 * */
		public function addDigits(...digits):void
		{
			if(digits is Array)
				digits = digits[0];
			
			for each(var digit:* in digits)
			{
				this.addDigit(digit as MovieClip);
			}
		}
		
		/**
		 * pass a movieclip into the digits list.
		 * Passing a position will determine where within the
		 * numerical sequence you would like the Digit to be 
		 * applied.
		 * To pass multiple digits into the array, you can use the
		 * alternative Clock.addDigits(...)
		 * */
		public function addDigit(digit:MovieClip, position:int = int.MAX_VALUE):uint
		{
			digit.value = '0';
			return this.digits.push(digit)
		}
		
		/**
		 * Remove a digit from the digits list. 
		 * The numbers will resequence to compensate for the
		 * missing digit. If you pass false, this numerical Position will
		 * be skipped.
		 * */
		public function removeDigit(value:MovieClip, resequence:Boolean = true):void
		{
			this.removeChild(value);
			value.kill();
			
		}
	
		/**
		 * Setting a string value to the digits.
		 * will apply on character at a time to the digits.
		 * Starting from the right and working left - repectively 
		 * mapped to the digits.
		 * For example. With a value of '35948' and four digits - starting 
		 * from the left, the digits would read '5948'
		 * */
		public function set value(val:String):void
		{			
			_value = val;
			this.digits.forEach(digitForEachCallCallback);	
		}
		
		public function get value():String
		{
			return _value;
		}
		
		
		/**
		 * this is an internal function not to be used.
		 * */
		private function digitForEachCallCallback(item:*, index:int, array:Array):void
		{
			var stringArray = String(StringUtils.padLeft(this.value, '0', this.digits.length)).split('');
		//	trace("Callback = " + item + ', index ' + index + ", stringArray " + stringArray);
			item.calculateClickSpeed(this.delay);
			item.value = stringArray[index].toString();
		}
		
		/**
		 * Event handler for the internalTimer TICK event.
		 * */
		private function interTimerTimerEventHandler(ev:TimerEvent):void
		{
			this.dispatchEvent(ev);
			this.dispatchClockEvent(ClockEvent.TICK);
			this.value = String(internalTimer.currentCount);
		}
		
		/**
		 * An internal function for dipatching ClockEvent's
		 * */
		private function dispatchClockEvent(type):void
		{
			var event:ClockEvent = new ClockEvent(type);
			this.dispatchEvent(event);
		}
		
		/**
		 * start the internal timer.
		 * */
		public function start():void
		{
			internalTimer.start();
			
		}
		
		/**
		 *  stop the internal timer.
		 * */
		override public function stop():void
		{
			internalTimer.stop();
		}
		
		/**
		 * Get the currentCount of the internal timer.
		 * */
		public function get currentCount():int
		{
			return internalTimer.currentCount;
		}
		
		/**
		 * This function sets the delay for the internalTimer
		 * and assits in timing speeds for the flip animation.
		 * If you are not using the internal timer, this value should
		 * always match the value of the timer used - this will ensure
		 * the flip animation works correctly.
		 * */
		public function set delay(value:Number):void
		{
			internalTimer.delay = value;
			_delay = value;
		}
		
		public function get delay():Number
		{
			return _delay;
		}
		
		/**
		 * tap into the array storing the instances of on stage
		 * digits.
		 * */
		public function set digits(value:Array):void
		{
			_digits = value;
		}
		
		public function get digits():Array
		{
			return _digits;
		}
		
		
	}
}