require "rails_helper"

describe Subject do
  describe "create" do
    context "with valid attributes" do
      subject {FactoryGirl.create :subject}
      it {is_expected.to be_valid}
    end
    context "with invalid attribute title" do
      let(:subject){Subject.create FactoryGirl.attributes_for :invalid_title}
      it {is_expected.not_to be_valid}
    end
    context "with invalid attribute duration" do
      let(:subject){Subject.create FactoryGirl.attributes_for :invalid_duration}
      it {is_expected.not_to be_valid}
    end
  end
end
