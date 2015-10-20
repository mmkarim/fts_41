require "rails_helper"

describe Exam do
  describe "create" do
    let!(:user){FactoryGirl.create :user}
    let!(:subject){FactoryGirl.create :subject}
    let!(:exam){FactoryGirl.create :exam, user: user, subject: subject}

    context "with valid attributes" do
      it {is_expected.to be_valid}
    end
  end

  describe "association" do
    it {should have_many(:results)}
    it {should have_many(:questions)}
    it{should belong_to(:subject)}
    it{should belong_to(:user)}
  end

  describe "methods" do
    it "should pass with stubs" do
      exam = instance_double("Exam")
      allow(exam).to receive(:count_correct_answers) {0}
      expect(exam.count_correct_answers).to eq(0)
    end
  end
end
