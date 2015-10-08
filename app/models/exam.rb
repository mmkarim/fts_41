class Exam < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  accepts_nested_attributes_for :results

  before_create :assign_questions

  def count_correct_answers
    results.select{|result| result.try :answer_correct}.count
  end

  private
  def assign_questions
    questions = self.subject.questions.active
    questions.each{|question| self.results.build question: question}
  end
end
