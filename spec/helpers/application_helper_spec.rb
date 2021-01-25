require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "check plural for russian" do
    it "with count equal 1" do
      expect(helper.plural(1, 'error_done')).to eq("1 ошибка допущена")
    end

    it "with count equal 2" do
      expect(helper.plural(2, 'error_done')).to eq("2 ошибки допущены")
    end

    it "with count equal 10" do
      expect(helper.plural(10, 'error_done')).to eq("10 ошибок допущено")
    end
  end
end
