class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.string :image_path

      t.boolean :processed, default: false
      t.boolean :approved, default: false
      t.boolean :nude, default: false

      t.timestamps
    end
  end
end
