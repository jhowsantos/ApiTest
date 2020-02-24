package runner;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = {"src/test/resources/features/"},
                    plugin = {"json:target/reports/CucumberReport.json"},
                    glue = "steps",
                    tags = {"@run"}
                )
public class RunnerTest {
}