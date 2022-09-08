# frozen_string_literal: true

class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :birthdate, :datetime, null: false
    add_column :users, :active_role, :integer, default: 0
    add_column :users, :role, :integer, default: 0
  end
end
