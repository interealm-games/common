package interealmGames.common.queue;

interface Queue<T> {
	public function add(t:T):Void;

	public function next():T;

	public function hasNext():Bool;
}
