class ResultMaker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform exam_id
    exam = Exam.find exam_id
    ResultMailer.result(current_user,exam).deliver_now
  end
end
