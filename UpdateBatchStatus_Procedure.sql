CREATE PROCEDURE [dbo].[UpdateBatchStatus]
    @BatchNumber INT,
    @Status VARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[BatchTable]
    SET [Status] = @Status
    WHERE [BatchNumber] = @BatchNumber;
END;