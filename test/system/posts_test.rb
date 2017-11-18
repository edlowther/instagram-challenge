require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "cannot post if not signed in" do
    visit '/posts/new'
    fill_in 'headline', with: 'Testing, testing, 123'
    fill_in 'description', with: '456789'
    click_on 'Post...'
    assert_text "Cannot post if not signed in"
  end
  test "posts successfully if signed in" do
    sign_up
    visit '/posts/new'
    fill_in 'headline', with: 'Testing, testing, 123'
    fill_in 'description', with: '456789'
    click_on 'Post...'
    assert_text "Testing, testing, 123"
    assert_text "By ed@test.com"
    assert_text "456789"
  end
end
