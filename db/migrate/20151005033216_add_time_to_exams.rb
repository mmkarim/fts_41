class AddTimeToExams < ActiveRecord::Migration
  def change
    add_column :exams, :time, :int
  end
end
