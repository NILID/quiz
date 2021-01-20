require 'rails_helper'

RSpec.describe "rounds/new", type: :view do
  before(:each) do
    assign(:round, Round.new(
      theme: nil,
      user: nil,
      current_answers: 1,
      wrong_answers: 1,
      finished: false
    ))
  end

  it "renders new round form" do
    render

    assert_select "form[action=?][method=?]", rounds_path, "post" do

      assert_select "input[name=?]", "round[theme_id]"

      assert_select "input[name=?]", "round[user_id]"

      assert_select "input[name=?]", "round[current_answers]"

      assert_select "input[name=?]", "round[wrong_answers]"

      assert_select "input[name=?]", "round[finished]"
    end
  end
end
