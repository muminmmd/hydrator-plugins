/*
 * Copyright © 2022 Cask Data, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package io.cdap.plugin.joiner.runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"src/test/features"},
        glue = {"io.cdap.plugin.gcs.stepsdesign", "io.cdap.plugin.joiner.stepsdesign", "stepsdesign",
          "io.cdap.plugin.common.stepsdesign", "io.cdap.plugin.bigquery.stepsdesign"},
        tags = {"@Joiner and not @PLUGIN-1207"},
        /*
        **TODO :Enable tests once issues fixed https://cdap.atlassian.net/browse/PLUGIN-1207
         **/
        monochrome = true,
        plugin = {"pretty", "html:target/cucumber-html-report/joiner-action",
                "json:target/cucumber-reports/cucumber-joiner-action.json",
                "junit:target/cucumber-reports/cucumber-joiner-action.xml"}
)
public class TestRunner {
}
