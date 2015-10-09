desc "send reminder email"

task send_reminder_email: :environment do
  Exam.each do |exam|
    UserMailer.remind_user(exam.user) unless exam.status == Settings.exam_state_finished
  end
end
