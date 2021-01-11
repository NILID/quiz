class Question < ApplicationRecord
  audited
  belongs_to :author, class_name: 'User', foreign_key: "author_id"

  validates :title, uniqueness: true,
                    presence:   true
end
