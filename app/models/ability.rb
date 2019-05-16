# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :user
      can :read, :all
      can :create, Comment
      can :destroy, Comment do |comment|
        comment.try(:user) == user
      end
    end
  end
end
