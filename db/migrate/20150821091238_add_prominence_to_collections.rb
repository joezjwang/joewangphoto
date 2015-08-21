class AddProminenceToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :prominence, :integer
  end
end
