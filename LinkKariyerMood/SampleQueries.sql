SELECT M.Fname, M.Lname, CHAT.Text_, MEMBER.Fname, MEMBER.Lname
FROM CHAT, MEMBER, MEMBER AS M
WHERE CHAT.MemberID=MEMBER.MemberId AND MEMBER.Fname='MURAT OSMAN' AND CHAT.ChatterId=M.MemberId
ORDER BY ChatterId DESC



SELECT CompanyName
FROM COMPANY
WHERE Location_='ANKARA'



SELECT AVG(S.GPA)
FROM STUDY S
WHERE S.Department = 'BILGISAYAR MUHENDISLIGI'



SELECT COUNT(COMPANY_PROFILE.CProfileId)
FROM COMPANY_PROFILE
WHERE Founded >= '2000-01-01'



SELECT C.CourseName, CP.CProjectName
FROM COURSE C INNER JOIN CPROJECT CP ON C.CourseId=CP.CourseId



SELECT CompanyName,JobTitle
FROM JOB_AD,COMPANY
WHERE JOB_AD.CompanyId=COMPANY.CompanyId and Jlocation='ISTANBUL'



SELECT *
FROM MEMBER, SUCCESS  LEFT JOIN CERTIFICATE_ ON  SUCCESS.AchId=CERTIFICATE_.AchId
			 LEFT JOIN PROJECT ON SUCCESS.AchId=PROJECT.AchId
			 LEFT JOIN TEST_SCORE ON SUCCESS.AchId=TEST_SCORE.AchId
			 LEFT JOIN LANGUAGE_ ON SUCCESS.AchId=LANGUAGE_.AchId
WHERE SUCCESS.MemberId=MEMBER.MemberId AND MEMBER.Fname='Fatih'



SELECT M.Fname, M.Lname, C.CompanyName, J.JobTitle
FROM MEMBER M, JOB_AD J JOIN VIEW_JOB_AD V ON V.JobAdId=J.JobAdId
			JOIN COMPANY C ON C.CompanyId=J.CompanyId
WHERE M.MemberId=V.MemberId AND NOT EXISTS(SELECT *
					   FROM APPLY_JOBAD A
					   WHERE V.MemberId=A.MemberId AND V.JobAdId=A.JobAdId)



SELECT MEMBER.Fname, MEMBER.Lname, STUDY.Department, EDUCATION.EduName,STUDY.StartDate, STUDY.EndDate 
FROM EDUCATION, STUDY, MEMBER
WHERE EDUCATION.EduName='Ege University' and MEMBER.MemberId=STUDY.MemberId and STUDY.EduId=EDUCATION.EduId



SELECT MEMBER.Fname, MEMBER.Lname, COMPANY.CompanyName, CAREER.EndDate
FROM MEMBER, CAREER, COMPANY
WHERE COMPANY.Location_='ANKARA' AND 
	  CAREER.EndDate is NULL AND 
	  CAREER.MemberId=MEMBER.MemberId AND 
	  CAREER.CompId=COMPANY.CompanyId



SELECT CompanyName, Location_, JobTitle
FROM JOB_AD AS J, COMPANY AS C
WHERE J.CompanyId=C.CompanyId AND EXISTS (SELECT value 
					  FROM STRING_SPLIT(J.JobTitle, ' ')
					  WHERE value IN (SELECT value FROM STRING_SPLIT('PROJE YONETICISI', ' ')))



SELECT M.Fname,M.Lname,J.Jdesc,C.CompanyName
FROM MEMBER M ,JOB_AD J,COMPANY C
WHERE J.CompanyId=C.CompanyId AND EXISTS(SELECT VALUE
					 FROM TALENT T,string_split(J.Jdesc,' ')
					 WHERE T.MemberId=M.MemberId AND value IN(SELECT VALUE
										  FROM string_split(T.TalentName,' ')))



SELECT M.MemberId,J.JobAdId, M.Fname,J.JReqCourse,J.Jdesc,C.CompanyName
FROM MEMBER M, APPLY_JOBAD A, 
	 (COMPANY C JOIN JOB_AD J ON C.CompanyId=J.CompanyId) JOIN 
	 (COURSE CO JOIN ENROLL_COURSE E ON CO.CourseId=E.CourseId) ON J.JReqCourse=CO.CourseName
WHERE M.MemberId=E.MemberId AND M.MemberId=A.MemberId AND A.JobAdId=J.JobAdId



SELECT M.Fname, M.Lname, CO.CompanyName, J.JobTitle, C.CourseName,
    CP.CProjectName, D.PGrade
FROM CPROJECT CP INNER JOIN COURSE C ON CP.CourseId=C.CourseId
		 	     INNER JOIN DO_CPROJECT D ON
     D.CProjectId=CP.CProjectId 
		 	     INNER JOIN MEMBER M ON M.MemberId=D.MemberId
		 	     INNER JOIN APPLY_JOBAD A ON A.MemberId=M.MemberId
		 	     INNER JOIN JOB_AD J ON J.JobAdId=A.JobAdId
		 	     INNER JOIN COMPANY CO ON CO.CompanyId=J.CompanyId 
WHERE C.CourseName=J.JReqCourse
ORDER BY D.PGrade



SELECT M.Fname, M.Lname, P.PublishedType, J.JobTitle
FROM MEMBER M, SAVE_ S LEFT JOIN PUBLISHED P ON S.BookmarkId=P.BookmarkId
		       LEFT JOIN JOB_AD J ON J.BookmarkId=S.BookmarkId
WHERE M.MemberId=S.MemberId
