class Ability
  include CanCan::Ability

  def initialize(admin)
        can :manage, :all if admin.role == "super_user"
        can :manage, :all if admin.role == "deo"
        cannot :manage, :all if admin.role == "guest"
        can :create, Feedback if admin.role == "guest"
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
  end
end
