package interealmGames.common.stack;

import interealmGames.common.stack.Stack;

class ArrayStack<T> implements Stack<T> {
	private var stack:Array<T> = [];
	public function new() {}

	public function add(t:T) {
		this.stack.push(t);
	}

	public function next():T {
		return this.stack.pop();
	}

	public function hasNext():Bool {
		return this.stack.length > 0;
	}
}
