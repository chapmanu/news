[ ![Codeship Status for chapmanu/newsroom](https://app.codeship.com/projects/2420a6d0-c0f0-0135-a758-46d9636eda61/status?branch=master)](https://app.codeship.com/projects/260251)

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
    cp -v config/database.yml{.dist,}

    # Set up databases and tables
    bundle exec rake db:setup

    # To clone data from production or staging
    bundle exec cap [environment] db:clone

    # Note: It may require you to run the following before running the db setup commands
    bin/rails db:environment:set RAILS_ENV=development

The master encryption key for Chapman can be found in Passpack. Place the key under `config/` in a new file called `secrets.yml.key`. You will need this key to run Newsroom locally and to run tests.

## Development
### Running local server
To start the local server, use webrick (puma is not configured to run locally):

    bundle exec rails s webrick

Send browser to http://localhost:3000

### Running Tests
All tests:

    rspec

Individual test file:

    rspec spec/controllers/home_controller_spec.rb

### Server Provisioning
Webserver provisioning is automated with [Ansible](https://www.ansible.com/). Requires minimum major Ansible version 2.4. See [Ansible page](https://wimops.chapman.edu/wiki/Ansible#Installation) on WimOps Wiki for installation instructions.

Playbooks must be run from the `ansible` directory:

    cd devops/ansible

To provision staging server:

    ansible-playbook webserver.yml -i hosts/staging
