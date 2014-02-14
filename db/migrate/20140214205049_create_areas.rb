class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :title
      t.string :subtitle
      t.string :path
      t.text :boundary_encoded_points_string
      t.integer :level
      t.integer :se_id
      t.integer :se_parent_id
    end
  end
end
