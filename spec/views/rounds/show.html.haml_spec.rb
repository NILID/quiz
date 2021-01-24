require 'rails_helper'

RSpec.describe "rounds/show", type: :view do
  before(:each) do
    @round = create(:round)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/<a class="btn" data-remote="true" href="\/rounds\/#{@round.id}\?page=1">start<\/a>/)
  end
end

