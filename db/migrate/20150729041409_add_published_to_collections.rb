class AddPublishedToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :published, :boolean, :default => false
  end
end
