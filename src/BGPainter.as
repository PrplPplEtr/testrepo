package  
{
	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.InterpolationMethod;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class BGPainter 
	{
		
		public function BGPainter() 
		{
			
		}
		
		public static function drawGradientBackground(canvas:Graphics, width:Number, height:Number):void 
		{
			var type:String = GradientType.LINEAR; 
			var colors:Array = [0xe4e4b2, 0xffffff]; 
			var alphas:Array = [1, 1]; 
			var ratios:Array = [0, 255]; 
			var spreadMethod:String = SpreadMethod.PAD; 
			var interp:String = InterpolationMethod.LINEAR_RGB; 
			var focalPtRatio:Number = 0; 
			
			var matrix:Matrix = new Matrix(); 
			var boxWidth:Number = width; 
			var boxHeight:Number = height; 
			var boxRotation:Number = Math.PI/2; // 90° 
			var tx:Number = 0; 
			var ty:Number = 0; 
			matrix.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty); 
			
			//canvas.beginFill( 0xe6e6e6 ) ; // red
			canvas.beginGradientFill(type, colors, alphas, ratios, matrix,spreadMethod,interp,focalPtRatio);
			canvas.lineStyle(1, 0x000000, 1, true, LineScaleMode.NORMAL, CapsStyle.SQUARE, JointStyle.MITER);
			canvas.drawRect(0, 0, width, height);
			canvas.endFill();
		}
		
	}

}