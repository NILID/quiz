require 'rails_helper'

RSpec.describe "rounds/index", type: :view do
  before(:each) do
    @rounds = create_list(:round, 2)
    @themes = create_list(:theme, 2)
  end

  it "renders a list of rounds" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
