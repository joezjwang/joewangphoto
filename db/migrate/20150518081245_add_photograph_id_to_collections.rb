class AddPhotographIdToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :photograph_id, :integer
  end
end
