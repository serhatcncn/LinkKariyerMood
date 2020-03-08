CREATE OR ALTER TRIGGER CONNECT_DELETE_TRIGGER
ON MEMBER INSTEAD OF DELETE 
AS 
BEGIN
	SET NOCOUNT ON
	DELETE FROM CONNECT_MEMBER WHERE ConnecterId IN (SELECT MemberId FROM DELETED);
	DELETE FROM VIEW_PROFILE WHERE ViewerId IN (SELECT MemberId FROM DELETED);
	DELETE FROM REFERENCE WHERE MemberReferenceId IN (SELECT MemberId FROM DELETED);
	DELETE FROM CHAT WHERE ChatterId IN (SELECT MemberId FROM DELETED);
	DELETE FROM MEMBER_PROFILE WHERE MProfileId IN(SELECT MProfileId FROM deleted,MEMBER_HAS_PROFILE WHERE deleted.MemberId=MEMBER_HAS_PROFILE.MemberId);
	DELETE FROM JOIN_GROUP WHERE MemberId IN(SELECT MemberId FROM DELETED);
	DELETE FROM MANAGE_GROUP WHERE MemberId IN(SELECT MemberId FROM DELETED);
	DELETE FROM MEMBER WHERE MemberId IN (SELECT MemberId FROM DELETED);	
END;

GO

CREATE OR ALTER TRIGGER END_DATE_CAREER_TRIGGER
ON CAREER INSTEAD OF INSERT
AS 
DECLARE @memberId int
DECLARE @compId int
DECLARE @title varchar
DECLARE @startDate date
DECLARE @endDate date

SELECT @memberId=i.MemberId, @compId=i.CompId, @title=i.Title, @startDate=i.StartDate, @endDate=i.EndDate
FROM inserted i
WHERE NOT EXISTS (SELECT C.EndDate
	FROM CAREER C
	WHERE C.MemberId=i.MemberId and C.EndDate IS NULL)

INSERT INTO CAREER(MemberId,CompId,Title,StartDate,EndDate) VALUES(@memberId,@compId,@title,@startDate,@endDate)

GO

CREATE OR ALTER TRIGGER END_DATE_STUDY_TRIGGER
ON STUDY INSTEAD OF INSERT
AS 
DECLARE @memberId int
DECLARE @eduId int
DECLARE @dept varchar
DECLARE @startDate date
DECLARE @endDate date

SELECT @memberId=i.MemberId ,@eduId=i.EduId,@dept=i.Department,@startDate=i.StartDate,@endDate=i.EndDate
FROM inserted i
WHERE NOT EXISTS (SELECT S.EndDate
	FROM STUDY S
	WHERE S.MemberId=i.MemberId and S.EndDate IS NULL)

INSERT INTO STUDY(MemberId,EduId,Department,StartDate,EndDate) VALUES(@memberId,@eduId,@dept,@startDate,@endDate)

GO

CREATE OR ALTER TRIGGER MANAGE_TRIGGER
ON MANAGE INSTEAD OF INSERT
AS 
DECLARE @companyId int
DECLARE @cuserId int

SELECT @companyId=i.CompanyId ,@cuserId=i.CUserId
FROM inserted i
WHERE EXISTS (SELECT C.MemberId
	FROM CAREER C
	WHERE c.MemberId=i.CUserId and c.EndDate IS NULL)

INSERT INTO MANAGE(CompanyId,CUserId) VALUES(@companyId,@cuserId);

GO

CREATE TRIGGER CONNECT_MEMBER_TRIGGER
ON CONNECT_MEMBER INSTEAD OF INSERT
AS
DECLARE @memberId int
DECLARE @connecterId int

SELECT @memberId=i.MemberId,@connecterId=i.ConnecterId
FROM inserted i

INSERT INTO CONNECT_MEMBER(MemberId,ConnecterId) VALUES(@memberId,@connecterId)
INSERT INTO CONNECT_MEMBER(MemberId,ConnecterId) VALUES(@connecterId,@memberId)

GO

CREATE TRIGGER DO_CPROJECT_TRIGGER 
ON DO_CPROJECT INSTEAD OF INSERT
AS
DECLARE @memberId int
DECLARE @projId int
DECLARE @Pgrade varchar(10)

