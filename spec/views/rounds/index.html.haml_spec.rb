require 'rails_helper'

RSpec.describe "rounds/index", type: :view do
  before(:each) do
    @rounds = create_list(:round, 2)
  end

  it "renders a list of rounds" do
    render
    @rounds.each do |round|
      assert_select "tr>td", text: round.theme.title.to_s, count: 1
      assert_select "tr>td", text: round.user.email.to_s, count: 1
    end
    # two finished equal false
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
