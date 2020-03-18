# LinkKariyerMood
Designed a database model for the virtually integrated version of the popular web applications LinkedIn, Kariyer.net and Moodle.

---

## Aims of Each Applications
**LINKEDIN**

> The general purpose of the LinkedIn app is to become a social media app where users, companies and leaders come together. At the same time, companies to provide job advertisements, users to apply for these ads.

**KARIYER.NET**

> The general purpose of Kariyer.net application is to enable users to find and apply for jobs in their own fields. In this application, users prepare their resumes and apply to the job advertisements given by the companies.

**MOODLE**

> The general purpose of Moodle is to keep records of users' education life. The application allows the user to view the documents, projects, assignments and notes of his courses.

---

## How to We Integrated LinkedIn, Kariyer.Net and Moodle to Our Application?
  The users of our application have a profile. This profile allows you to share your educational life, work history and use of social media. At this point, the user can share content such as videos, photos, events and articles. User can connect with other users. The user can see what other users have shared and interact with these shares. The user can also add interests, achievements and talents to his profile. Our application can have a user profile as well as a profile of companies. A company profile is also managed by someone who is a user and Works in that company. Job ads can be shared on this company profile. Job ads can be viewed by users and users can apply for a job. Companies can review each user's profile and learn about users. Companies can send message to users and make a job offer.

LinkedIn, Kariyet.net and Moodle were used as references when creating our application. In this context, we created a profile section for the user and the company based on the profile section found in all three applications. We added the social media section on LinkedIn to our application as a published. We have also integrated areas of interest and grouping into our application. We combined the user and company parts of Kariyer.net with an asset inherited from the user in our application as company user. LinkedIn and Kariyer.Net includes resume section. We have handled the resume separately in 3 entities: Achievement, Talent and Education. As in Moodle, we have added the schools, departments, courses, projects and course's grades to Education entity. As in LinkedIn and Kariyer.Net, we integrated companies' job ad sharings to our app. As in LinkedIn, users can save shared posts and job ads. Users can message among themselves as in LinkedIn or companies can send messages to people as in Kariyer.Net. That's why we added a messaging section to our app.

---

* Database files, project details and EER Diagram in 'LinkKariyerMood' folder.
