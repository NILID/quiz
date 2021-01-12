class Question < ApplicationRecord
  audited
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  before_validation :normalize_answers

  validates :title, uniqueness: true,
                    presence:   true

  validate :check_uniq_answers
  validates :answer1,
            :answer2,
            :answer3,
            :answer4,
            presence:   true


  def answers
    [answer1, answer2, answer3, answer4]
  end

  private

  def normalize_answers
    # Make answers
    # - without empty charachters and carets
    # - with capitlize first character

    %i[answer1 answer2 answer3 answer4].each do |answer|
      self[answer] = self[answer].capitalize.gsub(/\s+/, '')
    end
  end

  def check_uniq_answers
    uniq_answers = self.answers.uniq
    errors.add(:answers, 'not uniqueness') if self.answers != uniq_answers
  end
end
