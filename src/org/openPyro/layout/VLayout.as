package org.openPyro.layout{
	import flash.display.DisplayObject;
	
	import org.openPyro.controls.listClasses.ListBase;
	import org.openPyro.core.MeasurableControl;
	import org.openPyro.core.UIContainer;
/*	import org.openPyro.effects.EffectDescriptor;
	import org.openPyro.effects.PyroEffect;*/

	public class VLayout implements ILayout, IContainerMeasurementHelper{
		
		private var _vGap:Number = 0;
		
		public function VLayout(vGap:Number=0){
			_vGap = vGap;
		}
		
		protected var _container:UIContainer;
		public function set container(container:UIContainer):void
		{
			_container = container;
		}
		
		protected var _initY:Number = 0;
		protected var _initX:Number = 0;
		
		public function set initX(n:Number):void
		{
			_initX = n;	
		}
		
		public function set initY(n:Number):void
		{
			_initY = n;
		}
		
		public function getMaxWidth(children:Array):Number
		{
			var maxW:Number=0;
			for(var i:uint=0; i<children.length; i++)
			{
				if(DisplayObject(children[i]).width > maxW)
				{
					maxW = DisplayObject(children[i]).width
				}
			}
			return maxW;			
		}
		
		
		public function getMaxHeight(children:Array):Number
		{
			var nowY:Number=_initY;
			for(var i:uint=0; i<children.length; i++){
				var c:DisplayObject = children[i] as DisplayObject;
				nowY+=c.height;
				nowY+=this._vGap
			}
			return nowY-_vGap;
		}
		
		public var animationDuration:Number = 0;
		
		public function layout(children:Array):void{
			var nowY:Number=_initY;
			for(var i:uint=0; i<children.length; i++){
				var c:DisplayObject = children[i] as DisplayObject;
				c.x = _initX;
				c.y = nowY;
				nowY+=c.height;
				nowY+=this._vGap;
			}
		}
		
		/**		
		*Find all the children with explicitWidth/ explicit Height set
		*This part depends on the layout since HLayout will start trimming
		*the objects available h space, and v layout will do the same 
		*for vertically available space
		**/
		
		public function calculateSizes(children:Array,container:UIContainer):void
		{
			for(var i:int = 0; i<children.length; i++)
			{
				initY = container.padding.top;
			
				if(i>0){
					container.explicitlyAllocatedHeight+=_vGap;
				}
				
				if(children[i] is MeasurableControl)				
				{
					var sizeableChild:MeasurableControl = MeasurableControl(children[i]);
					if(isNaN(sizeableChild.percentUnusedHeight) && isNaN(sizeableChild.percentHeight))
					{
					container.explicitlyAllocatedHeight+=sizeableChild.height;	
					}
				}

			}
		}
	}
}