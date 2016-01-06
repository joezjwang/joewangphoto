class Product < ActiveRecord::Base
	validates :shopify_product_handle, :shopify_product_id, :name, presence: :true
end
