class AddDescriptionsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :description, :text
    add_column :businesses, :summary, :text
  end
end
