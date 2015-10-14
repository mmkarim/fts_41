require "rails_helper"

describe Subject do
  let(:subject){FactoryGirl.create :subject}

  describe "create" do
    context "with valid attributes" do
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

  describe "validation" do
    it {should ensure_length_of(:title).is_at_most(Settings.max_lentgh_subject_title)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:duration)}
    it {should validate_uniqueness_of(:title)}
  end

  describe "association" do
    it {should have_many(:exams)}
    it {should have_many(:questions)}
  end

  describe "#questions" do
    before {subject.questions << FactoryGirl.create(:question, subject: subject)}
    it {expect{subject.destroy}.to change{Question.count}.by -1}
  end

  describe "#exams" do
    let(:user){FactoryGirl.create :user}
    before {subject.exams << FactoryGirl.create(:exam, subject: subject, user: user)}
    it {expect{subject.destroy}.to change{Exam.count}.by -1}
  end
end
