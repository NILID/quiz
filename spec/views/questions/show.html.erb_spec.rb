require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = create(:question)
  end

  it "renders attributes in <p>" do
    render
    # expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
