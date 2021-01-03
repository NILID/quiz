require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'simple user' do
    let(:user) { create(:user) }

    context 'should' do
      it 'have user role by default after create' do
        expect(user.user?).to be true
      end
    end
  end
end
