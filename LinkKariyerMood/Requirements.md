
# **Requirements for EER Diagram**

1) MEMBER

Each member has first name, last name, user id and password properties.

2) CONNECT_MEMBER ( MEMBER – MEMBER )

Members can connect to each other. Members can have more than one member.

3) VIEW_PROFILE ( MEMBER – MEMBER )

Members can view each other's profiles.

4) CHAT ( MEMBER – MEMBER )

Members can message each other. The date on which the messages are posted and the contents of the message are recorded.

5) REFERENCE ( MEMBER – MEMBER )

Members can be reference to each other.

6) MEMBER_PROFILE

Each member has a profile. Address, Phone Number, Mail, Birth Date, Sex are kept in this profile.

7) MEMBER_HAS_PROFILE ( MEMBER – MEMBER_PROFILE )

Each member must have only one profile. Each profile must belong to one member.

8) EDUCATION

The education section holds schools registered in the system.

9) STUDY ( MEMBER – EDUCATION )

Members can have more than one educational life. Schools can have more than one member registered. In this section, the department where the member is located, his / her degree, grade point average (if he / she graduated) and the dates when the member starts and finishes the education are recorded.

10) COURSE

The name of the courses in the system, the content and the course instructor are kept.

11) ENROLL_COURSE ( MEMBER – COURSE )

Members can register for more than one course. Courses can host more than one member. In this section, the grade of the course member is recorded.

12) CPROJECT

Each course project has a name in the system.

13) HAS_CPROJECT ( COURSE - PROJECT )

Courses can have multiple projects. If there is one or more projects, it must be connected to one course.

14) DO_CPROJECT ( MEMBER - PROJECT )

Members can make more than one project. Projects can have more than one member. Project notes of the members are kept in this section.

15) COMPANY_USER

There are two accounts in the system. Company account users inherit from normal users.

16) COMPANY

Name and location information of companies are recorded in the system.

17) MANAGE( COMPANY_USER - COMPANY )

Company accounts must be managed by a company user. Company Users must manage a company account.

18) COMPANY_PROFILE

In this section, the profile information of the companies is kept. This information; website, founded, sector and company descriptions.

19) COMPANY_HAS_PROFILE ( COMPANY - COMPANY_PROFILE )

Each company account must have only one profile. Each company profile must also belong to a company account.

20) CAREER ( MEMBER – COMPANY )

Members may have a career in more than one company. In these companies, more than one member can make a career. In this section; the position of the members in the company, the date on which the company commenced their career and the dates on which the company terminates their career are kept.

21) JOB_AD

There are job advertisements in the system. In this section, the description of job advertisements, the position for which it is required, the course it requires and the position of the job advertisement are kept.

22) CREATE ( COMPANY - JOB_AD )

A company can advertise more than one job. Job advertisements must be linked to a company.

23) VIEW_JOBAD ( MEMBER - JOBAD )

Members can view job ads. Job advertisements can appear to more than one member.

24) APPLY_JOBAD ( MEMBER - JOB_AD )

Members can apply for job advertisements. More than one member application can be submitted for job advertisements. Application dates of the members are recorded in the system.

25) PUBLISHED

All published posts are kept in the system. These posts are of types. The types of these posts must be video, image, event or article. Only one of these types can be published instantly in the system.

26) LIKE ( MEMBER – PUBLISHED )

Members may like their posts. Posts can also be liked by members.

27) SHARE ( MEMBER - PUBLISHED )

Members can share one or more posts. Each shared post must belong to one member. The dates that members share posts are recorded in the system.

28) COMMENT ( MEMBER – PUBLISHED )

Members can comment on posts. Members can comment one or more posts.

29) BOOKMARK

Shares and job ads in the system can be saved. This is the section where saved job ads and shared posts are held.

30) SAVE ( MEMBER – BOOKMARK )

Members can save posts and job ads shared in the system. If there is a registered post or job ad in the system, it must belong to a member. In this section, the date on which members register their posts and job advertisements is kept.

31) TALENT

It is the area where the talents of the members are kept. In order to find talent data, a member is required.

32) HAS_TALENT ( MEMBER – TALENT )

Members can have more than one ability. If there is a talent, it must belong to a member.

33) ACHIEVEMENT

It is the entity where successes are kept in the system. These achievements; Test Score, Project, Language and Certificate. This entity must be at least one of the success types.

34) SUCCESS ( MEMBER – ACHIEVEMENT )

A member can have one or more successes. Achievements can belong to more than one member.

35) GROUP

This entity records the group names that exist in the system.

36) CREATE ( MEMBER – GROUP )

A member can established one or more group. Groups must be established by a member.

37) MANAGE ( MEMBER – GROUP )

Members can manage multiple groups. Groups must be managed by one or more members.

38) JOIN ( MEMBER – GROUP )

Members may join one or more group. One or more members must join the groups.

39) INTEREST

It is the entity where the areas of interest of the users are kept. These interests include; Leader, Group, School and Company. In the system, this entity has to record only one of these interests instantly.

40) HAS_INTEREST ( MEMBER – INTEREST )

Members may have one or more interests. Interests may belong to more than one member.
