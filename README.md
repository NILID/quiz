# QUIZ
[![Build Status](https://travis-ci.org/NILID/quiz.svg?branch=main)](https://travis-ci.org/NILID/quiz)

This is a Ruby on Rails based quiz application.

# DEMO
There is a demo  [running on Heroku](https://quizavr.herokuapp.com/). Please feel free to explore.

There are 3 users with roles:
* administrator - s_admin@mail.me
* moderator     - s_moder@mail.me
* simple user   - s_user@mail.me

Passwords for all: 12345678

You can switch users (don't use in your production fork).

# Local
You can use example date, just run once:

    rake db:seed

It creates test users with different roles, themes, questions with answers in russian language.

# TODO
* Ability to create user with admin role
* Save stats in user model
* Get favorite user theme
* Get difficult level of question and theme
* Get difficult of round
* Parse questions from wikipedia or wikidata