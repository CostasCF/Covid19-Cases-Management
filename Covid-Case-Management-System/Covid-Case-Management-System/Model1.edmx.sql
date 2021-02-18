
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/18/2021 13:30:17
-- Generated from EDMX file: C:\Users\kkalo\OneDrive\Documents\GitHub\Covid19-Cases-Management\Covid-Case-Management-System\Covid-Case-Management-System\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Covid19-CaseDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[newCovidCases]', 'U') IS NOT NULL
    DROP TABLE [dbo].[newCovidCases];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'newCovidCases'
CREATE TABLE [dbo].[newCovidCases] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Age] int  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Deseases] nvarchar(max)  NULL,
    [Date] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'newCovidCases'
ALTER TABLE [dbo].[newCovidCases]
ADD CONSTRAINT [PK_newCovidCases]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------