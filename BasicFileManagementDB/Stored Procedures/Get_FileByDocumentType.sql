CREATE PROCEDURE [dbo].[Get_FileByDocumentType]
	@Id INT
AS
	SELECT F.WholeCaseNumber, F.Name, D.DocumentName FROM File_TB F
	JOIN DocumentType_TB D ON F.DocumentId = D.Id
	WHERE F.DocumentId = @Id

RETURN 0
