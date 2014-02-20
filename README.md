#JobBoard



JobBoard is my first project with ruby on rails.
It is a system for companies and job applicants to communicate about job positions and requirements.

##About the System


It has three main users. Admin user for management of the systems, company user for job advertising and job applicants for applying jobs.

Company can sign up as a company user and post thier jobs on the job board. Also they can add information about their company. They can view the resumes of job applicant applied to their job.

Job applicants can view job posts and apply for it. Also they can post their resume. They can also search company information.

Admin can moderate all resources.

##Technical Notes

Rails version is 3.2.13, with postgres sql database.

*The system is written in a restful style controller actions.
*PDF printing of resumes with Prawn gem.
*Photo uploads with paperclip gem.
*Authorization with cancan gem
*Authentication with devise gem
*Total number of controllers = 18

##Note


I am using the repo as a backup for me.
I declare the license of this repo to be (MIT License)[http://en.wikipedia.org/wiki/MIT_License]
