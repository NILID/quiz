class Theme < ApplicationRecord
  validates  :title, uniqueness: true,
                     presence:   true

  has_many :questions

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
