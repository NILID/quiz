require 'rails_helper'

RSpec.describe "rounds/index", type: :view do
  before(:each) do
    assign(:rounds, [
      Round.create!(
        theme: nil,
        user: nil,
        current_answers: 2,
        wrong_answers: 3,
        finished: false
      ),
      Round.create!(
        theme: nil,
        user: nil,
        current_answers: 2,
        wrong_answers: 3,
        finished: false
      )
    ])
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
