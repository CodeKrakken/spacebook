require 'rails_helper'

RSpec.feature "Edit comments", type: :feature do

  scenario "user can edit comments" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello everyone"
    click_on "Submit"
    post = Post.find_by(message: "Hello everyone")
    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "I like your post!"
      click_on "Add Comment"
    end
    comment = Comment.find_by(message: "I like your post!")
    within("#comment_#{comment.id}") do
      click_on "Update"
    end
    fill_in "comment[message]", with: "I HATE your post!"
    click_on "Submit"
    expect(page).to have_css("#comment_#{comment.id}", text: "Gandalf The Grey: I HATE your post!")
    expect(page).to have_css('.header', text: "Your comment has been updated")
  end

  scenario "update link vanishes after 10 mins" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello, world!!"
    click_button "Submit"
    comment_creation_time = Time.now - 650
    Timecop.freeze(comment_creation_time)
    post = Post.find_by(message: "Hello, world!!")
    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "I like your post!!"
      click_on "Add Comment"
    end
    Timecop.return # "turn off" Timecop
    page.refresh
    comment = Comment.find_by(message: "I like your post!!")
    expect(page).to_not have_css("#comment_#{comment.id}", text: "Update")
  end

end
