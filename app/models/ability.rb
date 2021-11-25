# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :to => :crud
      if user.admin?
        can :manage, :all
        can :access, :rails_admin
      elsif user.moderator?
        can :manage, :all
        cannot :access, :rails_admin
        cannot :destroy, Stock
      elsif user.anonymous?
        cannot :manage, :all
      else
        can :crud , Stock, user_id: user.id
      end
  end
end
