# create a role named "admin"
admin_role = Role.create!(name: 'admin')

# create a role named "user"
Role.create!(name: 'user')


# create an admin user
admin_user = User.new(email: 'admin@admin.com',
                      first_name: 'Admin',
                      password: 'administrator',
                      password_confirmation: 'administrator',
                      confirmed_at: DateTime.now
)
admin_user.skip_confirmation!
admin_user.save!

# assign the admin role to the admin user.  (This bit of rails
# magic creates a user_role record in the database.)
admin_user.roles << admin_role
