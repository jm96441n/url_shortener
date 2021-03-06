# README

## What is this?

This here is an url shortener. What is that you might ask? This is an app that let's you put in a really long website URL and get a short, easily shareable url back! Check it out in action [here](https://trohs.herokuapp.com/).

## Setup

So you want to run this locally? Alright! Here are the necessary steps you need to take to get yourself up and running:

#### 1. Pull Down Code

First things first, you need to get this code on your machine. 

In your terminal, navigate to the directory where you would like for this project to live. Once you get there run

```
git clone https://github.com/jm96441n/url_shortener.git
```

#### 2. Get into the directory and install dependencies

You've got the code on your machine? Awesome! Let's get it up and running. So first things first, cd into the file directory, should look something like this:
```
cd url_shortener
```

Now that you're in the file directory, you need to install the required gem dependencies. Do this by running:
```
bundle install
```

Note: We use Capybara Webkit to run some headless tests, if you don't already have this installed or have any doubts about running it check out their repo [here](https://github.com/thoughtbot/capybara-webkit). One of the dependecies for Capybara Webkit to run is to have qmake locally installed. For more information about installing qmake for use with Capybara Webkit checkout their wiki article about it [here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)

#### 3. Setup your local database

Alright, you've got the code locally and the dependencies installed, let's get your local database and you'll be good to go! To do this you need to run two commands in your terminal. 

First:
```
bin/rails db:create
```
Second:
```
bin/rails db:migrate
```

#### 4. Get your server running

Now that you're all set up code wise, the last step to get yourself running is to start up a server. To do this (in the directory you cloned the repo into) run:
 ```
 bin/rails server
 ```
 
 And that's it! You're all set to check this out locally, and do some development.
 
 #### 5. Running test suite
 
 Depending on how you're developing you have two options for running the test suite. 
 
 ##### 1. Using Guard (Continuous)
 
 If you would like your tests to continuously while you develop, run in your terminal:
 ```
 bundle exec guard
 ```
 This will run tests continuously as you update your tests and the files they are testing. For more information check out the Guard repo [here](https://github.com/guard/guard)
 
 ##### 2. Using RSpec (one off)
 
 If you would like to run all the tests just once, from within the directory run:
 ```
 bundle exec rspec
 ```
 
 If you would like to run only one of the test files, run:
 ```
 bundle exec rspec [PATH TO SPEC FILE]
 ```
 For more information on rspec, check out the repo [here](https://github.com/rspec/rspec-rails)
 
 
 ## Contributing
 
 Want to contribute? Check out this guide on contributing [here](https://trohs.herokuapp.com/). TLDR: Make a pull request on a feature branch, I'll check it out/review it before merging it. Thanks in advance for contributing!
