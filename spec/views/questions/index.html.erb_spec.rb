require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    @questions = create_list(:question, 2)
  end

  it "renders a list of questions" do
    render
    # assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
