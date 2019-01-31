# BikeShare
### A Ruby on Rails e-commerce and database analytics site for bike commuters
[__Visit this project on Heroku!__](https://bike-share-project.herokuapp.com/)

### Tools used:
This is the final project for Module 2 of the Back End program at Turing School of Software and Design. To complete this project, our group demonstrated proficiency in the following:
* Ruby on Rails
* ActiveRecord
* Postgresql database
* Rspec

### Description
BikeShare provides analytic information on local bike use that empowers commuters to ditch their cars. Users can access weather, past trip, and station data as well as an e-commerce platform to purchase bike accessories.

### Database Schema
<img width="1319" alt="screen shot 2018-12-03 at 11 45 23 am" src="https://user-images.githubusercontent.com/39714935/49394518-5a757b00-f6f1-11e8-9a11-f5b99fe1af48.png">

### Features
* Analysis and display of San Francisco bike share data from seed files
* Sessions implementation to persist an unregistered or unauthenticated user's shopping cart
* Site access differentiated by user role
* User authentication supported by the __bcrypt__ gem, which gives the user access to shopping cart checkout, their account information, and analytics dashboards for easy trip planning.
* Admin authorization provides access to create, edit, and remove bike store items, bike stations, and trip or weather records. Admin can access all bike store orders for all users. 

### Current Test Coverage
This project was built using Test Driven Development.
<img width="1423" alt="screen shot 2018-12-03 at 11 59 52 am" src="https://user-images.githubusercontent.com/39714935/49395259-3a46bb80-f6f3-11e8-9f21-f8575cd09672.png">




