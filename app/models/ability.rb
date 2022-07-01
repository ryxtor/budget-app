class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Group, user_id: user.id
    can :manage, Fee, user_id: user.id
    can :manage, GroupFee
  end
end
