# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "newsroom"
set :repo_url, "git@github.com:chapmanu/newsroom.git"
set :deploy_to,   '/var/www/news'

# Ruby configuration
# Set Ruby version here.
set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, [:web]

# Linked paths
set :linked_files,     %w{config/secrets.yml.key config/database.yml}
set :linked_dirs,      %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Puma configuration: https://github.com/seuros/capistrano-puma
# These will be used to automatically generate and upload puma.rb file.
# Cap should use config/puma.rb to start puma. Confirm in cap output.
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_role, :web
