class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      cannot :read, :all
      can [:create, :show, :update], Exam, user_id: user.id
    end
  end
end
