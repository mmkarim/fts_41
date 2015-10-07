class User < ActiveRecord::Base
  has_many :exams, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  rails_admin do
    exclude_fields :remember_created_at, :created_at, :reset_password_sent_at
  end
end
