package com.strangemother.display.clock
{
	import flash.display.MovieClip;
	
	public class Digit extends MovieClip
	{
		public function Digit()
		{
			
		}
		
		override public function get height():Number
		{
			/**
			 * due to inconsistencies of the font in use,
			 * using the default height may yeild incorrect
			 * values propotionate to the Digit.
			 * Therefore compute the height via the aggregated values
			 * of the top and bottom paddle height.
			 * */
			return this.paddleTop.height + this.paddleBottom.height;
			
		}
		
		override public function get width():Number
		{
			/**
			 * return the width of the largest paddle.
			 * */
			if(this.paddleTop.width > this.paddleBottom.width)
				return this.paddleTop.width;
			
			return this.paddleBottom.width;
		}
		
		public function set value(val:String):void
		{
			this.character.digit.text = val;
		}
		
		/**
		 * the the visible character value on the 
		 * front of the flip clock
		 * */
		public function get value():String
		{
			return this.character.digit.text;
		}
		
		public function kill():void
		{
			
		}
	}
}