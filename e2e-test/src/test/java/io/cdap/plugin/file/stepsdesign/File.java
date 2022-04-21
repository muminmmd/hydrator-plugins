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
package io.cdap.plugin.file.stepsdesign;

import io.cdap.e2e.pages.actions.CdfPipelineRunAction;
import io.cdap.e2e.pages.actions.CdfPluginPropertiesActions;
import io.cdap.e2e.utils.BigQueryClient;
import io.cdap.e2e.utils.CdfHelper;
import io.cdap.e2e.utils.PluginPropertyUtils;
import io.cdap.plugin.file.actions.FileActions;
import io.cdap.plugin.utils.E2ETestConstants;
import io.cucumber.java.en.Then;
import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import stepsdesign.BeforeActions;

import java.io.IOException;
import java.util.Optional;

/**
 * File plugin related Step design.
 **/

public class File implements CdfHelper {

  @Then("Enter File plugin property: override field name with value: {string}")
  public void enterFilePluginPropertyOverrideFieldNameWithValue(String fieldName) {
    FileActions.enterOverrideFieldName(PluginPropertyUtils.pluginProp(fieldName));
  }

  @Then("Select File plugin property: override field data type with value: {string}")
  public void selectFilePluginPropertyOverrideFieldDataTypeWithValue(String dataType) {
    FileActions.selectOverrideFieldDatatype(PluginPropertyUtils.pluginProp(dataType));
  }

  @Then("Verify file plugin in-line error message for incorrect pathField value: {string}")
  public void verifyFilePluginInLineErrorMessageForIncorrectPathField(String pathField) {
    CdfPluginPropertiesActions.verifyPluginPropertyInlineErrorMessage
      ("pathField",
       PluginPropertyUtils.errorProp(E2ETestConstants.ERROR_MSG_FILE_INVALID_OUTPUTFIELD)
         .replace("PATH_FIELD", PluginPropertyUtils.pluginProp(pathField)));
    CdfPluginPropertiesActions.verifyPluginPropertyInlineErrorMessageColor("pathField");
  }

  @Then("Validate OUT record count is equal to records transferred to target BigQuery table")
  public void validateOUTRecordCountIsEqualToRecordsTransferredToTargetBigQueryTable()
    throws IOException, InterruptedException {
    int targetBQRecordsCount = BigQueryClient.countBqQuery(PluginPropertyUtils.pluginProp("bqTargetTable"));
    BeforeActions.scenario.write("No of Records Transferred to BigQuery:" + targetBQRecordsCount);
    Assert.assertEquals("Out records should match with target BigQuery table records count",
                        CdfPipelineRunAction.getCountDisplayedOnSourcePluginAsRecordsOut(), targetBQRecordsCount);
  }

  @Then("Verify output field {string} in target BigQuery table contains source file path {string}")
  public void verifyOutputFieldInTargetBigQueryTableContainsSourceFilePath(
    String outputField, String filePath) throws IOException, InterruptedException {
    Optional<String> result = BigQueryClient
      .getSoleQueryResult("SELECT distinct " + PluginPropertyUtils.pluginProp(outputField) + " as filePath FROM `"
                            + (PluginPropertyUtils.pluginProp("projectId")) + "."
                            + (PluginPropertyUtils.pluginProp("dataset")) + "."
                            + PluginPropertyUtils.pluginProp("bqTargetTable") + "` ");
    String pathFromBQTable = StringUtils.EMPTY;
    if (result.isPresent()) {
      pathFromBQTable = result.get();
    }
    BeforeActions.scenario.write("File path in BQ Table :" + pathFromBQTable);
    Assert.assertEquals("file:" + PluginPropertyUtils.pluginProp(filePath), pathFromBQTable);
  }

  @Then("Verify datatype of field {string} is overridden to data type {string} in target BigQuery table")
  public void verifyDatatypeOfFieldIsOverriddenToDataTypeInTargetBigQueryTable(
    String field, String dataType) throws IOException, InterruptedException {
    Optional<String> result = BigQueryClient
      .getSoleQueryResult("SELECT data_type FROM `" + (PluginPropertyUtils.pluginProp("projectId")) + "."
                            + (PluginPropertyUtils.pluginProp("dataset")) + ".INFORMATION_SCHEMA.COLUMNS` " +
                            "WHERE table_name = '" + PluginPropertyUtils.pluginProp("bqTargetTable")
                            + "' and column_name = '" + PluginPropertyUtils.pluginProp(field) + "' ");
    String dataTypeInTargetTable = StringUtils.EMPTY;
    if (result.isPresent()) {
      dataTypeInTargetTable = result.get();
    }
    BeforeActions.scenario.write("Data type in target BQ Table :" + dataTypeInTargetTable);
    Assert.assertEquals(PluginPropertyUtils.pluginProp(dataType),
                        dataTypeInTargetTable.replace("64", StringUtils.EMPTY).toLowerCase());
  }
}
