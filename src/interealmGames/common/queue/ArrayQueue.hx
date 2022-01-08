package interealmGames.common.queue;

class ArrayQueue<T> {
	private var queue:Array<T> = [];
	public function new() {}

	public function add(t:T) {
		this.queue.push(t);
	}

	public function next():T {
		return this.queue.shift();
	}

	public function hasNext():Bool {
		return this.queue.length > 0;
	}
}
