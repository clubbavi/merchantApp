class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.integer :category_id
      t.integer :product_id
      t.integer :section_id
      t.integer :question_id

      t.timestamps
    end
  end
end
