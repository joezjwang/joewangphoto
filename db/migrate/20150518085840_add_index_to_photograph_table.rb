class AddIndexToPhotographTable < ActiveRecord::Migration
  def change
  	add_index :photographs, :collection_id 
  end
end
