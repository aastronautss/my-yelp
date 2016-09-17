class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :password_digest

      t.timestamps
    end

    add_index :users, :email
  end
end
