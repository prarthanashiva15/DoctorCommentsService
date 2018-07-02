# README

We want to move over some of our site functionality to a service oriented architecture. To accomplish that we want to
rewrite our “comment on your doctor” functionality into an HTTP service that will be used by your fellow engineers.
Please create an API that will allow your fellow engineers to leave a comment and rate a doctor.
We want to store at least the following:
- doctor_id
- comment_body
- created_at
- rating
- author_id
The service should have the ability to create, read, update, and mark a comment inactive.
Additionally when leaving a successful comment and review we would like this API to also return a short list of
recommended doctors to display to the users (think Netflix recommendations after reviewing a movie). We are
intentionally leaving the product requirements vague so that you can come up with your own requirements. That
being said, don’t go too crazy. Spend no more than 2-3 hours on it. We are excited to see what you can come up
with!
The database schema thus far is the following. Feel free to make any changes as you see fit.
doctors:
● doctor_id
● group_id
● name
● address
● latitude
● longitude
doctors_specialties:
● doctor_id
● specialty_id
specialties
● specialty_id
● name
Bonus Questions (Code, psuedo-code, or paragraph answers are
all acceptable):
How would you handle profanity filtering?
    What I understand from this question is that , I have some kind of code which has simply search 
    and replace/stop mechanism whenever the in-appropriate comment gets submitted by a user. 
    Maybe have a list of profanity words which can be imported in our local database.
    We are submitting the words that we will replace the profanities with on our own. 
    We more or less need a database of profanities, racial slurs and anything that's not exactly 
    rated PG-13 to get triggered.
    
    I am also pretty sure that there must already be a software/api which also does because it is quite 
    a common feature to need.
    
    But at the end of day this is a very very subjective and relative to perspective feature to
    implement and there is no right or wrong way to implement this feature.
    Because what might be profane to one might be acceptable to another.
    

How would you handle security and authentication?
    This is again a very vast topic , so I would just say ways we can make sure that a malicious
    script or user is not able to break our system.
    1)Throttle Requests
        The easiest thing an attacker can do to compromise your users is to guess their login 
        credentials with a script. Users won’t always choose good passwords, so given enough time, 
        an attacker’s script will likely be able to compromise a significant number of your users just
        by making a large number of guesses based on password lists.
        One can make it hard for attackers to do this by restricting the type and number of requests
        that can be made to the app within a predefined time period.
    2)Set up your security headers correctly
      Even though you probably serve requests over HTTPS, you might be vulnerable to a 
      particular type of Man in the Middle attack known as SSL Stripping.
      The Strict-Transport-Security header is meant to prevent this type of attack. By including
      the Strict-Transport-Security header (aka the HTTP Strict Transport Security or HSTS header) 
      in its response, a server can tell a browser to only communicate with it via https. 
    3)Restricted Password Hash Access
      Restricted Password Hash Access uses a completely separate table to store password hashes, 
      and this table is not accessible to the rest of the application. This does this by setting up
      two database accounts. Password hashes are stored in a table that only a method has access to,
      and app is given access to a database function that uses method to check if a password hash
      matches a given account. This way, even if an SQL injection vulnerability exists in your app, 
      an attacker will not be able to directly access your users’ password hashes.
    4)User Specific Tokens
       Restricted Password Hash Access not only stores password reset and other sensitive tokens in 
       separate tables, it also prepends every token with an account ID. 
    5)Secure the Rest of Your App
       Authentication does not stand in isolation. Vulnerabilities in the rest of your app have the 
       potential to bypass any security measures you might have built into your authentication system.
       Cross Site Scripting (XSS) vulnerability is also a major problem.
  
        
 How would you handle functionality where all comments went through an admin approval phase before going live?
    What I would do , is that all comments posted would stay in a table with a flag admin_approved
    with the default of false.
    When Admin logs in they can select a doctor to review the comments or review all comments in general.
    When they approve a comment  the flag admin_approved gets marked to true.
    We only show comments on the live site which have this flag marked as true.
    This is a good way to handle profanity filtering.
