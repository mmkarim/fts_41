require "rails_helper"

describe Question do
  describe "create" do
    context "with valid attributes" do
      let(:subject){FactoryGirl.create :subject}
      let(:question){FactoryGirl.create(:question, subject: subject)}
      it{is_expected.to be_valid}
    end

    context "with invalid attribute subject_id" do
      let(:question){Question.create FactoryGirl.attributes_for :invalid_subject_id}
      it{is_expected.not_to be_valid}
    end

    context "with invalid attribute content" do
      let(:question){Question.create FactoryGirl.attributes_for :invalid_content}
      it{is_expected.not_to be_valid}
    end
  end

  describe "belongs" do
    context "to many models" do
      it{should belong_to(:subject)}
    end
  end

  describe "association" do
    it{should have_many(:results)}
    it{should have_many(:exams).through(:results)}
    it{should have_many(:answers)}
  end

  describe "#answers" do
    let(:question){FactoryGirl.create :question}
    before {question.answers << FactoryGirl.create(:answer, question: question)}
    it{expect{question.destroy}.to change{Answer.count}.by -1}
  end

  describe "accept nested attributes for" do
    it{should accept_nested_attributes_for(:answers).allow_destroy(true)}
  end
end
