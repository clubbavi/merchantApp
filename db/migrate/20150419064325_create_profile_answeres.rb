class CreateProfileAnsweres < ActiveRecord::Migration
  def change
    create_table :profile_answeres do |t|
      t.integer :profile_id
      t.integer :question_id
      t.string :answere

      t.timestamps
    end
  end
end
