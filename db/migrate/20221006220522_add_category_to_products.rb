class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :category, null: true, foreign_key: true
    add_column :products, :brand, :string
    add_column :products, :quantity, :integer, default: '1', null: false
    add_column :products, :model, :string
  end
end
