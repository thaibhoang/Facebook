Project: Rails Final Project
Ruby on Rails Course
Introduction
You’ve come a long way, congratulations! At this point, you should feel comfortable with building new Rails applications, modelling data, and working with forms. This project will require you to put all your newfound knowledge to the test. It should serve as a great portfolio piece for what you’re capable of. It’ll take some thought and time but it’s certainly within reach of your skills.

You’ll be building a clone of a social media site, such as Facebook, X, Myspace, or Threads. As with our previous lessons, how much effort you want to put into the styling and front end is up to you. The important stuff is the data and backend. You’ll put together the core features of the platform like users, profiles, posts, following, and “liking”.

You’ll also implement some form of authentication. Ideally, you’ll want to use OmniAuth to support authenticating via the social media site you’re cloning, but some sites (such as Facebook), have recently made this process impossible. If this is the case for your site, you can use Devise to support authenticating via username and password (using Devise) or via Github with omniauth-github.

There will probably be features you haven’t been exposed to – for instance chat, realtime updates of the newsfeed, and realtime notifications. You won’t be responsible for creating those unless you’d like to jump ahead and give it a shot.

Assignment
Build a social media site! You’ll build a large portion of the core user functionality of your chosen site in this project. You don’t have to worry about some of the more flashy front-end stuff unless you want to, but you don’t need it to get a nice user experience.

You should write at least a basic set of integration tests which let you know if each page is loading properly and unit tests to make sure your associations have been properly set up (e.g. testing that User.first.posts works properly). Run them continuously in the background with Guard (See the Ruby on Rails Tutorial Chapter 3.7.3).

This project will give you a chance to take a relatively high level set of requirements and turn it into a functioning website. You’ll need to read through the documentation on GitHub for some of the gems you’ll be using.

Keep the following requirements in mind. We’ll cover specific steps to get started below this list:

Use PostgreSQL for your database from the beginning (not SQLite3), that way your deployment will go much more smoothly.
Users must sign in to see anything except the sign in page.
User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods. See the Railscast (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.
Users can send follow requests to other users.
Users can create posts (begin with text only).
Users can like posts.
Users can comment on posts.
Posts should always display the post content, author, comments, and likes.
There should be an index page for posts, which shows all the recent posts from the current user and users they are following.
Users can create a profile with a profile picture. You may be able to get the profile picture when users sign in using OmniAuth. If this isn’t the case you can use Gravatar to generate the photo.
A user’s profile page should contain their profile information, profile photo, and posts.
There should be an index page for users, which shows all users and buttons for sending follow requests to users the user is not already following or have a pending request.
Set up a mailer to send a welcome email when a new user signs up. Use the letter_opener gem (see docs here) to test it in development mode.
Deploy your App to a hosting provider.
Set up an email provider and start sending real emails.
Extra credit
Make posts also allow images (either just via a URL or, more complicated, by uploading one).
Use Active Storage to allow users to upload a photo to their profile.
Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
Style it up nicely! We’ll dive into HTML/CSS in the next course.
Getting started
Think through the data architecture required to make this work. There are a lot of models and a lot of associations, so take the time to plan out your approach.
Build the new PostgreSQL Rails app $ rails new odinbook --database=postgresql, initialize the Git repo and update the README to link back to this page.
Work your way down the list above! Each step will involve a new challenge but you’ve got the tools.
You can populate data like users and posts using the Faker gem, which is basically just a library of sample names and emails. It may just be easier, though, for you to write your own seeds in the db/seeds.rb file, which gets run if you type $ rake db:seed.
Final step
Before you move on, we would like your feedback here. Getting user(you) feedback is important so we can continue to improve the curriculum and get an idea of your experience.

Link to The Odin Project: https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project