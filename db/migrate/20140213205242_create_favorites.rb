class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :listing_id
      t.references :user
    end
  end
end
