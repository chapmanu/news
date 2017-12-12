# Newsroom

Chapman University's news and stories website.


## Environment Specs
- Ruby >= 2.4.1
- Rails >= 5.1.4


## Setup

    git clone git@github.com:chapmanu/newsroom.git
    cd newsroom
    bundle install

    # Copy dist versions of config files into place
    cp -v config/secrets.yml{.dist,}
    cp -v config/database.yml{.dist,}


## Development
### Running local server
To start the local server, use webrick (puma is not configured to run locally):

    rails s webrick

Send browser to http://localhost:3000

### Running Tests
All tests:

    rake test

Individual test file:

    rake test TEST=test/controllers/ping_controller_test.rb
