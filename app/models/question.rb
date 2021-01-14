class Question < ApplicationRecord
  audited

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :answers, inverse_of: :question

  validates :title, uniqueness: true,
                    presence:   true

  validates :answers, length: { is: 4, message: 'must be four' }

  accepts_nested_attributes_for :answers, reject_if: :all_blank
end
