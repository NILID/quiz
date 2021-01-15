class Theme < ApplicationRecord
  validates  :title,    uniqueness:    true,
                        presence:      true

  has_many :questions
end
