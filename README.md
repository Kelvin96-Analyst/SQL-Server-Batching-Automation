# SQL Server Production Batch Automation System

This project demonstrates how to automate production batching using Microsoft SQL Server. It simulates a real-world scenario where batch records are updated automatically based on events or schedules, streamlining operations and reducing manual intervention. This system leverages core SQL Server tools and features to dynamically manage and update batch data, improving efficiency and accuracy in a manufacturing environment.

## Features

- Centralized Production batch tracking using SQL Server
- Stored Procedures for status updates
- Triggers to react to data changes
- SQL Server Agent jobs to schedule updates
- Extendable via PowerShell or Python scripts
  
## Key Components of the Automation System
#### 1. Data Integration
  
Collected production data from multiple sources—including sensors, machines, and manual inputs into a centralized SQL Server database. Key data points include batch numbers, schedules, quantities, and process statuses.
 
#### 2. Batch Table Structure:

   Created a dedicated table to manage batch details:

```sql
CREATE TABLE [dbo].[BatchTable] (
    [BatchNumber] INT PRIMARY KEY,
    [StartDate] DATETIME,
    [EndDate] DATETIME,
    [Quantity] INT,
    [Status] VARCHAR(50)
);
```

#### 3. Stored Procedures for Batch Updates

   Developed stored procedures to manage batch status updates programmatically:
  ```sql
CREATE PROCEDURE [dbo].[UpdateBatchStatus]
    @BatchNumber INT,
    @Status VARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[BatchTable]
    SET [Status] = @Status
    WHERE [BatchNumber] = @BatchNumber;
END;
```

#### 4. Automated Triggers
   
   Implemented triggers to automatically update batch statuses when conditions change:
```sql
  CREATE TRIGGER [dbo].[UpdateBatchStatusTrigger]
ON [dbo].[BatchTable]
AFTER UPDATE
AS
BEGIN
    IF UPDATE([Status])
    BEGIN
        EXEC [dbo].[UpdateBatchStatus]
            @BatchNumber = (SELECT BatchNumber FROM INSERTED),
            @Status = (SELECT Status FROM INSERTED);
    END;
END;
```

### 5. Scheduled Jobs with SQL Server Agent

   ###### Used SQL Server Agent to schedule and execute batch update procedures, enabling real-time batch tracking and status reporting:
```sql
    IF EXISTS (SELECT 1 FROM msdb.dbo.sysjobs WHERE name = N'Batch_Update_Procedure_Job')
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = N'Batch_Update_Procedure_Job';
END
```

#### 6. Extensibility with Automation Scripts
   
   Utilized PowerShell in conjunction with SAP GUI Scripting to automate routine operations such as sending notifications, generating
   transactional reports, and updating material consumption data used for production batching directly in SAP, ensuring real-time data
   accuracy and reducing manual input.



## Automation Workflow

1. Data collection from production sources
2. Batch creation and status updates via stored procedures
3. Triggers for real-time data-driven responses
4. Scheduled jobs for routine updates
5. Optional integration with external systems via scripts

## Tools Used

- Microsoft SQL Server
- SQL Server Agent
- T-SQL
- Optional: PowerShell or Python for extensions

## Author

Kelvin Ayogu
