class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating
      t.references :movie, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :movies
    add_foreign_key :reviews, :users
  end
end
