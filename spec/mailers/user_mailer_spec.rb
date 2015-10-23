require "spec_helper"

describe UserMailer do
  let!(:user) {double(User, email: "johndoe@test.com")}

  describe "successful registration email" do
    let!(:mail) {UserMailer.remind_user(user)}

    it {expect(mail.subject).to eq I18n.t("create_exam_reminder")}
    it {expect(mail.from).to eq ["exam@fts.com"]}
    it {expect(mail.to).to eq [user.email]}
  end
end
