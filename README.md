# Contour

Contour was a personal project I made during my apprenticeship at Brand New Box. The primary function of this app is to allow users to generate custom elevation profiles and topographic maps from their personal GPS data files. As a former mountain guide and lifetime outdoorsman, I was drawn to this idea by my passion for the intersection between data and backcountry exploration.

As a newcomer to Ruby on Rails, I found the process of developing this site extremely educational and rewarding. Although this site is not currently in production, I might come back to it in the future to enhance the customizability of the visualizations and overall design of the website.

In the meantime, feel free to explore the structure of my app and the beautiful elegance contained in the Ruby programming language!

## Setup Instructions
1. Clone this repo to your machine
2. Create a file to hold your development vars
  ```
    echo 'DATABASE_URL=postgres://postgres:password@postgresql:5432' > .docker-development-vars`
  ```
3. Install your dependencies
  ```
    docker-compose run app bundle
    docker-compose run app yarn install
  ```
4. Start the app
  ```
    docker-compose up
  ```
5. Create your databases
  ```
    docker-compose run app bundle exec rake db:create
    docker-compose run app bundle exec rake db:migrate
  ```
6. Good to go! 