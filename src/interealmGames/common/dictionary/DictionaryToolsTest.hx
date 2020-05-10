package interealmGames.common.dictionary;

import utest.Assert;
import interealmGames.common.ArrayTools;

typedef LiteralTest<V> = {
    var literal:Dynamic;
    var expected:Map<String, V>;
};
typedef SizeTest<K, V> = {
	var dictionary:Map<K, V>;
	var expected:Int;
};
typedef ValuesTest<K, V> = {
	var dictionary:Map<K, V>;
	var expected:Array<V>;
};

/**
 * Test Suite for StringTools
 */
class DictionaryToolsTest extends utest.Test {
    var maps:Array<Map<String, String>> = [];

    function setup() {
        var map1 = new Map();
        map1.set("a", "aa");
        this.maps.push(map1);

        var map2 = new Map();
        map2.set("b", "bb");
        map2.set("c", "cc");
        map2.set("d", "dd");
        this.maps.push(map2);

        var map3 = new Map();
        this.maps.push(map3);
    }

    function testFromLiteral() {
        var tests:Array<LiteralTest<String>> = [];

        tests.push({
            literal: {
                a: "aa"
            },
            expected: this.maps[0]
        });
        tests.push({
            literal: {
                b: "bb",
                c: "cc",
                d: "dd"
            },
            expected: this.maps[1]
        });
        tests.push({
            literal: {},
            expected: this.maps[2]
        });

        for(test in tests) {
            Assert.same(
                test.expected,
                DictionaryTools.fromLiteral(test.literal)
            );
        }
    }

	function testSize() {
        var tests:Array<SizeTest<String, String>> = [];

        tests.push({
            dictionary: this.maps[0],
            expected: 1
        });

        tests.push({
            dictionary: this.maps[1],
            expected: 3
        });

        tests.push({
            dictionary: this.maps[2],
            expected: 0
        });

        for(test in tests) {
            Assert.equals(
                test.expected,
                DictionaryTools.size(test.dictionary)
            );
        }
    }

	function testValues() {
        var tests:Array<ValuesTest<String, String>> = [];

        tests.push({
            dictionary: this.maps[0],
            expected: ["aa"]
        });

        tests.push({
            dictionary: this.maps[1],
            expected: ["bb", "cc", "dd"]
        });

        tests.push({
            dictionary: this.maps[2],
            expected: []
        });

        for(test in tests) {
            Assert.equals(
                true,
                ArrayTools.hasSameValues(
                    test.expected,
                    DictionaryTools.values(test.dictionary)
                )
            );
        }
    }
}
