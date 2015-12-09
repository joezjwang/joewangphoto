class Blogimage < ActiveRecord::Base
	belongs_to :post
	has_attached_file :image, :styles => {:original => "1600x1600>",  :pc_large => "x720", :pc_small => "x480", :mobile_large => "480x"}, :convert_options => { :pc_large => '-quality 85 -interlace Plane', :pc_small => '-quality 85 -interlace Plane', :mobile_large => '-quality 80 -interlace Plane'},  :default_url => "/missing.png"
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/
  validates_attachment_size :image, :less_than => 10.megabytes
end
