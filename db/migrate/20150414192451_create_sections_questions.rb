class CreateSectionsQuestions < ActiveRecord::Migration
  def change
    create_table :sections_questions, id: false do |t|
      t.belongs_to :section, index: true
      t.belongs_to :question, index: true
    end
  end
end
