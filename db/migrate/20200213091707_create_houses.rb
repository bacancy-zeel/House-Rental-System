# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :category
      t.string :house_type
      t.string :square_feet
      t.decimal :amount
      t.boolean :reserved, default: false
      t.boolean :approved, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
