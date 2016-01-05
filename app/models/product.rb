class Product < ActiveRecord::Base
	validates :shopify_product_handle, :shopify_product_id, presence: :true
	before_create :extract_and_load_shopify_embed_data





	#Extract shopify handle and shopify product id from pasted embed code

	def extract_and_load_shopify_embed_data
	#check if embed_code is given, if not it was probably an update

	#extract data-product_handle=[] and https://joewangphoto.myshopify.com/cart/[]:1
		

	#if new record 

	#if record already exists


	end
end
