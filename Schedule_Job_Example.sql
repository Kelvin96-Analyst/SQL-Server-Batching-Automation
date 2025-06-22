-- This file provides an example of scheduling logic
-- Use SQL Server Agent to run this command every hour:

```sql
    IF EXISTS (SELECT 1 FROM msdb.dbo.sysjobs WHERE name = N'Batch_Update_Procedure_Job')
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = N'Batch_Update_Procedure_Job';
END
```
-- EXEC [dbo].[UpdateBatchStatus] @BatchNumber = 1, @Status = 'In Progress';
