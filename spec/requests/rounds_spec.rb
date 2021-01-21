 require 'rails_helper'

RSpec.describe "/rounds", type: :request do
  let!(:round) { create(:round) }

  describe "User should" do
    login_user(:user)

    it "renders a successful response" do
      get rounds_url
      expect(response).to be_successful
    end

    it "renders a successful response" do
      get round_path(round)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end

    it "renders a successful response" do
      expect {
        get new_round_url, params: { theme_id: create(:theme).id }
      }.to change(Round, :count).by(1)
      expect(response).to redirect_to(round_url(Round.last))
    end
  end
end
