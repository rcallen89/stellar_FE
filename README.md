Stellar

BE Mod 3 Week 4/5 Group Project

Stellar Heroku link; http://stellar-fe.herokuapp.com/

Application Description;
This idea comes from a fascination with space. The app is an informational tool for anyone who shares that fascination or cares to learn a little bit more about the expanse. We use several API calls that include current astronauts in space, the astronomy picture of the day, and information on solar system objects that are searchable by keyword. It can also take the users geolocation and give them information on sun and moon rise, illumination, and moon phase. We utilize a back end to consume the API's in an effective format, and a front end for displaying. We used Sinatra on the front end. The app uses Google OAuth to authenticate users. We also incorporated caching for faster load results.

API's used;
https://api.le-systeme-solaire.net/en/
http://open-notify.org/Open-Notify-API/People-In-Space/
https://api.nasa.gov/
https://www.worldweatheronline.com/developer/api/astronomy-api.aspx

User Roles;
Visitor - Unauthenticated, only able to see the welcome page with the image of the day.
USer - Authenticated, able to search all functionalities and save favorite solar system object.

The Gemfile also uses several gems to help assist with testing;
capybara
pry
rspec-rails
simplecov
shoulda-matchers

To Access Locally;
Fork and clone down the repo to your local machine.
Install Ruby 2.6.3
Install Rails 5.1.7
Run bundle install
Run bundle update
Run rake db:create
Run rake db:migrate

Project Collaborators;
Ryan Allen - https://github.com/rcallen89
Meghan Stovall - https://github.com/meghanstovall
Will Meighan - https://github.com/Will-Meighan
Ben Fox - https://github.com/benfox1216
