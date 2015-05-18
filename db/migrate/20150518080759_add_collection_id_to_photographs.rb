class AddCollectionIdToPhotographs < ActiveRecord::Migration
  def change
    add_column :photographs, :collection_id, :integer
  end
end
