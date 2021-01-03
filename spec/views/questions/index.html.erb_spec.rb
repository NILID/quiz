require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    @questions = create_list(:question, 2)
  end

  let(:user) { create(:user) }

  it "renders a list of questions" do
    enable_pundit(view, user)

    render
    # assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
