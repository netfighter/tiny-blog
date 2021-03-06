# frozen_string_literal: true

# This support package contains modules for authenticaiting
# devise users for request specs.

# This module authenticates users for request specs.#
module ValidUserRequestHelper
  def sign_in_as_a_valid_user
    # ASk factory girl to generate a valid user for us.
    @user ||= FactoryBot.create :user

    # We action the login request using the parameters before we begin.
    # The login requests will match these to the user we just created in the factory, and authenticate us.
    post user_session_path, params: { 'user[email]' => @user.email, 'user[password]' => @user.password }
  end

  def sign_in_as_admin
    # ASk factory girl to generate a valid user for us.
    @user ||= FactoryBot.create :admin

    # We action the login request using the parameters before we begin.
    # The login requests will match these to the user we just created in the factory, and authenticate us.
    post user_session_path, params: { 'user[email]' => @user.email, 'user[password]' => @user.password }
  end
end

# Configure these to modules as helpers in the appropriate tests.
RSpec.configure do |config|
  # Include the help for the request specs.
  config.include ValidUserRequestHelper, type: :request
end
