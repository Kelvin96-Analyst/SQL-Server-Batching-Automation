# SQL Server Production Batch Automation System

This project demonstrates how to automate production batching using Microsoft SQL Server. It simulates a real-world scenario where batch records are updated automatically based on events or schedules, streamlining operations and reducing manual intervention. This system leverages core SQL Server tools and features to dynamically manage and update batch data, improving efficiency and accuracy in a manufacturing environment.

## Features

- Centralized Production batch tracking using SQL Server
- Stored Procedures for status updates
- Triggers to react to data changes
- SQL Server Agent jobs to schedule updates
- Extendable via PowerShell or Python scripts
  
## Key Components of the Automation System
1.Data Integration
Collected production data from multiple sources—including sensors, machines, and manual inputs—into a centralized SQL Server database. Key data points include batch numbers, schedules, quantities, and process statuses.

## Table Structure

```sql
CREATE TABLE [dbo].[BatchTable] (
    [BatchNumber] INT PRIMARY KEY,
    [StartDate] DATETIME,
    [EndDate] DATETIME,
    [Quantity] INT,
    [Status] VARCHAR(50)
);
```

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
