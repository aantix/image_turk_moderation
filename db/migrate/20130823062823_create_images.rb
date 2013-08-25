class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.string :image_path

      t.string :state, default: 'unprocessed'
      t.boolean :nude, default: false
      t.integer :turkee_task_id

      t.timestamps
    end
  end
end
