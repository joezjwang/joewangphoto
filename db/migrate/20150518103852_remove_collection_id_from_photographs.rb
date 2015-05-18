class RemoveCollectionIdFromPhotographs < ActiveRecord::Migration
  def change
    remove_column :photographs, :collection_id, :integer
  end
end
