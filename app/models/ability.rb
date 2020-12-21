# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #   user ||= User.new
    case user.role
    when "admin"
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, :all
    when "host"
      can :access, :rails_admin
      can :read, :dashboard
      can :read, House, :user_id => user.id
      can :update, House, :user_id => user.id
      can :show_in_app, House, :user_id => user.id
      can :destroy, House, :user_id => user.id
      can :create, House

      can :read, Care, :host_id => user.id
      can :update, Care, :host_id => user.id
      can :destroy, Care, :host_id => user.id
      can :read, User
    when "user"
      return
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
