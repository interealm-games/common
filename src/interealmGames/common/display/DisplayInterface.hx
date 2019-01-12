package interealmGames.common.display;

/**
 * Interface for visual displays in browsers (maybe make more abstract in future)
 */
interface DisplayInterface<Element, Event> 
{
	/**
	 * Adds a event callback to the element events of this View
	 * @param	elementSelector Query Selector
	 * @param	eventName Element compliant event
	 * @param	callback The value for this property
	 * @param	overwrite Whether this function will overwrite existing presets, default is false
	 */
	public function addEvent(elementSelector:String, eventName:String, callback:Any, overwrite:Bool = false):Void;
	
	/**
	 * Adds a property value to the element properties of this View
	 * @param	elementSelector Query Selector
	 * @param	propertyName Element compliant property name
	 * @param	value The value for this property
	 * @param	overwrite Whether this function will overwrite existing presets, default is false
	 */
	public function addProperty(elementSelector:String, propertyName:String, value:Any, overwrite:Bool = false):Void;
	
	/**
	 * Called to load display in view after this object has been constructed.
	 * Loads values to element properties.
	 * Loads handlers to element events.
	 * Calls custom onLoad function if defined.
	 */
	public function load():Void;
	
	/**
	 * Sets the definition for the element property values.
	 * Does not actually load the values to the elements at this time, 
	 * must be activated by #load().
	 */
	public function setProperties(displayElementProperties:Map<String, Map<String, Any>>):Void;
	
	/**
	 * Sets the definition for the element event handlers.
	 * Does not actually load the handlers to the elements at this time, 
	 * must be activated by #load().
	 */
	public function setEvents(displayElementEvents:Map<String, Map<String, Event -> Void>>):Void;
	
	/**
	 * Sets a custom functon to be executed immediately after the display has
	 * been loaded.
	 */
	public function setOnLoad(onLoad:Element -> Void):Void;
}