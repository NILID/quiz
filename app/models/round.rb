class Round < ApplicationRecord
  audited

  before_create :create_questions_collection

  belongs_to :theme
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  serialize :questions_collection

  QUESTION_MAX = 10
  LIMIT_TIME   = 15

  def questions_part
    100 / questions_collection.count
  end

  def make_result!(question, answer_id)
    result = question.answers.where(correct: true).first.id.to_s == answer_id
    self.increment!(result ? :current_answers : :wrong_answers)

    self.results.create!( question_id: question.id,
                            answer_id: answer_id,
                              success: result,
          audit_comment: I18n.t((result ? 'results.success' : 'results.failed'), question: question.title))
    return result
  end

  private

  def create_questions_collection
    self.questions_collection = Question.where(theme_id: self.theme_id).sample(QUESTION_MAX).pluck(:id)
  end
end