class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :content
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
