require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

DatabaseCleaner.strategy = :transaction
class Minitest::Spec
  around do |tests|
    DatabaseCleaner.cleaning(&tests)
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def sign_up(email='ed@test.com', password='123456')
  visit '/users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_on 'Sign up'
end
