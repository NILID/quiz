require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  let!(:question) { create(:question) }

  %i[admin moderator].each do |role|
    describe "#{role} should" do
      login_user(role)

      it 'returns edit' do
        get edit_question_path(question)
        expect(response).to render_template(:edit)
      end

      it 'destroys' do
        expect{ delete question_path(question) }.to change(Question, :count).by(-1)
        expect(response).to redirect_to(questions_path)
      end

      it 'updates' do
        put question_path(question, question: { title: 'New title' })
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
    end
  end

  describe 'user should' do
    login_user(:user)

    it 'not returns edit' do
      get edit_question_path(question)
      expect(response).to redirect_to(root_path)
    end

    it 'not destroys' do
      delete question_path(question)
      expect{ response }.to change(Question, :count).by(0)
      expect( response ).to redirect_to(root_path)
    end

    it 'not updates' do
      put question_path(question, question: { title: 'New title' })
      expect( response ).to redirect_to(root_path)
    end

    it 'not returns new' do
      get new_question_path
      expect( response ).to redirect_to(root_path)
    end
  end

  describe 'unreg user should' do
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

    describe 'not' do
      after(:each) do
        expect(response).to redirect_to(new_user_session_path)
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
end
