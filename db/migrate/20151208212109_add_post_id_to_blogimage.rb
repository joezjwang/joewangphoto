class AddPostIdToBlogimage < ActiveRecord::Migration
  def change
    add_column :blogimages, :post_id, :integer
    add_index :blogimages, :post_id
  end
end
