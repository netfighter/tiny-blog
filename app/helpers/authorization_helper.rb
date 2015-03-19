module AuthorizationHelper

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if cookies.signed[:guest_user_email]
        logging_in
        guest_user.try(:delete)
        cookies.delete :guest_user_email
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user
    # Cache the value the first time it's gotten.
    unless cookies.signed[:guest_user_email]
      cookies.permanent.signed[:guest_user_email] = create_guest_user.email
    end
    
    @cached_guest_user ||=
      User.find_by_email(cookies.signed[:guest_user_email])

  # if cookies.signed[:guest_user_email] invalid
  rescue ActiveRecord::RecordNotFound #
    cookies.delete :guest_user_email
    guest_user
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    # put all your processing for transferring
    # from a guest user to a registered user
    # i.e. update votes, update comments, etc.
  end

  # creates guest user by adding a record to the DB
  # with a guest name and email
  def create_guest_user
    u = User.create(first_name: "Guest", email: "guest_#{Time.now.to_i}#{rand(99)}@example.com", guest: true)
    u.skip_confirmation!
    u.save!(validate: false)
    u
  end

end
