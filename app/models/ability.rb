class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :home, :static_page
    else
      cannot :read, :all
      can [:create, :show, :update], Exam, user_id: user.id
      can [:create, :index], Question
      can :read,Subject
      can :home, :static_page
    end
  end
end
