class Subject < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true,
    length: {maximum: Settings.max_lentgh_subject_title},
    uniqueness: true
  validates :duration, presence: true
end
