module ApplicationCable
  class Channel < ActionCable::Channel::Base
    delegate :session, :ability, to: :connection

    # dont allow the clients to call those methods
    protected :session, :ability
  end
end  
