class ThemePolicy < ApplicationPolicy
  def new?
    @user && (@user.admin? || @user.moderator?)
  end

  def create?
    @user && (@user.admin? || @user.moderator?)
  end
end
