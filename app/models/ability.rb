# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      elsif user.seller?
        can :create, [Product, Commerce]
        can [:update, :destroy], [Product, Commerce] do |item| 
          item.user == user
        end
      end
      can :read, [Product, Commerce]
    else
      can :read, [Product, Commerce]
    end
  end
end
