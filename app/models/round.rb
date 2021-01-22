class Round < ApplicationRecord
  before_create :create_answers_collection

  belongs_to :theme
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  serialize :answers_collection

  QUESTION_MAX = 10

  private

  def create_answers_collection
    self.answers_collection = Question.where(theme_id: self.theme_id).sample(QUESTION_MAX).pluck(:id)
  end
end