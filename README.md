# just-get-it

Web Application goals and requirements.

Main site:

Web pages
Sign up
Login
Edit Profile
Scheduling / Calendar integration with Google/Apple calendar
e-Commerce functionality for payment systems


Vendors / Third Party plugins required:

Stripe - e-commerce / payment system
Acquity - scheduling / calendar system

Business Requirements:

As a user, I can sign-up and create an account.
As a user, I can edit my profile.
As a user, I can sign up for appointments using a scheduling system.
As a user, I can pay my fees via Credit Card / ACH / other custom payment sytems (Venmo?)
As a user, I will get reminder emails concerning the appointments that I have set up.


As an admin, I can delete Users from the system.
As an admin, I can manually schedule or reschedule/cancel appointments.
As an admin, I can set my own prices.
As an admin, I can refund users.
As an admin, my payment structure is run through my own web app to avoid Acquity fees
As an admin, I can control my scheduling hours and associated details.
As an admin, I can set my own appointment types.

Technologies:

Backend - Ruby on Rails native
Frontend - Bootstrap5
Code repository - Github
PaaS Platform as a Service - Heroku


We're not sure how to point a free hobby version of Heroku's platform to a domain..but we should be able to on a higher tier plan. Let's try to keep it under $30/month maintenance fees including our vendors.
