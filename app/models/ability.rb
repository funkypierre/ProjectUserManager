# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?

      if user.has_role? :admin
        can :manage, :all
      end

      if user.has_role? :employee
        can [:read, :create], [Project, Contact]
        can [:update, :destroy], [Project, Contact], user_id: user.id
      end

      if user.has_role? :visitor
        can :read, Project
      end
    end
  end
end
