class CreateProductCollections < ActiveRecord::Migration
  def change
    create_table :product_collections do |t|
      t.string :name
      t.string :shopify_collection_handle
      t.text :description
	  t.integer :prominence
	  t.boolean :published, null: false, default: false

      t.timestamps null: false
    end
  end
end
