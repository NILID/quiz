require 'rails_helper'

RSpec.describe 'Themes', type: :request do
  let!(:theme) { create(:theme) }

  %i[admin moderator].each do |role|
    describe "#{role} should" do
      login_user(role)

      it 'create a new Theme' do
        expect{ post themes_path(theme: attributes_for(:theme)), xhr: true}.to change(Theme, :count).by(1)
      end
    end
  end

  %i[admin moderator user].each do |role|
    describe "#{role} should" do
      login_user(role)

      it "renders show" do
        get theme_path(theme)
        expect(response).to be_successful
        expect(response).to render_template(:show)
      end
    end
  end


  describe 'User should' do
    login_user(:user)

    it 'not create a new Theme' do
      expect{ post themes_path(theme: attributes_for(:theme)), xhr: true}.to change(Theme, :count).by(0)
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'unreg user should not' do
    it "renders show" do
      get theme_path(theme)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end


    it 'create a new Theme' do
      expect{ post themes_path(theme: attributes_for(:theme)), xhr: true}.to change(Theme, :count).by(0)
    end
  end
end
