package com.strangemother.display.clock
{
	import flash.display.MovieClip;
	
	import flashx.textLayout.elements.InlineGraphicElement;
	
	public class Clock extends MovieClip
	{
		private var _digits:Array = [];
		
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