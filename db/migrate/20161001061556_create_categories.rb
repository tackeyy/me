class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
