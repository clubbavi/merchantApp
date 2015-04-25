class CreateProductsQuestions < ActiveRecord::Migration
  def change
    create_table :products_questions do |t|
      t.belongs_to :product, index: true
      t.belongs_to :question, index: true
    end
  end
end
