require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  describe 'should' do
    it 'returns index' do
      get users_path
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'updates user' do
      put user_path(user, user: { role: 'moderator' })
      expect(response).to redirect_to(root_url)
    end
  end
end
