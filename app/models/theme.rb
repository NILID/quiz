class Theme < ApplicationRecord
  validates  :title,    uniqueness:    true,
                        presence:      true

  belongs_to :question, optional:      true,
                        counter_cache: true
end
