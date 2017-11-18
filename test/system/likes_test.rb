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
  test "can't like a post if not signed in" do
    charlotte = User.first
    post = Post.first
    visit '/users/' + charlotte.id.to_s + '/posts/' + post.id.to_s
    click_on 'Like'
    assert_text "Can't like a post if not signed in"
  end
  test "can't like a post more than once" do
    sign_up
    charlotte = User.first
    post = Post.first
    visit '/users/' + charlotte.id.to_s + '/posts/' + post.id.to_s
    click_on 'Like'
    click_on 'Like'
    assert_text "Can't like a post more than once"
  end
  test "post can be liked by multiple people" do
    sign_up
    charlotte = User.first
    post = Post.first
    visit '/users/' + charlotte.id.to_s + '/posts/' + post.id.to_s
    click_on 'Like'
    click_on "Logout"
    sign_up("ed2@test.com", "0987654")
    visit '/users/' + charlotte.id.to_s + '/posts/' + post.id.to_s
    click_on 'Like'
    click_on "Logout"
    sign_up("ed3@test.com", "11223344")
    visit '/users/' + charlotte.id.to_s + '/posts/' + post.id.to_s
    click_on 'Like'
    assert_text "3 likes"
  end
end
