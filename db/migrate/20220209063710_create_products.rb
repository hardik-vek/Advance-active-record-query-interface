# frozen_string_literal: true
class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :capacity
      t.boolean :is_active
      t.integer :status

      t.timestamps
    end
  end
end

