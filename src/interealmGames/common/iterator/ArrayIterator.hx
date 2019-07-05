package interealmGames.common.iterator;

import interealmGames.common.iterator.Iterator;

class ArrayIterator<T> implements Iterator<T> {
	private var iterable: Array<T>;

    public function new (iterable: Array<T>) {
		this.iterable = iterable;
	}

	public function iterator() {
		return this.iterable.iterator();
	}

	public function length() {
		return iterable.length;
	}
}
