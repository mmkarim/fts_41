require "rails_helper"

describe "Mailer spec" do
  let(:user){FactoryGirl.create :user}
  let(:email){UserMailer.remind_user user}

  it "should deliver to right user" do
    expect(email).to deliver_to user.email
  end

  it "should deliver from right address" do
   expect(email).to deliver_from "exam@fts.com"
  end

  it "should have right address" do
   expect(email).to have_subject I18n.t("create_exam_reminder")
  end
end
