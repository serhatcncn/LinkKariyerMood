CREATE TABLE MEMBER(
MemberId int NOT NULL,
Fname varchar(20),
Lname varchar(20),
Password_ varchar(20) NOT NULL,
Primary Key(MemberId));

CREATE TABLE MEMBER_PROFILE(
MProfileId int NOT NULL,
Mail varchar(30),
Phone varchar(20),
BDate date,
Sex varchar(1),
Address_ varchar(50),
Primary Key(MProfileId));

CREATE TABLE EDUCATION(
EduId int NOT NULL,
EduName varchar(50),
Primary Key(EduId));

CREATE TABLE COURSE(
CourseId int NOT NULL,
CourseName varchar(30),
CourseDesc varchar(50),
InstructorName varchar(50),
Primary Key(CourseId));

CREATE TABLE CPROJECT(
CProjectId int NOT NULL,
CProjectName varchar(30),
CourseId int NOT NULL,
Primary Key(CProjectId),
Foreign Key(CourseId) references COURSE(CourseId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE GROUP_(
GroupId int NOT NULL,
GroupName varchar(30),
CreaterId int NOT NULL,
Primary Key(GroupId),
Foreign Key(CreaterId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE COMPANY(
CompanyId int NOT NULL,
CompanyName varchar(30),
Location_ varchar(50),
Primary Key(CompanyId));

CREATE TABLE COMPANY_PROFILE(
CProfileId int NOT NULL,
Founded date,
Website varchar(30),
Sector varchar(30),
CompDesc varchar(50),
Primary Key(CProfileId));

CREATE TABLE TALENT(
TalentName varchar(30) NOT NULL,
MemberId int NOT NULL,
Primary Key (TalentName,MemberId),
Foreign Key(MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MEMBER_HAS_PROFILE(
MemberId int NOT NULL,
MProfileId int NOT NULL,
Primary Key(MemberId),
CONSTRAINT UN_MProfileId UNIQUE(MProfileId),
Foreign Key(MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key(MProfileId) references MEMBER_PROFILE(MProfileId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE COMPANY_HAS_PROFILE(
CompanyId int NOT NULL,
CProfileId int NOT NULL ,
Primary Key (CompanyId),
CONSTRAINT UN_CProfileId UNIQUE(CProfileId),
Foreign Key(CompanyId) references COMPANY(CompanyId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key(CProfileId) references COMPANY_PROFILE(CProfileId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE REFERENCE(
MemberId int NOT NULL,
MemberReferenceId int NOT NULL,
RefType varchar(20),
Primary Key(MemberId,MemberReferenceId),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberReferenceId) references MEMBER(MemberId));

CREATE TABLE CHAT(
MemberId int NOT NULL,
ChatterId int NOT NULL,
ChatDate date,
Text_ varchar(100),
Primary Key(MemberId,ChatterId),
Foreign Key(MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key(ChatterId) references MEMBER(MemberId));

CREATE TABLE VIEW_PROFILE(
MemberId int NOT NULL,
ViewerId int NOT NULL,
Primary Key(MemberId,ViewerId),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (ViewerId) references MEMBER(MemberId));

CREATE TABLE CONNECT_MEMBER(
MemberId int NOT NULL,
ConnecterId int NOT NULL,
Primary Key(MemberId,ConnecterId),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (ConnecterId) references MEMBER(MemberId));

CREATE TABLE JOIN_GROUP(
MemberId int NOT NULL,
GroupId int NOT NULL,
Primary Key(MemberId,GroupId),
Foreign Key (MemberId) references MEMBER(MemberId),
Foreign Key (GroupId) references GROUP_(GroupId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MANAGE_GROUP(
MemberId int NOT NULL,
GroupId int NOT NULL,
Primary Key(MemberId,GroupId),
Foreign Key (MemberId) references MEMBER(MemberId),
Foreign Key (GroupId) references GROUP_(GroupId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE STUDY(
MemberId int NOT NULL,
EduId int,
Department varchar(30),
Degree varchar(30),
GPA float,
StartDate date NOT NULL,
EndDate date,
Primary Key(MemberId,StartDate),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (EduId) references EDUCATION(EduId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE ENROLL_COURSE(
MemberId int NOT NULL,
CourseId int NOT NULL,
CGrade varchar(10),
Primary Key(MemberId,CourseId),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (CourseId) references COURSE(CourseId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE DO_CPROJECT(
MemberId int NOT NULL,
CProjectId int NOT NULL,
PGrade varchar(10),
Primary Key(MemberId,CProjectId),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (CProjectId) references CPROJECT(CProjectId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE CAREER(
MemberId int NOT NULL,
CompId int ,
Title varchar(30),
StartDate date NOT NULL,
EndDate date,
Primary Key(MemberId,StartDate),
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (CompId) references COMPANY(CompanyId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE COMPANY_USER(
CUserId int NOT NULL,
Primary Key(CUserId),
Foreign Key (CUserId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE ACHIEVEMENT(
AchievementId int NOT NULL,
Primary Key(AchievementId));

CREATE TABLE TEST_SCORE(
AchId int NOT NULL,
TestName varchar(30),
Score int,
Primary Key(AchId),
Foreign Key (AchId) references ACHIEVEMENT(AchievementId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE PROJECT(
AchId int NOT NULL,
ProjectName varchar(30),
Primary Key(AchId),
Foreign Key (AchId) references ACHIEVEMENT(AchievementId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE LANGUAGE_(
AchId int NOT NULL,
LanguageName varchar(30),
Primary Key(AchId),
Foreign Key (AchId) references ACHIEVEMENT(AchievementId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE CERTIFICATE_(
AchId int NOT NULL,
CertificateName varchar(30),
Primary Key(AchId),
Foreign Key (AchId) references ACHIEVEMENT(AchievementId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE INTEREST(
InterestId int NOT NULL,
InterestType varchar(50),
Primary Key(InterestId));

CREATE TABLE LEADER(
InterestId int NOT NULL,
LeaderId int NOT NULL,
Primary Key(InterestId),
Foreign Key (InterestId) references INTEREST(InterestId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (LeaderId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SCHOOL(
InterestId int NOT NULL,
SchoolId int NOT NULL,
Primary Key(InterestId),
Foreign Key (InterestId) references INTEREST(InterestId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (SchoolId) references EDUCATION(EduId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE INTEREST_COMPANY(
InterestId int NOT NULL,
CompanyId int NOT NULL,
Primary Key(InterestId),
Foreign Key (InterestId) references INTEREST(InterestId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (CompanyId) references COMPANY(CompanyId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE INTEREST_GROUP(
InterestId int NOT NULL,
GroupId int NOT NULL,
Primary Key(InterestId),
Foreign Key (InterestId) references INTEREST(InterestId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (GroupId) references GROUP_(GroupId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE BOOKMARK(
BookmarkId int NOT NULL,
Primary Key(BookmarkId));

CREATE TABLE PUBLISHED(
PublishedId int NOT NULL,
PublishedType varchar(10),
BookmarkId int ,
Primary Key(PublishedId),
Foreign Key (BookmarkId) references BOOKMARK(BookmarkId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE JOB_AD(
JobAdId int NOT NULL,
JobTitle varchar(50),
Jdesc varchar(50),
JReqCourse varchar(50),
Jlocation varchar(50),
CompanyId int NOT NULL,
BookmarkId int ,
Primary Key(JobAdId),
Foreign Key (BookmarkId) references BOOKMARK(BookmarkId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (CompanyId) references COMPANY(CompanyId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MANAGE(
CompanyId int NOT NULL,
CUserId int NOT NULL,
CONSTRAINT UN_CompanyId UNIQUE(CompanyId),
Primary Key(CUserID),
Foreign Key (CUserId) references COMPANY_USER(CUserId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (CompanyId) references COMPANY(CompanyId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SUCCESS(
AchId int NOT NULL,
MemberId int NOT NULL,
Primary Key(AchId,MemberId),
Foreign Key (AchId) references ACHIEVEMENT(AchievementId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE HAS_INTEREST(
InterestId int NOT NULL,
MemberId int NOT NULL,
Primary Key(InterestId,MemberId),
Foreign Key (InterestId) references INTEREST(InterestId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SAVE_(
BookmarkId int NOT NULL,
MemberId int NOT NULL,
SaveDate date,
Primary Key(BookmarkId,MemberId),
Foreign Key (BookmarkId) references BOOKMARK(BookmarkId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SHARE(
PublishedId int NOT NULL,
MemberId int NOT NULL,
ShareDate date,
Primary Key(PublishedId,MemberId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE LIKE_(
PublishedId int NOT NULL,
MemberId int NOT NULL,
Primary Key(PublishedId,MemberId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE COMMENT(
PublishedId int NOT NULL,
MemberId int NOT NULL,
Text_ varchar(140),
Primary Key(PublishedId,MemberId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE APPLY_JOBAD(
MemberId int NOT NULL,
JobAdId int NOT NULL,
ApplyDate date,
Primary Key(MemberId,JobAdId),
Foreign Key (JobAdId) references JOB_AD(JobAdId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE VIEW_JOB_AD(
MemberId int NOT NULL,
JobAdId int NOT NULL,
Primary Key(MemberId,JobAdId),
Foreign Key (JobAdId) references JOB_AD(JobAdId) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (MemberId) references MEMBER(MemberId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE VIDEO(
VideoId int NOT NULL,
PublishedId int NOT NULL,
Primary Key(PublishedId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE EVENT_(
EventId int NOT NULL,
PublishedId int NOT NULL,
Primary Key(PublishedId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE IMAGE_(
ImageId int NOT NULL,
PublishedId int NOT NULL,
Primary Key(PublishedId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE ARTICLE(
ArticleId int NOT NULL,
PublishedId int NOT NULL,
Primary Key(PublishedId),
Foreign Key (PublishedId) references PUBLISHED(PublishedId) ON DELETE CASCADE ON UPDATE CASCADE);