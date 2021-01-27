class ThemePolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    @user && (@user.admin? || @user.moderator?)
  end

  def create?
    @user && (@user.admin? || @user.moderator?)
  end
end
