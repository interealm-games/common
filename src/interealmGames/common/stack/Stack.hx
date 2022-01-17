package interealmGames.common.stack;

interface Stack<T> {

	public function add(t:T):Void;

	public function next():T;

	public function hasNext():Bool;
}
