class ResultMailer < ApplicationMailer
  def result(user,exam)
    @exam = exam
    @user = user
    mail to: @user.email, subject: t("subject")
  end
end
