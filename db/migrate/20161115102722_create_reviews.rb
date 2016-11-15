class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :restaurant, foreign_key: true

      t.timestamps null: false
    end
  end
end
