# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    
    if user.role == 'super_admin'
      can :access, :rails_admin
    end

  end
end
