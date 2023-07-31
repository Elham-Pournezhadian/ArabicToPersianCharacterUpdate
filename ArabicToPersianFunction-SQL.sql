CREATE FUNCTION	dbo.PersianArabicCharConvertor (@inputString nvarchar(max),@ConvertTo nvarchar(20)='Persian')
RETURNS nvarchar(max) WITH SCHEMABINDING, RETURNS NULL ON NULL INPUT
AS
BEGIN

---================================
-- Created By: Elham Pournezhadian
-- Created On: 98-03-25
-- Description: this functions convert Arabic characters to Persian in a string and vice versa
-- Example: dbo.PersianArabicCharConvertor (FirstName,'Persian') or dbo.PersianArabicCharConvertor (FirstName,'farsi')
---================================


       DECLARE @Answer nvarchar(255)
       
       SET @Answer=CASE 
              WHEN UPPER(@ConvertTo)=UPPER('arabic') THEN
                     --Convert To arabic
                     REPLACE(REPLACE(@inputString , NCHAR(1740), NCHAR(1610)),NCHAR(1705),NCHAR(1603))
              WHEN UPPER(@ConvertTo)=UPPER('persian') or UPPER(@ConvertTo)=UPPER('farsi') or UPPER(@ConvertTo)=UPPER('parsi') THEN
                     --Convert To Persian
                     REPLACE(REPLACE(@inputString , NCHAR(1610), NCHAR(1740)),NCHAR(1603),NCHAR(1705))
              ELSE
                     @inputString
       END

       RETURN @Answer
END
GO
