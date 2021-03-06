package org.openPyro.utils{
	
	/**
	 * A collection of Utility methods for Mathematical operations
	 */
	public class MathUtil
	{
		/**
		 * Inserts a comma after every 3rd character when counted from reverse
		 * 
		 * useage: getCommaSeparatedString(12345) returns 12,345
		 */  
		public static function getCommaSeparatedString(n:Number):String{
			var numString:String = String(n);
			var returnString:Array = new Array();
			for(var i:Number=numString.length-1, count:Number=1; i>=0; i--, count++){
				returnString.push(numString.charAt(i));
				if(count%3==0 && i != 0){
					returnString.push(",");
				}
			}
			returnString.reverse();
			return returnString.join('');
		}
		
		/**
		 * @param	deg		The degree value whose radian equivalent is required
		 * @return 			The radian equivalent of the input parameter
		 */ 
		public static function degreeToRadians(deg:Number):Number{
			return Math.PI*deg/180;
		}
		
		public static function radiansToDegrees(rad:Number):Number{
			return 180*rad/Math.PI;
		}
		
		public static function randRange(start:Number, end:Number) : Number{
			return Math.floor(start +(Math.random() * (end - start)));
		}
	}
}