CREATE TABLE [dbo].[BatchTable] (
    [BatchNumber] INT PRIMARY KEY,
    [StartDate] DATETIME,
    [EndDate] DATETIME,
    [Quantity] INT,
    [Status] VARCHAR(50)
);