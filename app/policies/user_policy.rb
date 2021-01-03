class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end

end
