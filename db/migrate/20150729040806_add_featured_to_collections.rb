class AddFeaturedToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :featured, :boolean, :default => false
  end
end
