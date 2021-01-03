require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }

  describe 'question' do
    context 'should' do
      it 'have title' do
        question.title = ''
        expect(question.valid?).to be false
        expect(question.errors[:title]).not_to be_empty
      end

      it 'have uniq title' do
        new_question = Question.new
        new_question.title = question.title
        expect(new_question.valid?).to be false
        expect(new_question.errors[:title]).not_to be_empty
      end
    end
  end
end
