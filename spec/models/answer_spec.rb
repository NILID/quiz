require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { create(:question) }
  let(:answer)   { question.answers.first }

  describe 'answer' do
    context 'should' do
      it 'have title' do
        answer.title = ''
        expect(answer.valid?).to be false
        expect(answer.errors[:title]).not_to be_empty
      end

      it 'have uniq answer' do
        answer.title = question.answers.last.title
        expect(answer.valid?).to be false
        expect(answer.errors[:title]).not_to be_empty
      end

      it 'have uniq answer with caret' do
        answer.title = "#{question.answers.last.title}\r\n"
        expect(answer.valid?).to be false
        expect(answer.errors[:title]).not_to be_empty
      end

      it 'have normalize anwsers after valid' do
        answer.title = 'ПЕРВЫЙ ОТвет'
        expect(answer.valid?).to be true
        expect(answer.title).to eq('Первый ответ')

        answer.title = '  второй Ответ \r'
        expect(answer.valid?).to be true
        expect(answer.title).to eq('Второй ответ')

        answer.title = ' третий \n'
        expect(answer.valid?).to be true
        expect(answer.title).to eq('Третий')
      end
    end
  end
end
