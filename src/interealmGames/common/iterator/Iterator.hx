package interealmGames.common.iterator;

/**
 * Allows a class to have a property which acts as an iterable
 * while keeping access to the object private
 */
interface Iterator<T> {
	public function iterator():StdTypes.Iterator<T>;
	public function length():Int;
}
