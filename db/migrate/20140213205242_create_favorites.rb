class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :listing
      t.references :user
    end
  end
end
