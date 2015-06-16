package me.rainui.managers
{
	import adobe.utils.CustomActions;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import me.rainssong.math.ArrayCore;
	import me.rainssong.utils.Draw;
	import me.rainui.components.Button;
	import me.rainui.events.RainUIEvent;
	import me.rainui.RainTheme;
	import me.rainui.RainUI;
	
	/**
	 * ...
	 * @author Rainssong
	 */
	public class ToggleGroup extends EventDispatcher
	{
		//public var btnSkinClass:Class = Button;
		protected var _btnVec:Vector.<Button> = new Vector.<Button>();
		//private var _index:int = -1;
		protected var _max:int = 3;
		protected var _min:int = 0;
		
		public function ToggleGroup()
		{
			super();
		}
		
		public function get btnVec():Vector.<Button>
		{
			return _btnVec;
		}
		
		public function set btnVec(value:Vector.<Button>):void
		{
			//_btnVec = value;
			while (btnVec.length) 
			{
				removeButtonAt(0);
			}
			btnVec.length = 0;
			for (var i:int = 0; i < value.length; i++)
			{
				addButton(value[i]);
			}
		}
		
		public function addButton(button:Button):void
		{
			if (_btnVec.indexOf(button) == -1)
			{
				_btnVec.push(button);
				button.addEventListener(RainUIEvent.CHANGE, onChange);
				button.addEventListener(RainUIEvent.SELECT, onSelect);
			}
		}
		
		public function removeButton(button:Button):void
		{
			if (_btnVec.indexOf(button) > -1)
			{
				_btnVec.splice(_btnVec.indexOf(button), 1);
				button.removeEventListener(RainUIEvent.CHANGE, onChange);
				button.removeEventListener(RainUIEvent.SELECT, onSelect);
			}
		}
		
		public function removeButtonAt(i:int=0):void
		{
			if (_btnVec.length > i)
			{
				_btnVec.splice(i, 1);
				_btnVec[i].removeEventListener(RainUIEvent.CHANGE, onChange);
			}
		}
		
		//public function get index():int
		//{
			//return _index;
		//}
		//
		//public function set index(value:int):void
		//{
			//
			//if (_index == value)
			//{
				//return;
			//}
			//else
			//{
				//_index = value;
				//for (var i:int = 0; i < _btnVec.length; i++)
				//{
					//var btn:Button = _btnVec[i];
					//if (i == _index)
						//btn.selected = true;
					//else
						//btn.selected = false;
				//}
				//dispatchEvent(new RainUIEvent(RainUIEvent.CHANGE, value));
			//}
			//
			//dispatchEvent(new RainUIEvent(RainUIEvent.SELECT, value));
		//}
		
		public function get indexs():Vector.<int>
		{
			var arr:Vector.<int> = new Vector.<int>();
			for (var i:int = 0; i < btnVec.length; i++) 
			{
				if (btnVec[i].selected)
					arr.push(i);
			}
			return arr;
		}
		
		public function set indexs(vec:Vector.<int>):void
		{
			for (var i:int = 0; i < vec.length; i++) 
			{
				select(i);
			}
		}
		
		public function get max():int 
		{
			return _max;
		}
		
		public function set max(value:int):void 
		{
			_max = value;
		}
		
		public function get min():int 
		{
			return _min;
		}
		
		public function set min(value:int):void 
		{
			_min = value;
		}
		
		protected function onChange(e:RainUIEvent):void
		{
			var btn:Button = e.currentTarget as Button;
			if (indexs.length > _max)
				btn.selected = false;
			if (indexs.length <_min)
				btn.selected = true;
				
			dispatchEvent(new RainUIEvent(RainUIEvent.CHANGE, indexs));
		}
		
		protected function onSelect(e:RainUIEvent):void
		{
			dispatchEvent(new RainUIEvent(RainUIEvent.SELECT, e.data));
		}
		
		public function select(i:int):void
		{
			btnVec[i].selected = true;
		}
		
		public function unselect(i:int):void
		{
			btnVec[i].selected = false;
		}
		
		public function toggle(i:int):void
		{
			btnVec[i].selected = !btnVec[i].selected;
		}
	
	}

}