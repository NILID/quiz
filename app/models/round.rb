class Round < ApplicationRecord
  belongs_to :theme
  belongs_to :user
  has_and_belongs_to_many :questions
end
