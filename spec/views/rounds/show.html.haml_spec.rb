require 'rails_helper'

RSpec.describe "rounds/show", type: :view do
  before(:each) do
    @round = assign(:round, Round.create!(
      theme: nil,
      user: nil,
      current_answers: 2,
      wrong_answers: 3,
      finished: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
