class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :nickname
      t.string :title
      t.float :rating
      t.text :text
      t.integer :item_id

      t.timestamps
    end
  end
end
