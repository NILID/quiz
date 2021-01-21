require 'rails_helper'

RSpec.describe "rounds/show", type: :view do
  before(:each) do
    @round = create(:round)
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
