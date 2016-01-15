class ProductCollection < ActiveRecord::Base

	validates :name, :shopify_collection_handle, presence: :true


end
