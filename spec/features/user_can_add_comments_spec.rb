require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do

  scenario "user can add comment to own post" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello everyone"
    click_on "Submit"

    post = Post.find_by(message: "Hello everyone")

    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "I like your post!"
      click_on "Add Comment"
    end
    expect(page).to have_css("#post_#{post.id}", text: "Gandalf The Grey: I like your post!")

  end

  scenario "user can add comment to another person's post" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello everyone"
    click_on "Submit"
    click_on "Sign out"
    sign_up_second_user
    post = Post.find_by(message: "Hello everyone")

    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "I like your post!"
      click_on "Add Comment"
    end
    expect(page).to have_css("#post_#{post.id}", text: "Gandalf Jr The Grey Jr: I like your post!")

  end

  scenario "multiple users can add comment to another person's post" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello everyone"
    click_on "Submit"
    post = Post.find_by(message: "Hello everyone")

    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "I do not like your post!"
      click_on "Add Comment"
    end

    click_on "Sign out"
    sign_up_second_user

    within("#post_#{post.id}") do
      fill_in "comment[message]", with: "Thanks"
      click_on "Add Comment"
    end
    expect(page).to have_css("#post_#{post.id}", text: "Gandalf The Grey: I do not like your post!")
    expect(page).to have_css("#post_#{post.id}", text: "Gandalf Jr The Grey Jr: Thanks")
  end


end



