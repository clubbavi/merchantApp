class CreateProductsSections < ActiveRecord::Migration
  def change
    create_table :products_sections, id: false do |t|
      t.belongs_to :products, index: true
      t.belongs_to :sections, index: true
    end
  end
end
