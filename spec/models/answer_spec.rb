require "rails_helper"

describe Answer do
  describe "create" do
    context "with valid attributes" do
      let(:subject){FactoryGirl.create :subject}
      let(:question){FactoryGirl.create :question, subject_id: subject.id}
      let(:answer){FactoryGirl.create :answer, question_id: question.id}

      it{is_expected.to be_valid}
    end
  end

  describe "validation" do
    it{should validate_presence_of(:content)}
  end

  describe "belongings" do
    it{should belong_to(:question)}
  end
end
