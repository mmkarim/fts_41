require "rails_helper"

describe Result do
  describe "belongs" do
    context "to many models" do
      it{should belong_to(:exam)}
      it{should belong_to(:question)}
      it{should belong_to(:answer)}
    end
  end

  describe "delegated to" do
    it{should delegate_method(:correct).to(:answer).with_prefix(:true)}
  end
end
