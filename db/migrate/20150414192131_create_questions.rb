class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :question
      t.string :question_type
      t.string :answere

      t.timestamps
    end
  end
end
