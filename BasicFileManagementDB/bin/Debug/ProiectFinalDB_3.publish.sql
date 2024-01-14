﻿/*
Deployment script for master

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "master"
:setvar DefaultFilePrefix "master"
:setvar DefaultDataPath "C:\Users\mtoca\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\mtoca\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering Procedure [dbo].[Insert_Document]...';


GO
ALTER PROCEDURE [dbo].[Insert_Document]

	@DocumentName NVARCHAR(50)

AS

	INSERT INTO DocumentType_TB (DocumentName)
	VALUES (@DocumentName)
RETURN 0
GO
PRINT N'Altering Procedure [dbo].[Insert_File]...';


GO
ALTER PROCEDURE [dbo].[Insert_File]

	@WholeCaseNumber NVARCHAR(50),
	@Name NVARCHAR(50),
	@DocumentId INT

AS

	INSERT INTO File_TB (WholeCaseNumber, Name, DocumentId)
	VALUES (@WholeCaseNumber, @Name, @DocumentId)

RETURN 0
GO
PRINT N'Update complete.';


GO
