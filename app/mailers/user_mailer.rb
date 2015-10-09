class UserMailer < ApplicationMailer
  def remind_user user
    @user = user
    mail to: user.email, subject: t "create_exam_reminder"
  end
end
