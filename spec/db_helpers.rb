def add_posts_to_database
  user = create(:user)
  user.posts.create(message: "hello")
  user.posts.create(message: "world")
  user.posts.create(message: "Bye")
end
