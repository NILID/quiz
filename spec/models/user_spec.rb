require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'simple user' do
    let(:user) { create(:user) }

    context 'should' do
      it 'have user role by default after create' do
        expect(user.user?).to be true
      end

      it 'have user role from list' do
        expect { user.role= 'Superuser' }.to raise_error(ArgumentError)
      end

      it 'have uniq email' do
        new_user = build_stubbed(:user, email: user.email)
        expect(new_user.valid?).to be false
        expect(new_user.errors[:email]).not_to be_empty
      end
    end
  end
end
