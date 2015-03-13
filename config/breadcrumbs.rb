crumb :root do
  link "Home", root_path
end

crumb :posts do
  link "Posts", posts_path
end

crumb :post do |post|
  link post.title, post_path(post)
  parent :posts
end

crumb :new_post do
  link "New post", new_post_path
  parent :posts
end

crumb :sign_in do
  link "Sign in", new_user_session_path
  parent :root
end

crumb :sign_up do
  link "Sign up", new_user_registration_path
  parent :root
end

crumb :reset_password do
  link "Reset password"
  parent :root
end

crumb :user do
  link "#{current_user.name}'s profile"
  parent :root
end
