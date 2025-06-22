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