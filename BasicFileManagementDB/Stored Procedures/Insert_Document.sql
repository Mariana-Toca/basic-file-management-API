CREATE PROCEDURE [dbo].[Insert_Document]

	@DocumentName NVARCHAR(50)

AS

	INSERT INTO DocumentType_TB (DocumentName)
	VALUES (@DocumentName)
RETURN 0
