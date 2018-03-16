# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rbenv'
require 'capistrano/rails'
require 'capistrano/puma'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma # Default puma tasks

Dir.glob("lib/capistrano/tasks/*").each { |r| import r }
