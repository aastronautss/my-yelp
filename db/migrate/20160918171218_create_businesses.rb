class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, :address, :city, :state, :zip, :phone, :website_url

      t.timestamps
    end
  end
end
