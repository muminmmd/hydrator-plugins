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

package io.cdap.plugin.joiner.locators;

import io.cdap.e2e.utils.SeleniumDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Joiner Related Locators.
 */
public class JoinerLocators {

  @FindBy(how = How.XPATH, using = "//*[@data-cy='switch-joinNullKeys']")
  public static WebElement clickOnJoinerNullKeys;

  @FindBy(how = How.XPATH, using = "//input[@data-cy='numPartitions']")
  public static WebElement joinerPartitions;

  @FindBy(how = How.XPATH, using = "//a[@data-testid='close-config-popover']")
  public static WebElement joinerCloseButton;

  public static WebElement selectJoinConditionType(String value) {
    return SeleniumDriver.getDriver().findElement(By.xpath
      ("//input[@name='conditionType' and @value='" + value + "']"));
  }

  public static WebElement selectRequiredField(String value) {
    return SeleniumDriver.getDriver().findElement(By.xpath("//*[@type='checkbox' and @value='" + value + "']"));
  }

  @FindBy(how = How.XPATH, using = "//*[@data-cy='requiredInputs']//div[@role='button']")
  public static WebElement joinerRequiredInputs;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='joinKeys']//div[text()='BigQuery']/parent::*//*[@role='button']")
  public static WebElement selectJoinCondition;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='joinKeys']//div[text()='GCS']/parent::*//*[@role='button']")
  public static WebElement selectJoinConditionGCS;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='key']/input")
  public static WebElement joinerInputAliasesInputName;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='value']/input")
  public static WebElement joinerInputAliasesAlias;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='conditionExpression']//textarea")
  public static WebElement joinerJoinCondition;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='BigQuery-stage-expansion-panel']//div[@role='button']")
    public static WebElement joinerFields;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='GCS-stage-expansion-panel']//div[@role='button']")
  public static WebElement joinerFieldsGCS;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='GCS-input-stage']/ancestor::div[@role='button']/following-sibling::" +
    "div//button[@data-cy='schema-select-btn']")
  public static WebElement joinerFieldGCSSelect;

  @FindBy(how = How.XPATH, using = "//*[@data-cy='BigQuery-input-stage']/ancestor::div[@role='button']/" +
    "following-sibling::div//button[@data-cy='schema-select-btn']")
  public static WebElement joinerFieldBQSelect;

  public static By locateSchemaSelectListItem(String option) {
    return By.xpath("//li[@data-cy='select-" + option + "-option']");
  }
}
