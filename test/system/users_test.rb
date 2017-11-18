require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "User can sign up" do
    sign_up
    assert_text 'Welcome! You have signed up successfully'
  end

  test "User's posts are collated in one place" do
    charlotte = User.first
    visit '/users/' + charlotte.id.to_s + '/posts'
    Post.where(user: charlotte).each do |post|
      assert_text post.headline
      assert_text post.description
    end
  end
end
