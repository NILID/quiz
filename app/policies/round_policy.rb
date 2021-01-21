class RoundPolicy < ApplicationPolicy
  def index?
    true
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
