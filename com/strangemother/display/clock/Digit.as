package com.strangemother.display.clock
{
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import flash.display.MovieClip;
	import flash.utils.describeType;
	
	public class Digit extends MovieClip
	{
		private var replicatedTopPaddle:MovieClip;
		private var replicatedBottomPaddle:MovieClip;
		private var replicatedCharacter:Character;
		private var backPaddleTop:Paddle;
		private var backPaddleBottom:Paddle;
		
		private var animationSpeedStart:Number = .45;
		private var animationSpeedEnd:Number = .3;
		
		private var _value:String = '';
		
		public function Digit()
		{
		
		}
		
		private function topAnimation():void
		{
			topPaddleB.character.digit.text = _value;
			
			TweenMax.to(topPaddle, animationSpeedStart, {scaleY: 0,ease:Expo.easeIn, onComplete: function(){
				topPaddle.character.digit.text = _value;
				topPaddle.scaleY = 1;
				nextAnimationStage()
			}});
		}
		
		private function nextAnimationStage():void
		{
			bottomPaddle.scaleY = 0;
			bottomPaddle.character.digit.text = _value;
			TweenMax.to(bottomPaddle, animationSpeedEnd, {scaleY: 1, ease:Expo.easeOut, onComplete: function(){
				bottomPaddleB.character.digit.text = _value;
			}});
		}
		
		private function replicate(sourceMovieClip:MovieClip, movieClip:MovieClip):MovieClip
		{
			var def:XML = describeType(sourceMovieClip);
			var properties:XMLList = def..variable.@name + def..accessor.@name;
			
			for each(var property:String in properties ) 
			{
				try
				{
					movieClip[property] = sourceMovieClip[property];
				}
				catch(e:Error)
				{}
			}
			
			def = null;
			
			return movieClip;
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
			var oldValue:String = _value
			_value = val;
			
			if(_value != oldValue)
				topAnimation();
		}
		
		/**
		 * the the visible character value on the 
		 * front of the flip clock
		 * */
		public function get value():String
		{
			return _value;
		}
		
		public function calculateClickSpeed(delay:Number = 1000)
		{
			animationSpeedStart = (delay * .45) * .001;  
			animationSpeedEnd = (delay * .35) * .001;
			
			//trace(animationSpeedStart + " " + animationSpeedEnd);
		}
		
		public function kill():void
		{
			
		}
	}
}