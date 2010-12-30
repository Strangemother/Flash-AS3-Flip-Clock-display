package com.strangemother.display.clock
{
	import com.gskinner.utils.StringUtils;
	
	import flash.display.MovieClip;
	import flash.errors.MemoryError;
	
	import flashx.textLayout.elements.InlineGraphicElement;
	
	public class Clock extends MovieClip
	{
		private var _digits:Array = [];
		private var _value:String = '';
		private var _delay:Number = 1000;
		
		public function Clock()
		{
			super();
		}
		
		/**
		 * pass a movieclip into the digits list.
		 * Passing a position will determine where within the
		 * numerical sequence you would like the Digit to be 
		 * applied.
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
		
		private function digitForEachCallCallback(item:*, index:int, array:Array):void
		{
			var stringArray = String(StringUtils.padLeft(this.value, '0', this.digits.length)).split('');
		//	trace("Callback = " + item + ', index ' + index + ", stringArray " + stringArray);
			item.calculateClickSpeed(this.delay);
			item.value = stringArray[index].toString();
		}
		
		public function get value():String
		{
			return _value;
		}
		
		public function set delay(value:Number):void
		{
			_delay = value;
		}
		
		public function get delay():Number
		{
			return _delay;
		}
		
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