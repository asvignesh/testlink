-- 
-- $File:$
-- $Revision: 1.2 $
-- $Date: 2007/10/19 06:53:06 $
-- $Author: franciscom $
-- $Name: testlink_1_9_beta6 $
-- 
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
EXECUTE sp_rename N'dbo.builds.[open]', N'Tmp_is_open', 'COLUMN'
EXECUTE sp_rename N'dbo.builds.Tmp_is_open', N'is_open', 'COLUMN'
COMMIT