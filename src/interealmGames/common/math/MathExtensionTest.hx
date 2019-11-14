package interealmGames.common.math;

using interealmGames.common.math.MathExtension;

import utest.Assert;
import utest.Async;
import interealmGames.common.math.Rounding;
import interealmGames.common.math.MathExtension;

typedef RoundByTest = {
	var expected:Int;
	var value:Float;
}

typedef RoundToTest = {
	var expected:Float;
	var precision:Int;
	var value:Float;
}

class MathExtensionTest extends utest.Test {
	private function _testRoundBy(rounding:Rounding, tests:Array<RoundByTest>):Void {
		for(test in tests) {
			Assert.equals(
				test.expected,
				Math.roundBy(test.value, rounding)
			);
		}
	}

	function testRoundByCeil() {
		var tests:Array<RoundByTest> = [{
			expected: 2, value: 1.1
		}, {
			expected: -1, value: -1.1
		}];

		this._testRoundBy(Rounding.Ceil, tests);
	}

	function testRoundByCeilAbsolute() {
		var tests:Array<RoundByTest> = [{
			expected: 2, value: 1.1
		}, {
			expected: -2, value: -1.1
		}];

		this._testRoundBy(Rounding.CeilAbsolute, tests);
	}

	function testRoundByFloor() {
		var tests:Array<RoundByTest> = [{
			expected: 1, value: 1.1
		}, {
			expected: -2, value: -1.1
		}];

		this._testRoundBy(Rounding.Floor, tests);
	}

	function testRoundByFloorAbsolute() {
		var tests:Array<RoundByTest> = [{
			expected: 1, value: 1.1
		}, {
			expected: -1, value: -1.1
		}];

		this._testRoundBy(Rounding.FloorAbsolute, tests);
	}

	function testRoundByNearestAwayFromZero() {
		var tests:Array<RoundByTest> = [{
			expected: 2, value: 1.5
		}, {
			expected: -2, value: -1.5
		}, {
			expected: -1, value: -1.499999
		}, {
			expected: 1, value: 1.499999
		}];

		this._testRoundBy(Rounding.NearestAwayFromZero, tests);
	}

	function testRoundByNearestDown() {
		var tests:Array<RoundByTest> = [{
			expected: 1, value: 1.5
		}, {
			expected: -2, value: -1.5
		}, {
			expected: -2, value: -1.50000001
		}, {
			expected: 2, value: 1.50000001
		}];

		this._testRoundBy(Rounding.NearestDown, tests);
	}

	function testRoundByNearestTowardsZero() {
		var tests:Array<RoundByTest> = [{
			expected: 1, value: 1.5
		}, {
			expected: -1, value: -1.5
		}, {
			expected: -2, value: -1.50000001
		}, {
			expected: 1, value: 1.499999
		}];

		this._testRoundBy(Rounding.NearestTowardsZero, tests);
	}

	function testRoundByNearestUp() {
		var tests:Array<RoundByTest> = [{
			expected: 2, value: 1.5
		}, {
			expected: -1, value: -1.5
		}, {
			expected: -2, value: -1.50000001
		}, {
			expected: 1, value: 1.499999
		}];

		this._testRoundBy(Rounding.NearestUp, tests);
	}

	private function _testRoundTo(rounding:Rounding, tests:Array<RoundToTest>):Void {
		for(test in tests) {
			Assert.equals(
				test.expected,
				Math.roundTo(test.value, test.precision, rounding)
			);
		}
	}

	function testRoundToNearestUp() {
		var tests:Array<RoundToTest> = [{
			expected: 1.2, value: 1.2345, precision: 1
		}];

		this._testRoundTo(Rounding.NearestAwayFromZero, tests);
	}
}
