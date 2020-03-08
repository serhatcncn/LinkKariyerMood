# **EER Diagram to Relational Model (MAPPING)**

## **1. Iteration**

**STEP 1**

MEMBER( MemberId, Fname, Lname, Password )

MEMBER_PROFILE( ProfileID, Mail, Phone, BDate, Sex, Address_ )

EDUCATION( EduId, EduName )

COURSE( CourseId, CourseName, CourseDesc, InstructorName )

CPROJECT( CProjectId, CProjectName )

GROUP_( GroupId, GroupName )

COMPANY( CompanyId, CompanyName, Location_ )

COMPANY_PROFILE( CProfileId, Founded, Website, Sector, CompDesc )

**STEP 2**

TALENT( TalentName, MemberId (FK) )

**STEP 3**

MEMBER_HAS_PROFILE( MemberId (FK), MProfileID (FK)(Unique) )

COMPANY_HAS_PROFILE( CompanyId (FK), CProfileId (FK)(Unique))

**STEP 4**

GROUP_( GroupId, GroupName , CreaterId(FK) )

CPROJECT( CProjectId, CProjectName, CourseId(FK) )

**STEP 5**

REFERENCE( MemberId(FK), MemberReferenceId(FK), RefType )

CHAT( MemberId(FK) , ChatterId(FK), ChatDate, Text_ )

VIEW_PROFILE( MemberId(FK), ViewerId(FK) )

CONNECT_MEMBER( MemberId(FK), ConnecterId(FK) )

JOIN_GROUP( MemberId(FK), GroupId(FK) )

MANAGE_GROUP( MemberId(FK), GroupId(FK) )

STUDY( MemberId(FK), SDate,EduId(FK),Department,Degree,Gpa,EDate )

ENROLL_COURSE( MemberId(FK), CourseId(FK), CGrade )

DO_CPROJECT( MemberId(FK), CProjectId(FK), CGrade)

CAREER( MemberId(FK), StartDate, CompId(FK), Title, EndDate )

**STEP 8**

COMPANY_USER( CUserId(FK) )

ACHIEVEMENT( AchievementId )

TEST_SCORE( AchId(FK), TestName,Score )

PROJECT( AchId(FK), ProjectName )

LANGUAGE_( AchId(FK), LanguageName )

CERTIFICATE_( AchId(FK), CertificateName )

INTEREST( InterestId, InterestType )

LEADER( InterestId(FK), LeaderId(FK) )

SCHOOL( InterestId(FK), SchollId(FK) )

INTEREST_COMPANY( InterestId(FK), CompanyId(FK) )

INTEREST_GROUP( InterestId(FK), GroupId(FK) )

**STEP 9**

BOOKMARK( BookmarkId )

PUBLISHED ( PublishedId, PublishedType, BookmarkId(FK) )

JOB_AD( JobAdId, JobTitle, JDesc, JLocation, BookmarkId(FK))

## **2. Iteration**

**STEP 3**

MANAGE( CUserID(FK), CompanyId(FK)(Unique) )

**STEP 4**

JOB_AD( JobAdId,JobTitle,JDesc,JLocation,BookmarkId(FK),CompanId(FK) )

**STEP 5**

SUCCESS( AchId(FK), MemberId(FK) )

HAS_INTEREST( InterestId(FK), MemberId(FK) )

SAVE_( BookmarkId(FK), MemberId(FK) )

SHARE( PublishedId(FK), MemberId(FK), ShareDate )

LIKE_( PublishedId(FK), MemberId(FK) )

COMMENT( PublishedId(FK), MemberId(FK), Text_ )

APPLY_JOBAD( JobAdId(FK), MemberId(FK), ApplyDate )

**STEP 8**

VIDEO( PublishedId(FK), VideoId )

EVENT_( PublishedId(FK), EventId )

IMAGE_( PublishedId(FK), ImageId )

ARTICLE( PublishedId(FK), ArticleId )
