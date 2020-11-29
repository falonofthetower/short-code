# Intial Setup

    docker-compose build
    docker-compose up mariadb
    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml build

# To run migrations

    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml run short-app-rspec rails db:test:prepare

# To run the specs

    docker-compose -f docker-compose-test.yml run short-app-rspec

# Run the web server

    docker-compose up

# Adding a URL

    curl -X POST -d "full_url=https://google.com" http://localhost:3000/short_urls.json

# Getting the top 100

    curl localhost:3000

# Checking your short URL redirect

    curl -I localhost:3000/abc

The Algorithm here didn't really seem to be optional. It is a simple
implementation of a bijective function allowing 62 characters to serve as an
iterative expansion of the id's for the created short urls.

https://en.wikipedia.org/wiki/Bijection#:~:text=In%20mathematics%2C%20a%20bijection%2C%20bijective,element%20of%20the%20first%20set.

There are freely available implementations of this which coincide with the
required construction based on the supplied specs. The only difference being the
ordering of the character set.

https://rubygems.org/gems/bijective/versions/1.0.1

The algorithm walks backwards using the supplied number and divding against the
base size of the character set determines the place in that set for the next
character. Adding that character to the result it then divides by the base. This
either reaches 0 and ends the loop or supplies the value for the next character
to place.

Optimzing would be be premature at this stage. Benchmarking 500,000 times the
difference between doing it for 1 and a 40 digit number only diverged by ~3
seconds.
