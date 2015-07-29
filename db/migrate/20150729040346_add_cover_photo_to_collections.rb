class AddCoverPhotoToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :cover_photograph_id, :integer
  end
end
