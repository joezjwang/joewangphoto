class AddCoverPhotoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cover_blogimage_id, :integer
  end
end
