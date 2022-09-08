class CreateCommerces < ActiveRecord::Migration[7.0]
  def change
    create_table :commerces do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
  