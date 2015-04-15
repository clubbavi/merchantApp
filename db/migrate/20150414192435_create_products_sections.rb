class CreateProductsSections < ActiveRecord::Migration
  def change
    create_table :products_sections, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :section, index: true
    end
  end
end
