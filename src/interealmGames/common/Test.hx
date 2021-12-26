package interealmGames.common;

import utest.Runner;
import utest.ui.Report;
import interealmGames.common.ArrayToolsTest;
import interealmGames.common.commandLine.CommandLineTest;
import interealmGames.common.commandLine.OptionSetTest;
import interealmGames.common.dictionary.DictionaryToolsTest;
import interealmGames.common.math.MathExtensionTest;
import interealmGames.common.StringToolsTest;
import interealmGames.common.uuid.UuidTest;

/**
 * All tests for this package
 */
class Test {
	public static function main() {
		var runner:Runner = new Runner();
		runner.addCase(new StringToolsTest());
		runner.addCase(new ArrayToolsTest());
		runner.addCase(new CommandLineTest());
		runner.addCase(new DictionaryToolsTest());
		runner.addCase(new MathExtensionTest());
		runner.addCase(new OptionSetTest());
		runner.addCase(new UuidTest());
		Report.create(runner);
		runner.run();
	}
}
