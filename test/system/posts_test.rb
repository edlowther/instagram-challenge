require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit '/posts/new'
    fill_in 'headline', with: 'Testing, testing, 123'
    fill_in 'description', with: '456789'
    click_on 'Post...'
    assert_text "Testing, testing, 123"
    assert_text "456789"
  end
end
