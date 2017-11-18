require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "User can sign up" do
    visit '/users/sign_up'
    fill_in 'Email', with: 'ed@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    assert_text 'Welcome! You have signed up successfully'
  end
end
