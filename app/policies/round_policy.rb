class RoundPolicy < ApplicationPolicy
  def index?
    @user && (@user.admin? || @user.moderator?)
  end

  def show?
    !record.finished
  end

  def result?
    true
  end


  def new?
    true
  end
end
