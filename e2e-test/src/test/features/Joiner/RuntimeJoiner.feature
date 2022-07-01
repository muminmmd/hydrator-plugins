@Joiner
Feature:Verification of Joiner Plugin

  @GCS_CSV_TEST @BQ_SOURCE_TEST @BQ_SINK_TEST @PLUGIN-1207
  Scenario: To verify complete flow of data extract and transfer from multiple sources to single sink using outer join type
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "BigQuery"
    And Replace input plugin property: "projectId" with value: "projectId"
    And Enter input plugin property: "datasetProjectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    And Enter input plugin property: "dataset" with value: "dataset"
    Then Enter BigQuery source property table name
    Then Validate "BigQuery" plugin properties
    And Close the Plugin Properties page
    When Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Navigate to the properties page of plugin: "GCS"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    Then Enter GCS source property path "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click plugin property: "skipHeader"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    And Close the Plugin Properties page
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    When Navigate to the properties page of plugin: "Joiner"
    Then Enter joiner property join type "Outer"
    Then Select joiner property Required Inputs "0-BigQuery"
    Then Select joiner property join condition type "basic"
    Then Select Joiner property join condition "UID"
    Then Select Joiner Property Join condition "EmployeeDepartment"
    Then Click on the Get Schema button
    Then Validate "Joiner" plugin properties
    Then CLose the joiner properties
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Connect plugins: "Joiner" and "BigQuery2" to establish connection
    Then Navigate to the properties page of plugin: "BigQuery2"
    And Replace input plugin property: "projectId" with value: "projectId"
    And Enter input plugin property: "datasetProjectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    And Enter input plugin property: "dataset" with value: "dataset"
    And Enter input plugin property: "table" with value: "bqTargetTable"
    And Click plugin property: "truncateTable"
    And Click plugin property: "updateTableSchema"
    And Validate "BigQuery" plugin properties
    And Close the Plugin Properties page
    Then Save the pipeline
    And Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline preview is in running state
    And Open and capture logs
    And Verify the pipeline status is "Succeeded"
    Then Get count of no of records transferred to target BigQuery Table

  @GCS_CSV_TEST @BQ_SOURCE_TEST @BQ_SINK_TEST @PLUGIN-1207
  Scenario: To verify complete flow of data extract and transfer from multiple sources to single sink using inner join type
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Enter BigQuery property reference name
    Then Enter BigQuery property projectId "projectId"
    Then Enter BigQuery property datasetProjectId "projectId"
    Then Override Service account details if set in environment variables
    Then Enter BigQuery property dataset "dataset"
    Then Enter BigQuery source property table name
    Then Validate "BigQuery" plugin properties
    Then Close the BigQuery properties
    When Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Navigate to the properties page of plugin: "GCS"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    Then Enter GCS property projectId and reference name
    Then Enter GCS source property path "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click plugin property: "skipHeader"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    When Navigate to the properties page of plugin: "Joiner"
    Then Enter joiner property join type "Inner"
    Then Select joiner property join condition type "basic"
    Then Select Joiner property join condition "UID"
    Then Select Joiner Property Join condition "EmployeeDepartment"
    Then Click on the Get Schema button
    Then Validate "Joiner" plugin properties
    Then CLose the joiner properties
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "BigQuery2"
    Then Enter BigQuery property reference name
    Then Enter BigQuery property projectId "projectId"
    Then Enter BigQuery property datasetProjectId "projectId"
    Then Override Service account details if set in environment variables
    Then Enter BigQuery property dataset "dataset"
    Then Enter BigQuery sink property table name
    Then Close the BigQuery properties
    Then Connect plugins: "Joiner" and "BigQuery2" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Verify the preview of pipeline is "success"
    Then Click on preview data for BigQuery sink
    Then Close the preview data
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline preview is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Get count of no of records transferred to target BigQuery Table

  @GCS_CSV_TEST @BQ_SOURCE_TEST @BQ_SINK_TEST @GCS_SINK_TEST @PLUGIN-1207
  Scenario: To verify complete flow of data extract and transfer from multiple sources to  single sink using Advanced
  join conditionType with inner join type
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    When Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "GCS" from the plugins list as: "Sink"
    Then Connect plugins: "Joiner" and "GCS2" to establish connection
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Enter BigQuery property reference name
    Then Enter BigQuery property projectId "projectId"
    Then Enter BigQuery property datasetProjectId "projectId"
    Then Override Service account details if set in environment variables
    Then Enter BigQuery property dataset "dataset"
    Then Enter BigQuery source property table name
    Then Validate "BigQuery" plugin properties
    Then Close the BigQuery properties
    Then Navigate to the properties page of plugin: "GCS"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Enter GCS property projectId and reference name
    Then Override Service account details if set in environment variables
    Then Enter GCS source property path "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click plugin property: "skipHeader"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    When Navigate to the properties page of plugin: "Joiner"
    Then Enter joiner property join type "Inner"
    Then Select joiner property join condition type "advanced"
    Then Enter joiner property Input Aliases key "joinerKey"
    Then Enter joiner property Input Aliases value "joinerValue"
    Then Enter joiner property Join Condition "joinerCondition"
    Then Click on the Get Schema button
    Then Validate "Joiner" plugin properties
    Then CLose the joiner properties
    Then Navigate to the properties page of plugin: "GCS2"
    Then Enter GCS property projectId and reference name
    Then Override Service account details if set in environment variables
    Then Enter GCS sink property path
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Verify the preview of pipeline is "success"
    Then Click on preview data for GCS sink
    Then Close the preview data
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline preview is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Get count of no of records transferred to target BigQuery Table

  @GCS_CSV_TEST @BQ_SOURCE_TEST @BQ_SINK_TEST @GCS_SINK_TEST @PLUGIN-1207
  Scenario: To verify complete flow of data extract and transfer from multiple sources to single sink with Null Keys
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Enter BigQuery property reference name
    Then Enter BigQuery property projectId "projectId"
    Then Enter BigQuery property datasetProjectId "projectId"
    Then Override Service account details if set in environment variables
    Then Enter BigQuery property dataset "dataset"
    Then Enter BigQuery source property table name
    Then Validate "BigQuery" plugin properties
    Then Close the BigQuery properties
    When Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Navigate to the properties page of plugin: "GCS"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "GCSReferenceName"
    Then Enter GCS source property path "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click plugin property: "skipHeader"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    When Navigate to the properties page of plugin: "Joiner"
    Then Enter joiner property join type "Outer"
    Then Select joiner property join condition type "basic"
    Then Select Joiner property join condition "UID"
    Then Select Joiner Property Join condition "EmployeeDepartment"
    Then Toggle joiner property join on Null keys set to False
    Then Click on the Get Schema button
    Then Validate "Joiner" plugin properties
    Then CLose the joiner properties
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "GCS" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "GCS2"
    Then Enter GCS property projectId and reference name
    Then Override Service account details if set in environment variables
    Then Enter GCS sink property path
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    Then Connect plugins: "Joiner" and "GCS2" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Verify the preview of pipeline is "success"
    Then Click on preview data for GCS sink
    Then Close the preview data
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline preview is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Get count of no of records transferred to target BigQuery Table

  @GCS_CSV_TEST @BQ_SOURCE_TEST @BQ_SINK_TEST @GCS_SINK_TEST @PLUGIN-1207
  Scenario: To verify complete flow of data extract and transfer from multiple sources to single sink with number of partitions
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    When Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "GCS" from the plugins list as: "Sink"
    Then Connect plugins: "Joiner" and "GCS2" to establish connection
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Enter BigQuery property reference name
    Then Enter BigQuery property projectId "projectId"
    Then Enter BigQuery property datasetProjectId "projectId"
    Then Override Service account details if set in environment variables
    Then Enter BigQuery property dataset "dataset"
    Then Enter BigQuery source property table name
    Then Validate "BigQuery" plugin properties
    Then Close the BigQuery properties
    Then Navigate to the properties page of plugin: "GCS"
    Then Enter GCS property projectId and reference name
    Then Enter GCS source property path "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click plugin property: "skipHeader"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    When Navigate to the properties page of plugin: "Joiner"
    Then Enter joiner property join type "Outer"
    Then Select joiner property join condition type "basic"
    Then Select Joiner property join condition "UID"
    Then Select Joiner Property Join condition "EmployeeDepartment"
    Then Toggle joiner property join on Null keys set to False
    Then Enter joiner property Number of Partitions "numberOfPartitions"
    Then Click on the Get Schema button
    Then Validate "Joiner" plugin properties
    Then CLose the joiner properties
    Then Navigate to the properties page of plugin: "GCS2"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "GCSReferenceName"
    Then Enter GCS sink property path
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Validate "GCS" plugin properties
    Then Close the GCS properties
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Verify the preview of pipeline is "success"
    Then Click on preview data for GCS sink
    Then Close the preview data
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline preview is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Get count of no of records transferred to target BigQuery Table

  @GCS_CSV_TEST @BQ_SOURCE_TEST @FILE_SINK_TEST
  Scenario: With File verify complete flow of data extract transfer from multiple sources to single using outer join type
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "BigQuery" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "BigQuery"
    And Replace input plugin property: "projectId" with value: "projectId"
    And Enter input plugin property: "datasetProjectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    And Enter input plugin property: "dataset" with value: "dataset"
    Then Enter BigQuery source property table name
    Then Validate "BigQuery" plugin properties
    And Close the Plugin Properties page
    When Expand Plugin group in the LHS plugins list: "Analytics"
    When Select plugin: "Joiner" from the plugins list as: "Analytics"
    Then Connect plugins: "BigQuery" and "Joiner" to establish connection
    When Expand Plugin group in the LHS plugins list: "Source"
    When Select plugin: "GCS" from the plugins list as: "Source"
    And Align plugin: "GCS" on canvas moving by x offset: 0 and y offset: 200
    Then Navigate to the properties page of plugin: "GCS"
    And Replace input plugin property: "projectId" with value: "projectId"
    Then Override Service account details if set in environment variables
    And Enter input plugin property: "referenceName" with value: "BQReferenceName"
    Then Enter GCS source property path "gcsCsvFile"
    And Select dropdown plugin property: "format" with option value: "csv"
    Then Click plugin property: "skipHeader"
    Then Click on the Get Schema button
    Then Validate "GCS" plugin properties
    And Close the Plugin Properties page
    Then Connect plugins: "GCS" and "Joiner" to establish connection
    When Navigate to the properties page of plugin: "Joiner"
    Then Enter joiner property join type "Outer"
    Then Select joiner property Required Inputs "0-BigQuery"
    Then Select joiner property join condition type "basic"
    Then Select Joiner property join condition "UID"
    Then Select Joiner Property Join condition "EmployeeDepartment"
    Then Click on the Get Schema button
    Then Validate "Joiner" plugin properties
    Then CLose the joiner properties
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "File" from the plugins list as: "Sink"
    Then Connect plugins: "Joiner" and "File" to establish connection
    Then Navigate to the properties page of plugin: "File"
    And Enter input plugin property: "referenceName" with value: "FileReferenceName"
    Then Enter input plugin property: "path" with value: "filePluginOutputFolder"
    And Select dropdown plugin property: "format" with option value: "csv"
    And Validate "File" plugin properties
    And Close the Plugin Properties page
    Then Save the pipeline
    And Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    And Wait till pipeline is in running state
    And Open and capture logs
    And Verify the pipeline status is "Succeeded"
