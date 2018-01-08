
server "news-staging.chapman.edu", user: "deploy", roles: %w{web}

# Rbenv is under user.
set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, [:web]

# The git branch for staging
def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
  puts "Deploying branch #{branch}"
  branch
end

# Set the deploy branch to the current branch
set :branch, current_git_branch
