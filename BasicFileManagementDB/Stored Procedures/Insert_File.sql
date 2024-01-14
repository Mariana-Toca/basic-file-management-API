CREATE PROCEDURE [dbo].[Insert_File]

	@WholeCaseNumber NVARCHAR(50),
	@Name NVARCHAR(50),
	@DocumentId INT

AS

	INSERT INTO File_TB (WholeCaseNumber, Name, DocumentId)
	VALUES (@WholeCaseNumber, @Name, @DocumentId)

RETURN 0
