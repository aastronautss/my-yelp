class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, :user_id, :business_id
      t.text :body

      t.timestamps
    end

    add_index :reviews, [:user_id, :business_id]
  end
end
