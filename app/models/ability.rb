class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin? # Admin
      can :manage, :all
    else
      can :manage, User, id: user.id 
      can :read, Product, sold_date: nil
      can [:read, :create], Comment
    end     
  end

end