# Use socket file rather than port for reverse proxy.
bind 'unix:///var/www/news/shared/tmp/sockets/puma.sock'

# Config / Log Paths
directory '/var/www/news/current'
rackup "/var/www/news/current/config.ru"
pidfile "/var/www/news/shared/tmp/pids/puma.pid"
state_path "/var/www/news/shared/tmp/pids/puma.state"
stdout_redirect '/var/www/news/current/log/puma.error.log', '/var/www/news/current/log/puma.access.log', true

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "staging" }

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Run process in background
daemonize

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/var/www/news/current/Gemfile"
end
