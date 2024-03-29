﻿/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Id]
      ,[Crew]
      ,[Route]
      ,[Location].Lat,[Location].Long
      ,[LastSignal]
      ,[IsFinished]
      ,[LastBroadcast]
	  , 'https://www.google.co.uk/maps/place/@'+cast([Location].Lat as nvarchar(10))+','+cast([Location].Long as nvarchar(10))+',17z/data=!3m1!4b1!4m2!3m1!1s0x0:0x0?hl=en' as url
  FROM [DB_99578_ears].[dbo].[Callout]
  order by id desc
  
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 
	  'https://www.google.co.uk/maps/place/@'+cast([Location].Lat as nvarchar(10))+','+cast([Location].Long as nvarchar(10))+',17z/data=!3m1!4b1!4m2!3m1!1s0x0:0x0?hl=en' as url, [Location].Lat,[Location].Long,  *
  FROM [DB_99578_ears].[dbo].users
  order by lastseenon desc
