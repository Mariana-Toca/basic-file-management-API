CREATE TABLE [dbo].[File_TB]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY , 
    [WholeCaseNumber] NVARCHAR(50) NULL, 
    [Name] NVARCHAR(50) NULL, 
    [DocumentId] INT NOT NULL, 
    CONSTRAINT [FK_File_TB_DocumentType_TB] FOREIGN KEY ([DocumentId]) REFERENCES [DocumentType_TB]([Id])
)