SELECT @memberId=i.MemberId,@projId=i.CProjectId,@Pgrade=i.PGrade
FROM inserted i
WHERE EXISTS(
	SELECT *
	FROM ENROLL_COURSE E,CPROJECT C
	WHERE i.MemberId=E.MemberId and E.CourseId=C.CourseId and C.CProjectId=i.CProjectId)

INSERT INTO DO_CPROJECT(MemberId,CProjectId,PGrade) VALUES(@memberId,@projId,@Pgrade)

GO

create trigger INTEREST_LEADER_TRIGGER ON LEADER
INSTEAD OF INSERT
AS
	set nocount on
DECLARE @interestId int
DECLARE @leaderID varchar(50)
SELECT @interestId=i.InterestId,@leaderID=i.LeaderId
from inserted i
where i.InterestId IN(select I.InterestId  from INTEREST I where I.InterestType='leader')
insert into LEADER(InterestId,LeaderId) values(@interestId,@leaderID);

GO

CREATE TRIGGER INTEREST_SCHOOL_TRIGGER ON SCHOOL
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @interestId int
	DECLARE @schoolID varchar(50)
SELECT @interestId=i.InterestId,@schoolID=i.SchoolId
FROM inserted i
WHERE i.InterestId IN(SELECT I.InterestId  FROM INTEREST I WHERE I.InterestType='education')
INSERT INTO SCHOOL(InterestId,SchoolId) values(@interestId,@schoolID);

GO

CREATE TRIGGER INTEREST_GROUP_TRIGGER ON INTEREST_GROUP
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @interestId int
	DECLARE @groupID varchar(50)
SELECT @interestId=i.InterestId,@groupID=i.GroupId
FROM inserted i
WHERE i.InterestId IN(SELECT I.InterestId  FROM INTEREST I WHERE I.InterestType='group')
INSERT INTO INTEREST_GROUP(InterestId,GroupId) values(@interestId,@groupID);

GO

CREATE TRIGGER INTEREST_COMPANY_TRIGGER ON INTEREST_COMPANY
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @interestId int
	DECLARE @compID varchar(50)
SELECT @interestId=i.InterestId,@compID=i.CompanyId
FROM inserted i
WHERE i.InterestId IN(SELECT I.InterestId  FROM INTEREST I WHERE I.InterestType='company')
INSERT INTO INTEREST_COMPANY(InterestId,CompanyId) values(@interestId,@compID);

GO

CREATE TRIGGER PUBLISHED_VIDEO_TRIGGER ON VIDEO
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @publishedId int
	DECLARE @videoID varchar(50)
SELECT @publishedId=i.PublishedId,@videoID=i.VideoId
FROM inserted i
WHERE i.PublishedId IN(SELECT P.PublishedId  FROM PUBLISHED P WHERE P.PublishedType='video')
INSERT INTO VIDEO(PublishedId,VideoId) values(@publishedId,@videoID);

GO

CREATE TRIGGER PUBLISHED_EVENT_TRIGGER ON EVENT_
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @publishedId int
	DECLARE @eventID varchar(50)
SELECT @publishedId=i.PublishedId,@eventID=i.EventId
FROM inserted i
WHERE i.PublishedId IN(SELECT P.PublishedId  FROM PUBLISHED P WHERE P.PublishedType='event')
INSERT INTO EVENT_(PublishedId,EventId) values(@publishedId,@eventID);

GO

CREATE TRIGGER PUBLISHED_IMAGE_TRIGGER ON IMAGE_
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @publishedId int
	DECLARE @imageID varchar(50)
SELECT @publishedId=i.PublishedId,@imageID=i.ImageId
FROM inserted i
WHERE i.PublishedId IN(SELECT P.PublishedId  FROM PUBLISHED P WHERE P.PublishedType='image')
INSERT INTO IMAGE_(PublishedId,ImageId) values(@publishedId,@imageID);

GO

CREATE TRIGGER PUBLISHED_ARTICLE_TRIGGER ON ARTICLE
INSTEAD OF INSERT
AS
	SET NOCOUNT ON
	DECLARE @publishedId int
	DECLARE @articleID varchar(50)
SELECT @publishedId=i.PublishedId,@articleID=i.ArticleId
FROM inserted i
WHERE i.PublishedId IN(SELECT P.PublishedId  FROM PUBLISHED P WHERE P.PublishedType='article')
INSERT INTO ARTICLE(PublishedId,ArticleId) values(@publishedId,@articleID);