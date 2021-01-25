require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  let!(:question) { create(:question) }
  let!(:round)    { create(:round) }

  %i[admin moderator].each do |role|
    describe "#{role} should" do
      login_user(role)

      it 'returns index' do
        get questions_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end

      it 'returns show' do
        get question_path(question)
        expect(response).to be_successful
        expect(response).to render_template(:show)
      end

      it 'returns edit' do
        get edit_question_path(question)
        expect(response).to render_template(:edit)
      end

      it 'destroys' do
        expect{ delete question_path(question) }.to change(Question, :count).by(-1)
        expect(response).to redirect_to(questions_path)
      end

      it 'destroys with audits count +1' do
        expect{ delete question_path(question) }.to change(question.audits, :count).by(1)
      end

      it 'updates' do
        expect{ put question_path(question, question: { title: 'New title' })}
          .to change(question.audits, :count).by(1)
        question.reload
        expect(response).to redirect_to(question)
      end

      it 'returns new' do
        get new_question_path
        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end
  end

  %i[admin moderator user].each do |role|
    describe "#{role} should" do
      login_user(role)

      it 'returns check' do
        theme = create(:theme)
        questions = create_list(:question, 5, theme: theme)
        round = create(:round, theme: theme)
        get check_question_path(questions.first, answers_id: questions.first.current_answer_id, round_id: round.id), xhr: true
        expect(response).to be_successful
      end
    end
  end

  describe 'user should' do
    login_user(:user)

    after(:each) do
      expect(response).to redirect_to(root_path)
    end

    it 'returns index' do
      get questions_path
    end

    it 'returns show' do
      get question_path(question)
    end


    it 'not returns edit' do
      get edit_question_path(question)
    end

    it 'not destroys' do
      delete question_path(question)
      expect{ response }.to change(Question, :count).by(0)
    end

    it 'not updates' do
      put question_path(question, question: { title: 'New title' })
    end

    it 'not returns new' do
      get new_question_path
    end
  end

  describe 'unreg user should not' do
    after(:each) do
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns index' do
      get questions_path
    end

    it 'returns show' do
      get question_path(question)
    end

    it 'returns edit' do
      get edit_question_path(question)
    end

    it 'destroys' do
      expect{ delete question_path(question) }.to change(Question, :count).by(0)
    end

    it 'updates' do
      put question_path(question, question: { title: 'New title' })
    end

    it 'returns new' do
      get new_question_path
    end
  end
end