class Subject < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true, length: {maximum:50},
    uniqueness: true
  validates :duration, presence: true
end
