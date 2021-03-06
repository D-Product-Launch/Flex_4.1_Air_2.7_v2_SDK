////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2008-2009 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
//////////////////////////////////////////////////////////////////////////////////
package flashx.textLayout.events
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flashx.textLayout.elements.FlowElement;
			
	/** A LinkElement dispatches this event when it detects mouse activity.
	 * The Text Layout Framework includes this special version of mouse events
	 * because mouse events are generally unwanted when a link element is
	 * embedded in an editable text flow. 
	 * <p>You can add an event listener to a LinkElement to listen for this
	 * type of event. If you choose to cancel the event by calling
	 * <code>Event.preventDefault()</code>, the default behavior associated
	 * with the event will not occur.
	 * </p>
	 * <p>If you choose not to add an event listener to the LinkElement, or
	 * your event listener function does not cancel the behavior, the 
	 * event is again dispatched, but this time by the LinkElement's
	 * associated TextFlow instance rather than by the LinkElement itself. 
	 * This provides a second opportunity to listen for this event with
	 * an event listener attached to the TextFlow. 
	 * </p>
	 * <p>FlowElementMouseEvents are
	 * dispatched only when the text cannot be edited or when the control key 
	 * is pressed concurrently with the mouse activity.</p>
	 * <p>
	 * The following six event types are dispatched only when the text
	 * cannot be edited or when the control key is pressed:
	 * <ul>
	 *   <li><code>MouseEvent.CLICK</code></li>
	 *   <li><code>MouseEvent.MOUSE_DOWN</code></li>
	 *   <li><code>MouseEvent.MOUSE_OUT</code></li>
	 *   <li><code>MouseEvent.MOUSE_UP</code></li>
	 *   <li><code>MouseEvent.ROLL_OVER</code></li>
	 *   <li><code>MouseEvent.ROLL_OUT</code></li>
	 * </ul>
	 * </p>
	 *
	 * @includeExample examples\FlowElementMouseEvent_example.as -noswf
	 * 
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @langversion 3.0 
	 * @see flashx.textLayout.elements.LinkElement
	 */
	public class FlowElementMouseEvent extends Event
	{
		
		public static const MOUSE_DOWN:String = "mouseDown";
		public static const MOUSE_UP:String = "mouseUp";	
		public static const MOUSE_MOVE:String = "mouseMove";			
		public static const ROLL_OVER:String = "rollOver";
		public static const ROLL_OUT:String = "rollOut";	
		public static const CLICK:String = "click";

		private var _flowElement:FlowElement;
		private var _originalEvent:MouseEvent;
		
		/** 
		 * The LinkElement that dispatched the event.
		 *
		 * @see flashx.textLayout.elements.LinkElement
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0 
		 */
		public function get flowElement():FlowElement
		{ return _flowElement; }		
		public function set flowElement(value:FlowElement):void
		{ _flowElement = value; }
		
		/** 
		 * The original mouse event generated by the mouse activity. 
		 * This property can contain any of the following values:
		 * <ul>
		 *   <li><code>MouseEvent.CLICK</code></li>
		 *   <li><code>MouseEvent.MOUSE_DOWN</code></li>
		 *   <li><code>MouseEvent.MOUSE_OUT</code></li>
		 *   <li><code>MouseEvent.MOUSE_UP</code></li>
		 *   <li><code>MouseEvent.MOUSE_OVER</code></li>
		 *   <li><code>MouseEvent.MOUSE_OUT</code></li>
		 * </ul>
		 * <p>
		 * In most cases the original event matches the event that the
		 * LinkElement dispatches. The events match for the <code>click</code>,
		 * <code>mouseDown</code>, <code>mouseOut</code>, and <code>mouseOver</code>
		 * events. There are two cases, however, in which the original event
		 * is converted by the LinkElement to a related event. 
		 * If a LinkElement detects a <code>mouseOver</code> event, it dispatches
		 * a <code>rollOver</code> event. Likewise, if a LinkElement detects
		 * a <code>mouseOut</code> event, it dispatches a <code>rollOut</code> event.
		 * </p>
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0 
		 * @see flash.events.MouseEvent
		 */
		public function get originalEvent():MouseEvent
		{ return _originalEvent; }		
		public function set originalEvent(value:MouseEvent):void
		{ _originalEvent = value; }
				
		/** 
		 * Creates an event object that contains information about mouse activity.
		 * Event objects are passed as parameters to event listeners. Use the
		 * constructor if you plan to manually dispatch an event. You do not need
		 * to use the constructor to listen for FlowElementMouseEvent objects
		 * generated by a LinkElement.
		 * @param type  The type of the event. Event listeners can access this information through the
		 * inherited <code>type</code> property. There are six types:
		 * <code>MouseEvent.CLICK</code>; <code>MouseEvent.MOUSE_DOWN</code>; <code>MouseEvent.MOUSE_OUT</code>;
		 * <code>MouseEvent.MOUSE_UP</code>; <code>MouseEvent.ROLL_OVER</code>; and <code>MouseEvent.ROLL_OUT</code>.
		 * @param bubbles Determines whether the Event object participates in the bubbling phase of the
		 * event flow. FlowElementMouseEvent objects do not bubble.
		 * @param cancelable Determines whether the Event object can be canceled. Event listeners can
		 * access this information through the inherited <code>cancelable</code> property. FlowElementMouseEvent
		 * objects can be cancelled. You can cancel the default behavior associated with this event
		 * by calling the <code>preventDefault()</code> method in your event listener.
		 * @param flowElement The instance of FlowElement, usually a LinkElement, associated with this
		 * event. Event listeners can access this information through the <code>flowElement</code> property.
		 * @param originalEvent The original mouse event that occurred on the flowElement. Event listeners can 
		 * access this information through the <code>originalEvent</code> property.

		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0 
		 */
		public function FlowElementMouseEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true, flowElement:FlowElement = null, originalEvent:MouseEvent = null)
		{
			super(type, bubbles, cancelable);
			_flowElement = flowElement;
			_originalEvent = originalEvent;
        }
        
        /** @private */
        override public function clone():Event
        {
        	return new FlowElementMouseEvent(type, bubbles, cancelable, flowElement, originalEvent);
        }
        
	}
}
