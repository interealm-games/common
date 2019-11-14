package interealmGames.common;

import utest.Runner;
import utest.ui.Report;
import interealmGames.common.ArrayToolsTest;
import interealmGames.common.commandLine.CommandLineTest;
import interealmGames.common.commandLine.OptionSetTest;
import interealmGames.common.math.MathExtensionTest;
import interealmGames.common.StringToolsTest;

/**
 * All tests for this package
 */
class Test {
	public static function main() {
		var runner:Runner = new Runner();
		runner.addCase(new StringToolsTest());
		runner.addCase(new ArrayToolsTest());
		runner.addCase(new CommandLineTest());
		runner.addCase(new OptionSetTest());
		Report.create(runner);
		runner.run();
	}
}
