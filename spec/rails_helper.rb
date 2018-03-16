ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
ActiveRecord::Migration.maintain_test_schema!

# No network connections allowed in the tests
WebMock.disable_net_connect!(:allow_localhost => true)

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.color = :enabled

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.order = :random
  Kernel.srand config.seed

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.before(:each, js: true) do
    # block unnecessary external requests to speed up tests and prevent false failures
    page.driver.browser.url_blacklist = ["http://use.typekit.net"]
  end

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
end
