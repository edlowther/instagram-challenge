require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "User can sign up" do
    sign_up
    assert_text 'Welcome! You have signed up successfully'
  end
end
