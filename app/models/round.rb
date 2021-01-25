class Round < ApplicationRecord
  before_create :create_questions_collection

  belongs_to :theme
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  serialize :questions_collection

  QUESTION_MAX = 10

  private

  def create_questions_collection
    self.questions_collection = Question.where(theme_id: self.theme_id).sample(QUESTION_MAX).pluck(:id)
  end
end