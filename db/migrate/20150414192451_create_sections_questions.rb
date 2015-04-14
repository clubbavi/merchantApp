class CreateSectionsQuestions < ActiveRecord::Migration
  def change
    create_table :sections_questions, id: false do |t|
      t.belongs_to :sections, index: true
      t.belongs_to :questions, index: true
    end
  end
end
