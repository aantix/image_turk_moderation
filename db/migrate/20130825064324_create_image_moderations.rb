class CreateImageModerations < ActiveRecord::Migration
  def change
    create_table :image_moderations do |t|
      t.integer :image_id
      t.string :choice

      t.timestamps
    end
  end
end
