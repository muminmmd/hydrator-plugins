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

package io.cdap.plugin.joiner.stepsdesign;

import io.cdap.e2e.pages.locators.CdfStudioLocators;
import io.cdap.e2e.utils.CdfHelper;
import io.cdap.e2e.utils.PluginPropertyUtils;
import io.cdap.e2e.utils.SeleniumHelper;
import io.cdap.plugin.joiner.actions.JoinerActions;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class Joiner implements CdfHelper {
  static {
    SeleniumHelper.getPropertiesLocators(CdfStudioLocators.class);
  }

  @Then("Toggle joiner property join on Null keys set to False")
  public void toggleJoinerPropertyJoinOnNullKeysSetToTrue() {
    JoinerActions.toggleJoinerPropertyOnNullKeys();
  }

  @Then("Enter joiner property Number of Partitions {string}")
  public void enterJoinerPropertyNumberOfPartitions(String partitions) {
    JoinerActions.enterJoinerPartition(PluginPropertyUtils.pluginProp(partitions));
  }

  @Then("CLose the joiner properties")
  public void closeTheJoinerProperties() {
    JoinerActions.closeButton();
  }

  @Then("Select joiner property join condition type {string}")
  public void selectJoinerPropertyJoinConditionType(String joinType) {
    JoinerActions.selectJoinConditionType(joinType);
  }

  @Then("Enter joiner property selected fields")
  public void enterJoinerPropertySelectedFields() {
  }

  @When("Enter joiner property join type {string}")
  public void enterJoinerPropertyJoinType(String joinType) {
    JoinerActions.selectJoinType(joinType);
  }

  @Then("Select Joiner property join condition {string}")
  public void selectJoinerPropertyJoinCondition(String joinCondition) {
    JoinerActions.selectJoinConditionBigQuery(joinCondition);
  }

  @Then("Select Joiner Property Join condition {string}")
  public void selecyJoinerPropertyJoinCondition(String joinCondition) {
    JoinerActions.selectJoinConditionGCS(joinCondition);
  }

  @Then("Select joiner property Required Inputs {string}")
  public void selectJoinerPropertyRequiredInputs(String requiredInput) {
    JoinerActions.selectRequiredFieldOuterJoin(requiredInput);
  }

  @Then("Enter joiner property Input Aliases key {string}")
  public void enterJoinerPropertyInputAliasesKey(String key) {
    JoinerActions.enterJoinerKey(PluginPropertyUtils.pluginProp(key));
  }

  @Then("Enter joiner property Input Aliases value {string}")
  public void enterJoinerPropertyInputAliasesValue(String value) {
    JoinerActions.enterJoinerValue(PluginPropertyUtils.pluginProp(value));
  }

  @Then("Enter joiner property Join Condition {string}")
  public void enterJoinerPropertyJoinCondition(String joinCondition) {
    JoinerActions.enterJoinCondition(PluginPropertyUtils.pluginProp(joinCondition));
  }

  @Then("Expand Bigquery expansion panel {string}")
  public void expandBigqueryExpansionPanel(String bigQuery) {
    JoinerActions.expandField(bigQuery);
  }

  @Then("Select joiner property BigQuery name {string}")
  public void selectJoinerPropertyBigQueryName(String selectNone) {
    JoinerActions.selectJoinerFieldBQ(selectNone);
  }

  @Then("Expand GCS expansion panel {string}")
  public void expandGCSExpansionPanel(String gcs) {
    JoinerActions.expandFieldGCS(gcs);

  }

  @Then("Select joiner property GCS name {string}")
  public void selectJoinerPropertyGCSName(String selectNone) {
    JoinerActions.selectJoinerFieldGCS(selectNone);
  }
}
