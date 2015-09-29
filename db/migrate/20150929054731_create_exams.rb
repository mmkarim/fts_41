class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
