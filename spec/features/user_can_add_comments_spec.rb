require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do

  scenario "user can add comment to post" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello everyone"
    click_on "Submit"

    post = Post.find_by(message: "Hello everyone")

    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "I like your post!"
      click_on "Add Comment"
    end
    expect(page).to have_css("#post_#{post.id}", text: "Gandalf The Grey: I like your post!")
    # expect(page).to css_"Gandalf Jr The Grey Jr: I like your post!"
  end
end



# click_on "Sign out"
# sign_up_second_user
