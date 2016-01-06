class Product < ActiveRecord::Base
	validates :shopify_product_handle, :shopify_product_id, :name, presence: :true
	has_attached_file :product_photo, :styles => {:original => "1600x1600>",  :pc => "x400", :mobile => "300x"}, :convert_options => { :pc => '-quality 80 -interlace Plane', :mobile => '-quality 80 -interlace Plane'},  :default_url => "/missing.png"
	validates_attachment_content_type :product_photo, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/
	validates_attachment_size :product_photo, :less_than => 10.megabytes
end
