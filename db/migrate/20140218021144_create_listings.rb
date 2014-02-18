class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :beds
      t.integer :baths
      t.integer :min_price
      t.integer :max_price
      t.references :area
    end
  end
end
