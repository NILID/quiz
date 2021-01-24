class Question < ApplicationRecord
  audited

  belongs_to :author, class_name:    'User',
                      foreign_key:   'author_id'
  belongs_to :theme,  counter_cache: true

  has_many :answers, inverse_of: :question
  has_many :results
  has_many :rounds, through: :results

  validates :title, uniqueness: true,
                    presence:   true

  validates :answers, length: { is: 4, message: 'must be four' }

  accepts_nested_attributes_for :answers, reject_if: :all_blank

  def current_answer_id
    answers.where(correct: true).first.id
  end

end
