class Result < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :round
end
