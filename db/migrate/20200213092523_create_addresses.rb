class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text :house_address
      t.string :state
      t.string :city
      t.string :area
      t.integer :pincode
      t.references :house, foreign_key: true
     
      t.timestamps
    end
  end
end
