/*
Feathers
Copyright 2012-2014 Joshua Tynjala. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package me.rainui.events
{
	import flash.events.Event;
	/**
	 * Event <code>type</code> constants for collections. This class is
	 * not a subclass of <code>starling.events.Event</code> because these
	 * constants are meant to be used with <code>dispatchEventWith()</code> and
	 * take advantage of the Starling's event object pooling. The object passed
	 * to an event listener will be of type <code>starling.events.Event</code>.
	 */
	public class CollectionEvent extends RainUIEvent
	{
		/**
		 * Dispatched when the data provider's source is completely replaced.
		 */
		public static const RESET:String = "reset";

		/**
		 * Dispatched when an item is added to the collection.
		 */
		public static const ADD_ITEM:String = "addItem";

		/**
		 * Dispatched when an item is removed from the collection.
		 */
		public static const REMOVE_ITEM:String = "removeItem";

		/**
		 * Dispatched when an item is replaced in the collection with a
		 * different item.
		 */
		public static const REPLACE_ITEM:String = "replaceItem";

		/**
		 * Dispatched when an item in the collection has changed.
		 */
		public static const UPDATE_ITEM:String = "updateItem";
		
		static public const UPDATE_ALL:String = "updateAll";
		
		public function CollectionEvent(type:String, data:*, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, data, bubbles, cancelable);
			
		}
		
		override public function clone():Event {
			return new CollectionEvent(type,data, bubbles, cancelable);
		}
	}
}
