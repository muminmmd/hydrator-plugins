@Joiner
Feature:Verification of Joiner Plugin Error Scenarios

  @GCS_CSV_TEST @BQ_SOURCE_TEST
  Scenario:Verify Joiner plugin  properties validation errors for mandatory fields
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    And Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    Then Navigate to the properties page of plugin: "BigQuery"
    And Replace input plugin property: "projectId" with value: "projectId"
    And Enter input plugin property: "datasetProjectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    And Enter input plugin property: "dataset" with value: "dataset"
    And Enter input plugin property: "table" with value: "e2e_source_table"
    And Click on the Get Schema button
    And Validate "BigQuery" plugin properties
    And Close the Plugin Properties page
    Then Navigate to the properties page of plugin: "GCS"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    And Enter input plugin property: "path" with value: "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    And Close the Plugin Properties page
    And Navigate to the properties page of plugin: "Joiner"
    Then Expand Bigquery expansion panel "BigQuery"
    Then Select joiner property BigQuery name "none"
    Then Expand GCS expansion panel "GCS"
    Then Select joiner property GCS name "none"
    Then Click on the Get Schema button
