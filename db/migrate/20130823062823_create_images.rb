class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.string :image_path
      t.boolean :approved

      t.timestamps
    end
  end
end
