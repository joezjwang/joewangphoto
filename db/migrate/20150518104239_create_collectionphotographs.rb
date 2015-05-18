class CreateCollectionphotographs < ActiveRecord::Migration
  def change
    create_table :collectionphotographs do |t|
      t.integer :photograph_id
      t.integer :collection_id

      t.timestamps null: false
    end
    add_index :collectionphotographs, :photograph_id
    add_index :collectionphotographs, :collection_id
  end
end
