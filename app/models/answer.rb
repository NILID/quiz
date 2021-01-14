class Answer < ApplicationRecord
  belongs_to :question
  before_validation :normalize_answer

  validates :title, presence:   true

  private

  def normalize_answer
    # Make answers
    # - without empty characters and carets
    # - with capitlize first character

      self.title = self.title.gsub(/[\\r\\n]/, '').strip.capitalize
  end
end
