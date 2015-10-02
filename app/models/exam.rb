class Exam < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  accepts_nested_attributes_for :results

  before_create :assign_questions

  private
  def assign_questions
    questions = self.subject.questions
    questions.each{|question| self.results.build question: question}
  end
end
