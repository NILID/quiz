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
    record.theme.questions_count > 0
  end
end
