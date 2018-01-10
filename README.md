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

The master encryption key can be found in Passpack. Place the key under `config/` in a new file called `secrets.yml.key`. You will need this key to run Newsroom locally and to run tests.

## Development
### Running local server
To start the local server:

    bundle exec rails s

Send browser to http://localhost:3000

### Running Tests
All tests:

    bundle exec rake test

Individual test file:

    bundle exec rake test TEST=test/controllers/ping_controller_test.rb

### Server Provisioning
Webserver provisioning is automated with [Ansible](https://www.ansible.com/).

Playbooks must be run from the `ansible` directory:

    cd devops/ansible

To provision staging server:

    ansible-playbook webserver.yml -i hosts/staging
