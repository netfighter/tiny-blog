module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end

    def ability
      @ability ||= Ability.new(current_user)
    end

    protected
    def find_verified_user
      User.find_by(id: session['warden.user.user.key'][0][0]) if session['warden.user.user.key']
    end
  end
end  
