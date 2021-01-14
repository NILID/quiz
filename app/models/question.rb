class Question < ApplicationRecord
  audited

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :answers

  validates :title, uniqueness: true,
                    presence:   true

  validate :check_uniq_answers
  validates :answers, length: { is: 4, message: 'must be four' }

  accepts_nested_attributes_for :answers

  private

  def check_uniq_answers
    titles = self.answers.map{|a| a.title}
    uniq_titles = titles.uniq
    errors.add(:answers, 'not uniqueness') if titles != uniq_titles
  end
end
