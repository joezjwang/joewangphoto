class RemovePhotographIdFromCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :photograph_id, :integer
  end
end
