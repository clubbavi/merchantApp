class CreateCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :categories_products, id: false do |t|
      t.belongs_to :categories, index: true
      t.belongs_to :products, index: true
    end
  end
end
