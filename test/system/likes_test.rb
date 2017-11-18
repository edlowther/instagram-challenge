require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  test "like a post" do
    sign_up
    charlotte = User.first
    post = Post.first
    visit '/users/' + charlotte.id.to_s + '/posts/' + post.id.to_s
    click_on 'Like'
    assert_text '1 like'
  end
end
