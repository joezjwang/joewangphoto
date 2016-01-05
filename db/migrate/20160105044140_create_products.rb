class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :shopify_product_handle
      t.string :shopify_product_id

      t.timestamps null: false
    end
  end
end
