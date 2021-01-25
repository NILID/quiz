 require 'rails_helper'

RSpec.describe "/rounds", type: :request do
  let!(:round) { create(:round) }

  %i[admin moderator].each do |role|
    describe "#{role} should" do
      login_user(role)

      it 'returns index' do
        get rounds_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end
  end

  %i[admin moderator user].each do |role|
    describe "#{role} should" do
      login_user(role)

      it "renders show" do
        get round_path(round)
        expect(response).to be_successful
        expect(response).to render_template(:show)
      end

      it "return new" do
        expect {
          get new_round_url, params: { theme_id: create(:theme).id }
        }.to change(Round, :count).by(1)
        expect(response).to redirect_to(round_url(Round.last))
      end
    end
  end


  describe "User should" do
    login_user(:user)

    it "not returns index" do
      get rounds_url
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'unreg user should not' do
    after(:each) do
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns index' do
      get rounds_path
    end

    it 'returns show' do
      get round_path(round)
    end

  end
end
