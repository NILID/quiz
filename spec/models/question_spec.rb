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

      %i[answer1 answer2 answer3 answer4].each do |answer|
        it "have #{answer}" do
          question[answer] = ''
          expect(question.valid?).to be false
          expect(question.errors[answer]).not_to be_empty
        end
      end

      it 'have uniq answer' do
        question.answer1 = question.answer2
        expect(question.valid?).to be false
        expect(question.errors[:answers]).not_to be_empty
      end

      it 'have uniq answer with caret' do
        question.answer1 = "#{question.answer2}\r\n"
        expect(question.valid?).to be false
        expect(question.errors[:answers]).not_to be_empty
      end

      it 'have normalize anwsers after valid' do
        question.answer1 = 'ПЕРВЫЙ ОТвет'
        question.answer2 = '  второй Ответ \r'
        question.answer3 = ' третий \n'
        expect(question.valid?).to be true
        expect(question.answer1).to eq('Первый ответ')
        expect(question.answer2).to eq('Второй ответ')
        expect(question.answer3).to eq('Третий')
      end
    end
  end
end
