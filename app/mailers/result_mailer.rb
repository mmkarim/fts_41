class ResultMailer < ApplicationMailer
  def result user
    @user = user
    mail to: @user.email, subject: t("subject")
  end
end
