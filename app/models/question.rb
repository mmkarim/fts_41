class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :results
  has_many :exams, through: :results
  has_many :answers, dependent: :destroy

  validates :subject_id, presence: true
  validates :content, presence: true, length: {maximum: 80},
    uniqueness: true
  validates_associated :answers

  accepts_nested_attributes_for :answers,
    reject_if: proc {|attributes| attributes["content"].blank?},
    allow_destroy: true
end
