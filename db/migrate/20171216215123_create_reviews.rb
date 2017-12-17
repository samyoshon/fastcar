class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :buyer
      t.references :seller
      t.string :review
      t.integer :rating
      t.timestamps
    end
  end
end
